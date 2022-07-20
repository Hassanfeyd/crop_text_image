import 'dart:convert';

import 'package:croping_images/UI/home/project.dart';
import 'package:croping_images/models/project.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Project_list extends StatefulWidget {
  const Project_list({Key? key}) : super(key: key);

  @override
  State<Project_list> createState() => _Project_listState();
}

class _Project_listState extends State<Project_list> {
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
    getdata();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "project list",
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateFunction()));
            },
            child: Text(
              "create new",
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
                //primary: Colors.white,
                fixedSize: const Size(150, 100),
                side: BorderSide(width: 1, color: Colors.white),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        ],
      ),
      body: _project_list.length == 0
          ? Center(
              child: Text("loading data"),
            )
          : ListView.builder(
              itemCount: _project_list.length,
              itemBuilder: (context, _index) {
                return Center(
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.album),
                          title: Text(
                              _project_list[_index].projectname.toString()),
                          subtitle: Text("project type :" +
                              _project_list[_index].inputType.toString() +
                              " " +
                              _project_list[_index].outputType.toString()),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              child: const Text('Edit Name'),
                              onPressed: () {/* ... */},
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text('Delete'),
                              onPressed: () {/* ... */},
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}
