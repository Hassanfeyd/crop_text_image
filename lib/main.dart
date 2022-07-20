import 'package:croping_images/UI/Texts/custom_text_selection_file.dart';
import 'package:croping_images/UI/Texts/textcropp.dart';
import 'package:croping_images/UI/home/project.dart';
import 'package:croping_images/UI/home/project_list.dart';
import 'package:croping_images/UI/images/image_classify.dart';
import 'package:flutter/material.dart';

import 'UI/images/image_croping.dart';
import 'colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const bool ALO = true;
  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Palette.kToDark),
      home: const DefaultTabController(length: 2, child: Project_list()
          /* Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              bottom: const TabBar(
                labelColor: Palette.kToDark,
                tabs: [Tab(text: 'Images'), Tab(text: 'Text')],
              ),
              title: const Center(
                child: Text(
                  'Crroping project',
                  style: TextStyle(color: Palette.kToDark),
                ),
              )),
          body: const TabBarView(
            children: [ImageCrop(), TextCrop()],
          ),
        ),*/
          ),
    );
  }
}
