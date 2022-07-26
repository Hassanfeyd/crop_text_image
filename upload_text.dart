import 'dart:convert';

import 'package:croping_images/UI/home/project.dart';
import 'package:croping_images/models/project.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Upload_Create extends StatefulWidget {
  const Upload_Create({Key? key}) : super(key: key);

  @override
  State<Upload_Create> createState() => Upload_CreateState();
}

class Upload_CreateState extends State<Upload_Create> {
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
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      Text(
                        'New Function',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xff545454),
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            fontFamily: "Montserrat"),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff5E63E5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
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
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        //alignment: Alignment.center,
                        child: Icon(
                          Icons.save_alt,
                          size: 100,
                          color: Color.fromARGB(255, 142, 144, 201),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
                        child: Text(
                            "Drag and drop a structured text file here or click to open the file dialog. Supported file types are CSV and TSV."),
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
