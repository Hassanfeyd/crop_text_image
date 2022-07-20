import 'dart:convert';

import 'package:croping_images/UI/images/image_classify.dart';
import 'package:croping_images/UI/images/image_croping.dart';
import 'package:croping_images/models/project.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../Texts/textcropp.dart';

class CreateFunction extends StatefulWidget {
  const CreateFunction({Key? key}) : super(key: key);

  @override
  State<CreateFunction> createState() => _CreateFunctionState();
}

class _CreateFunctionState extends State<CreateFunction> {
  String inputtype = "image";
  String outputtype = "detect";
  late List<Labels> labels = [];
  late List<Color> colors = [Colors.red, Colors.amber, Colors.green];
  late project projet;

  final labelcontrooler = TextEditingController();
  final projectnamecontroller = TextEditingController();
  late http.Response _response;
  final uri = Uri.parse('https://dry-harbor-61627.herokuapp.com/project/add');
  final headers = {'Content-Type': 'application/json'};
  late Map<String, dynamic> body;
  final encoding = Encoding.getByName('utf-8');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("create new function"),
        actions: [
          IconButton(
              onPressed: (() async {
                final Response = await http.post(uri,
                    headers: headers,
                    body: json.encode({
                      "projectname": projectnamecontroller.text,
                      "input_type": inputtype,
                      "output_type": outputtype,
                      "labels": labels
                    }),
                    encoding: encoding);
                if (Response != null) {
                  projectnamecontroller.clear();
                  labels.clear();
                  var p = project.fromJson(jsonDecode(Response.body));
                  print(p.inputType);
                  if (p.inputType == 'image' && p.outputType == "classify") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Image_classify(
                                data:
                                    project.fromJson(jsonDecode(Response.body)),
                              )),
                    );
                  } else if (p.inputType == 'image' &&
                      p.outputType == "detect") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImageCrop(
                                data:
                                    project.fromJson(jsonDecode(Response.body)),
                              )),
                    );
                  } else if (p.inputType == 'text' &&
                      p.outputType == "detect") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TextCrop(
                              data: project.fromJson(jsonDecode(Response.body)),
                              colors: colors)),
                    );
                  }
                }
              }),
              icon: Icon(Icons.done_outline_outlined))
        ],
      ),
      body: SingleChildScrollView(
          child: Expanded(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(255, 61, 60, 244), width: 1),
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              height: 60,
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 61, 60, 244),
                    ),
                    child: const Icon(
                      Icons.abc_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: 230,
                    child: Center(
                      child: TextField(
                        controller: projectnamecontroller,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.comfortaa(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          hintText: 'project name',
                          hintStyle: GoogleFonts.comfortaa(color: Colors.black),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    // height: 160,
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 61, 60, 244),
                          width: 1),
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'choose the data type',
                          style: GoogleFonts.comfortaa(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: ListTile(
                                title: const Text('Image'),
                                leading: Radio<String>(
                                  value: "image",
                                  groupValue: inputtype,
                                  onChanged: (String? value) {
                                    setState(() {
                                      inputtype = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ),
                            Flexible(
                              child: ListTile(
                                title: const Text('Text'),
                                leading: Radio<String>(
                                  value: 'text',
                                  groupValue: inputtype,
                                  onChanged: (String? value) {
                                    setState(() {
                                      inputtype = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 61, 60, 244),
                          width: 1),
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "output type",
                          style: GoogleFonts.comfortaa(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: ListTile(
                                title: const Text('Classify'),
                                leading: Radio<String>(
                                  value: 'classify',
                                  groupValue: outputtype,
                                  onChanged: (String? value) {
                                    setState(() {
                                      outputtype = value.toString();
                                    });
                                  },
                                ),
                              ),
                            ),
                            Flexible(
                              child: ListTile(
                                title: const Text('detect'),
                                leading: Radio<String>(
                                  value: 'detect',
                                  groupValue: outputtype,
                                  onChanged: (String? value) {
                                    setState(() {
                                      outputtype = value.toString();
                                    });
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 61, 60, 244),
                          width: 1),
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: Column(children: [
                      Center(
                        child: Text(
                          "add labels",
                          style: GoogleFonts.comfortaa(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: TextField(
                              controller: labelcontrooler,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                hintText: 'label',
                              ),
                            ),
                          ),
                          Flexible(
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      labels.add(new Labels(
                                          name: labelcontrooler.text));
                                    });
                                    labelcontrooler.clear();
                                    print(labels);
                                  },
                                  icon: const Icon(Icons.add)))
                        ],
                      )
                    ]),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 61, 60, 244),
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                  child: Text(
                    "Add project".toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: (() async {
                    final Response = await http.post(uri,
                        headers: headers,
                        body: json.encode({
                          "projectname": projectnamecontroller.text,
                          "input_type": inputtype,
                          "output_type": outputtype,
                          "labels": labels
                        }),
                        encoding: encoding);
                    if (Response != null) {
                      projectnamecontroller.clear();
                      labels.clear();
                      var p = project.fromJson(jsonDecode(Response.body));
                      print(p.inputType);
                      if (p.inputType == 'image' &&
                          p.outputType == "classify") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Image_classify(
                                    data: project
                                        .fromJson(jsonDecode(Response.body)),
                                  )),
                        );
                      } else if (p.inputType == 'image' &&
                          p.outputType == "detect") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImageCrop(
                                    data: project
                                        .fromJson(jsonDecode(Response.body)),
                                  )),
                        );
                      } else if (p.inputType == 'text' &&
                          p.outputType == "detect") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TextCrop(
                                    data: project
                                        .fromJson(jsonDecode(Response.body)),
                                    colors: colors,
                                  )),
                        );
                      }
                    }
                  }),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

enum SingingCharacter { lafayette, jefferson }

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Image'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.lafayette,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Thomas Jefferson'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.jefferson,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
