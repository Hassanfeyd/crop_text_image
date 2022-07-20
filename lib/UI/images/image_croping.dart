import 'dart:convert';
import 'dart:io';

import 'package:croping_images/models/imagedetect.dart';
import 'package:croping_images/models/project.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageCrop extends StatefulWidget {
  ImageCrop({Key? key, required this.data}) : super(key: key);
  final project data;

  @override
  State<ImageCrop> createState() => _ImageCropState();
}

class _ImageCropState extends State<ImageCrop> {
  final ImagePicker _picker = ImagePicker();
  late List<XFile>? images;
  bool ispicked = false;
  late String selectedlabel;
  late CroppedFile _croppedFile;
  XFile? _pickedFile;
  late List<ArrBoxes> boxes = [];
  final uri =
      Uri.parse('https://dry-harbor-61627.herokuapp.com/imagedetect/add');
  final headers = {'Content-Type': 'application/json'};
  late Map<String, dynamic> body;
  late List<Labels> labels;
  final encoding = Encoding.getByName('utf-8');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.data != null) {
      Labels l = widget.data.labels![1];
      selectedlabel = l.name.toString();
      labels = widget.data.labels!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('image detect')),
        ),
        body: ispicked ? showimage() : imagepicker());
  }

  Widget imagepicker() {
    return Center(
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: SizedBox(
          width: 320.0,
          height: 300.0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DottedBorder(
                    radius: const Radius.circular(12.0),
                    borderType: BorderType.RRect,
                    dashPattern: const [8, 4],
                    color: Theme.of(context).highlightColor.withOpacity(0.4),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image,
                            color: Theme.of(context).highlightColor,
                            size: 80.0,
                          ),
                          const SizedBox(height: 24.0),
                          Text(
                            'Upload an image to start',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    color: Theme.of(context).highlightColor),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: ElevatedButton(
                  onPressed: () {
                    _uploadImages();
                  },
                  child: const Text('Upload'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _uploadImages() async {
    final List<XFile>? pickedFileList = await _picker.pickMultiImage();
    setState(() {
      images = pickedFileList;
      ispicked = true;
    });
  }

  Widget showimage() {
    return images?.length == 0
        ? Container(
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Done'),
              ),
            ),
          )
        : GridView.builder(
            itemCount: images!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1),
            itemBuilder: (_, int index) {
              return InkWell(
                onTap: () async {
                  final croppedFile = await ImageCropper().cropImage(
                    sourcePath: images![index].path,
                    compressFormat: ImageCompressFormat.jpg,
                    compressQuality: 100,
                  );
                  if (croppedFile != null) {
                    setState(() {
                      _croppedFile = croppedFile;
                    });
                    _showOptions(
                        context, croppedFile.path, images![index].path);
                  }
                },
                onLongPress: () {},
                child: Card(
                  borderOnForeground: true,
                  margin: EdgeInsets.all(15),
                  child: GridTile(
                      child: Container(
                          child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                                child: ElevatedButton(
                              child: Text('Done cropping'),
                              onPressed: () {
                                addimagedetect(index);
                              },
                            )),
                            Flexible(
                                child: ElevatedButton(
                              child: Text('start cropping'),
                              onPressed: () async {
                                final croppedFile =
                                    await ImageCropper().cropImage(
                                  sourcePath: images![index].path,
                                  compressFormat: ImageCompressFormat.jpg,
                                  compressQuality: 100,
                                );
                                if (croppedFile != null) {
                                  setState(() {
                                    _croppedFile = croppedFile;
                                  });
                                  _showOptions(context, croppedFile.path,
                                      images![index].path);
                                }
                              },
                            ))
                          ],
                        ),
                      ),
                      Image.file(
                        File(images![index].path),
                        fit: BoxFit.cover,
                        height: 150,
                        width: 150,
                      ),
                    ],
                  ))),
                ),
              );
            });
  }

  void _cropImage(String string) async {
    if (_pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: _pickedFile!.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
      );
      if (croppedFile != null) {
        setState(() {
          _croppedFile = croppedFile;
        });
      }
    }
  }

  void addimagedetect(index) async {
    final Response = await http.post(uri,
        headers: headers,
        body: json.encode(Imagedetect(
                arrBoxes: boxes,
                idproject: widget.data.id,
                fileName: images![index].path)
            .toJson()),
        encoding: encoding);

    if (Response.statusCode == 200) {
      print("addedd sucsfuly" + widget.data.id.toString());

      setState(() {
        images!.removeAt(index);
        boxes.clear();
      });
    }
  }

  void _showOptions(BuildContext context, String filepath, String source) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 500,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text('assign tag to your screen'),
              Image.file(
                File(filepath),
                fit: BoxFit.cover,
                height: 250,
                width: 250,
              ),
              DropdownButton(
                  value: selectedlabel,
                  items: labels.map((value) {
                    return DropdownMenuItem<String>(
                      value: value.name,
                      child: Text(
                        value.name.toString(),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 61, 60, 224),
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  }).toList(),
                  onChanged: (valuex) {
                    print(valuex);
                    boxes.add(ArrBoxes(
                        height: 10,
                        width: 12,
                        name: valuex.toString(),
                        x: 9,
                        y: 8,
                        source: source));
                    print(boxes);
                  }),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent.shade400,
                  ),
                  child: const Text('done'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  /* Widget Selectlable(){
    return  PopupMenuButton<String>(
              // Callback that sets the selected popup menu item.
              onSelected: (String item) {
                setState(() {
                  selectedlabel = item;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>[
                 labels.forEach((element){
                 return   PopupMenuItem<String>(
                      value: element,
                      child: Text(element),
                    );
                 })
                    
                  ]);
  }*/
}
