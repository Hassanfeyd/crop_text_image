import 'dart:convert';

import 'package:croping_images/UI/home/project.dart';
import 'package:croping_images/models/project.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Function_Create extends StatefulWidget {
  const Function_Create({Key? key}) : super(key: key);

  @override
  State<Function_Create> createState() => _Function_CreateState();
}

class _Function_CreateState extends State<Function_Create> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        backgroundColor: const Color(0xff5E63E5),
        actions: [
          Container(
            margin: const EdgeInsets.all(13),
            child: const CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                "https://cyber-privacy.net/wp-content/uploads/thispersondoesnotexist.com-image02-1024x1024.jpg",
              ),
            ),
          ),
        ],
        title: const Text(
          'Cosmalitycs',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18,
              fontFamily: "Montserrat"),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(7),
              child: Text(
                'Create New Funnctions',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    fontFamily: "Montserrat"),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(7),
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.play_for_work_outlined,
                          color: Color(0xff5E63E5),
                        ),
                        backgroundColor: Colors.grey[200],
                      ),
                      Text("import")
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(7),
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.bookmark,
                          color: Color(0xffDD6174),
                        ),
                        backgroundColor: Colors.grey[200],
                      ),
                      Text("labels")
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(7),
                    child: Column(children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.upload_sharp,
                          color: Color(0xffDD6174),
                        ),
                        backgroundColor: Colors.grey[200],
                      ),
                      Text("Upload")
                    ])),
              ],
            ),
            Container(
              margin: EdgeInsets.all(7),
              child: Text(
                'Input',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    fontFamily: "Montserrat"),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(7),
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.file_copy,
                          color: Color(0xff5E63E5),
                        ),
                        backgroundColor: Colors.grey[200],
                      ),
                      Text("Text")
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(7),
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.image,
                          color: Color(0xff5E63E5),
                        ),
                        backgroundColor: Colors.grey[200],
                      ),
                      Text("Image")
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(7),
                    child: Column(children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.volume_up,
                          color: Color(0xff5E63E5),
                        ),
                        backgroundColor: Colors.grey[200],
                      ),
                      Text("Audio")
                    ])),
              ],
            ),
            Container(
              margin: EdgeInsets.all(7),
              child: Text(
                'Outnput',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    fontFamily: "Montserrat"),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(7),
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.class_,
                          color: Color(0xff5E63E5),
                        ),
                        backgroundColor: Colors.grey[200],
                      ),
                      Text("Classify")
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(7),
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.search,
                          color: Color(0xff5E63E5),
                        ),
                        backgroundColor: Colors.grey[200],
                      ),
                      Text("Search")
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(7),
                    child: Column(children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.location_searching_outlined,
                          color: Color(0xff5E63E5),
                        ),
                        backgroundColor: Colors.grey[200],
                      ),
                      Text("Detect")
                    ])),
              ],
            ),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border: Border.all(
                      color: Color.fromARGB(255, 215, 215, 215),
                      width: 1,
                      style: BorderStyle.solid),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: Offset(4, 8), // Shadow position
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Image Classification",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            fontFamily: "Montserrat"),
                      ),
                      Text(
                        "Train a function to categorize image using labels you provide",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "output Labels",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            fontFamily: "Montserrat"),
                      ),
                      Text(
                        "List the labels (also known as classes) used to crtegorized your data",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600),
                      ),
                      Container(
                          margin: EdgeInsets.all(8.0),
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            border: Border.all(
                                color: Color.fromARGB(74, 19, 3, 142),
                                width: 1,
                                style: BorderStyle.solid),
                          ),
                          child: TextField(
//controller: emailField,

                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'enter label name',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                              border: InputBorder.none,
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.all(8.0),
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            border: Border.all(
                                color: Color.fromARGB(74, 19, 3, 142),
                                width: 1,
                                style: BorderStyle.solid),
                          ),
                          child: TextField(
//controller: emailField,

                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'enter label name',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                              border: InputBorder.none,
                            ),
                          )),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        decoration: BoxDecoration(
                          color: const Color(0xff5E63E5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Create Function",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ButtonStyle(
                            alignment: Alignment.center,
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xff5E63E5)),
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home, color: const Color(0xff5E63E5)),
            label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_tree_outlined,
                color: const Color(0xff5E63E5)),
            label: "Project"),
        BottomNavigationBarItem(
            icon: Icon(Icons.explore, color: const Color(0xff5E63E5)),
            label: "Explore"),
      ]),
    );
  }
}
