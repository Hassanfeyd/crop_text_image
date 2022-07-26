import 'dart:convert';

import 'package:croping_images/UI/home/project.dart';
import 'package:croping_images/models/project.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Text_labeling extends StatefulWidget {
  const Text_labeling({Key? key}) : super(key: key);

  @override
  State<Text_labeling> createState() => Text_labelingState();
}

class Text_labelingState extends State<Text_labeling> {
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.all(7),
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.tire_repair_rounded,
                          color: Color(0xff5E63E5),
                        ),
                        backgroundColor: Colors.grey[200],
                      ),
                      Text("Train")
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(7),
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.people_alt_outlined,
                          color: Color(0xffDD6174),
                        ),
                        backgroundColor: Colors.grey[200],
                      ),
                      Text("Members")
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(7),
                    child: Column(children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.book,
                          color: Color(0xffDD6174),
                        ),
                        backgroundColor: Colors.grey[200],
                      ),
                      Text("labels")
                    ])),
                Container(
                    margin: EdgeInsets.all(7),
                    child: Column(children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.upload,
                          color: Color(0xffDD6174),
                        ),
                        backgroundColor: Colors.grey[200],
                      ),
                      Text("Upload")
                    ])),
                Container(
                    margin: EdgeInsets.all(7),
                    child: Column(children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.save_alt,
                          color: Color(0xffDD6174),
                        ),
                        backgroundColor: Colors.grey[200],
                      ),
                      Text("Import")
                    ])),
              ],
            ),
            Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border: Border.all(
                      color: Color.fromARGB(255, 219, 212, 212),
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
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Export",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xff5E63E5)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            border:
                                Border.all(color: Color(0xff5E63E5), width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: IconButton(
                          alignment: Alignment.center,
                          onPressed: () {},
                          icon: Icon(
                            Icons.list_alt,
                            color: Color(0xff5E63E5),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            border:
                                Border.all(color: Color(0xff5E63E5), width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: IconButton(
                          alignment: Alignment.center,
                          onPressed: () {},
                          icon: Icon(
                            Icons.menu,
                            color: Color(0xff5E63E5),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            border:
                                Border.all(color: Color(0xff5E63E5), width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: IconButton(
                          alignment: Alignment.center,
                          onPressed: () {},
                          icon: Icon(
                            Icons.message,
                            color: Color(0xff5E63E5),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(3, 3, 0, 3),
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            border:
                                Border.all(color: Color(0xff5E63E5), width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: IconButton(
                          alignment: Alignment.center,
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete,
                            color: Color(0xff5E63E5),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.all(10),
                child: TextButton(
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        BorderSide(width: 1, color: Color(0xff70AD47)),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    child: Text(
                      "Exported Successfully",
                      style: TextStyle(color: Color(0xff70AD47)),
                    ),
                    onPressed: () {})),
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                height: 310,
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
                child: Container(
                  margin: EdgeInsets.all(5),
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    border: Border.all(
                        color: Color.fromARGB(255, 157, 157, 157),
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
                  child: SelectableText(
                      '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."'),
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
