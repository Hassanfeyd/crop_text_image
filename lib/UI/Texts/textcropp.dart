import 'dart:convert';
import 'dart:io';

import 'package:croping_images/UI/Texts/custom_text_selection_file.dart';
import 'package:croping_images/models/textdetect.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';

import '../../models/project.dart';
import 'selectbale.dart';

class TextCrop extends StatefulWidget {
  const TextCrop({Key? key, required this.data, required this.colors})
      : super(key: key);
  final project data;
  final List<Color> colors;

  @override
  State<TextCrop> createState() => _TextCropState();
}

class _TextCropState extends State<TextCrop> {
  List<String> selectedlist = [];
  List<Color> colors = [];
  List<String> listindex = [];
  bool Select = true;
  String selectedtext = '';
  int end = 0;
  int start = 0;
  bool check(String word) {
    var r = false;
    selectedlist.forEach((element) {
      element.split(" ").forEach((el) {
        if (el.compareTo(word) == 0) {
          r = true;
        }
      });
    });
    return r;
  }

  final uri =
      Uri.parse('https://dry-harbor-61627.herokuapp.com/textdetect/add');
  final headers = {'Content-Type': 'application/json'};
  final encoding = Encoding.getByName('utf-8');
  List<labelses> lables = [];
  bool ispicked = false;
  late String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('text detect'),
          actions: [
            TextButton(
                onPressed: () {
                  setState(() {
                    Select = true;
                    selectedlist.clear();
                    listindex.clear();
                  });
                },
                child: Text(
                  'add selection',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: Center(
          child: ispicked ? SelectedText() : imagepicker(),
        ));
  }

  Widget SelectedText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              addtextdetect(context);
            },
            child: const Text('Done')),
        SizedBox(
          height: 10,
        ),
        selectedlist.isEmpty
            ? Selectedfirst(context)
            : Expanded(
                child: TextSelectionTheme(
                  data: TextSelectionThemeData(
                      selectionColor: Colors.yellowAccent,
                      selectionHandleColor: Colors.red),
                  child: DynamicTextHighlighting(
                    text: text,
                    highlights: selectedlist,
                    color: colors,
                    toolbarOptions: const ToolbarOptions(copy: true),
                    onSelectionChanged: (selection, cause) {
                      SelectionChangedCause? v = cause;

                      print(selection.start.compareTo(selection.end));
                      if (text.substring(selection.start, selection.end) !=
                          "") {
                        setState(() {
                          selectedtext =
                              text.substring(selection.start, selection.end);
                        });

                        start = selection.start;
                        end = selection.end;
                      }
                      print(v);

                      if (v == SelectionChangedCause.toolbar) {
                        setState(() {
                          selectedlist.add(selectedtext);
                          colors.add(Colors.amber);
                        });
                        listindex.add('start index : ' +
                            start.toString() +
                            '  end index' +
                            end.toString());
                        _showOptions(context);
                      }
                    },
                  ),
                ),
              ),
      ],
    );
  }

  Widget Display() {
    return ListView.builder(
        itemCount: selectedlist.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(padding: EdgeInsets.all(5)),
              Text(
                selectedlist[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(listindex[index]),
              Divider(),
            ],
          );
        });
  }

  Widget Selectedfirst(context) {
    return Expanded(
      child: SelectableText(text,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
          ),
          toolbarOptions: const ToolbarOptions(copy: true),
          onSelectionChanged: (selection, cause) {
        SelectionChangedCause? v = cause;

        print(selection.start.compareTo(selection.end));
        if (text.substring(selection.start, selection.end) != "") {
          setState(() {
            selectedtext = text.substring(selection.start, selection.end);
          });

          start = selection.start;
          end = selection.end;
        }
        print(v);

        if (v == SelectionChangedCause.toolbar) {
          setState(() {
            selectedlist.add(selectedtext);
            colors.add(Colors.amber);
          });
          listindex.add('start index : ' +
              start.toString() +
              '  end index' +
              end.toString());
          _showOptions(context);
        }
      }),
    );
  }

  void _showOptions(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
            height: 460,
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
              itemCount: widget.data.labels!.length,
              itemBuilder: (context, _index) {
                return Center(
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.album),
                          title: Text(
                            widget.data.labels![_index].name.toString(),
                            style: TextStyle(color: widget.colors[_index]),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text("assign"),
                              onPressed: () {
                                lables.add(labelses(
                                    end: end,
                                    start: start,
                                    text: selectedtext,
                                    label: widget.data.labels![_index].name
                                        .toString()));
                                setState(() {
                                  colors[selectedlist.indexOf(selectedtext)] =
                                      widget.colors[widget.data.labels!.indexOf(
                                          widget.data.labels![_index])];
                                });
                                Navigator.pop(context);
                              },
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ));
      },
    );
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
                            Icons.text_snippet_outlined,
                            color: Theme.of(context).highlightColor,
                            size: 80.0,
                          ),
                          const SizedBox(height: 24.0),
                          Text(
                            'Upload an your text',
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
                    _pickFile();
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

  void _pickFile() async {
    // opens storage to pick files and the picked file or files
    // are assigned into result and if no file is chosen result is null.
    // you can also toggle "allowMultiple" true or false depending on your need
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);

    // if no file is picked
    if (result == null) return;

    // we get the file from result object
    final file = result.files.first;

    _openFile(file);
  }

  void _openFile(PlatformFile file) async {
    final allo = File(file.path.toString());

    allo.readAsString().then((value) {
      setState(() {
        text = value;
        ispicked = true;
      });
    });
  }

  void addtextdetect(BuildContext context) async {
    final Response = await http.post(uri,
        headers: headers,
        body: json.encode(
            Textdetect(text: text, idProject: widget.data.id, labels: lables)
                .toJson()),
        encoding: encoding);
    if (Response.body != null) {
      Navigator.pop(context);
    }
  }
}
