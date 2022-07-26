import 'dart:convert';

import 'package:croping_images/UI/home/project.dart';
import 'package:croping_images/models/project.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Function_list extends StatefulWidget {
  const Function_list({Key? key}) : super(key: key);

  @override
  State<Function_list> createState() => _Function_listState();
}

class _Function_listState extends State<Function_list> {
  late List<project> _project_list = [];
  final uri = Uri.parse('https://dry-harbor-61627.herokuapp.com/');
  final headers = {'Content-Type': 'application/json'};

  void getdata() async {
    var response = await http.get(uri, headers: headers);
    if (response.body != null) {
      var data = jsonDecode(response.body) as List;

      data.forEach((element) {
        print(element);
        setState(() {
          _project_list.add(project.fromJson(element));
        });
      });
    }
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    getdata();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            Container(
              padding: EdgeInsets.all(20),
              height: 530,
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
              child: _project_list.length == 0
                  ? Center(
                      child: Text("loading data"),
                    )
                  : ListView.builder(
                      itemCount: _project_list.length,
                      itemBuilder: (context, _index) {
                        return Container(
                          height: 130,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 11,
                                    decoration: const BoxDecoration(
                                        color: const Color(0xff5E63E5),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20.0),
                                            bottomRight:
                                                Radius.circular(20.0))),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text(
                                      _project_list[_index]
                                          .projectname
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: const Icon(
                                      Icons.more_vert_outlined,
                                      size: 25,
                                      color: Color(0xFF5F6368),
                                    ),
                                  ),
                                ],
                              )),
                        );
                      }),
            )
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
