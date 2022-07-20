import 'package:croping_images/UI/Texts/selectbale.dart';
import 'package:flutter/material.dart';

class DTHExample extends StatefulWidget {
  const DTHExample({Key? key}) : super(key: key);

  @override
  _DTHExampleState createState() => _DTHExampleState();
}

class _DTHExampleState extends State<DTHExample> {
  String text =
      'This is a demo text, the specified texts will be highlighted. demo This';
  String selectedtext = "";
  late List<String> highlights = [];
  late List<Color> colors = [];
  late List<String> lwiynat = ["red", "yellow", "green"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: highlights.isEmpty
            ? Selectedfirst(context)
            : DynamicTextHighlighting(
                text: text,
                highlights: highlights,
                color: colors,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
                caseSensitive: false,
                toolbarOptions: const ToolbarOptions(copy: true),
                onSelectionChanged: (selection, cause) {
                  try {
                    SelectionChangedCause? v = cause;
                    print(selection.start);
                    print(v);
                    if (text.substring(selection.start, selection.end) != "") {
                      setState(() {
                        selectedtext =
                            text.substring(selection.start, selection.end);
                      });
                    }
                    print(selectedtext);
                    if (v == SelectionChangedCause.toolbar) {
                      print(selectedtext);
                      _showOptions(context);

                      print(highlights);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
              ),
      ),
    );
  }

  Widget Selectedfirst(context) {
    return SelectableText(
      text,
      style: TextStyle(
        fontSize: 18.0,
        color: Colors.black,
      ),
      toolbarOptions: const ToolbarOptions(copy: true),
      onSelectionChanged: (selection, cause) {
        try {
          SelectionChangedCause? v = cause;
          print(selection.start);
          print(v);
          if (text.substring(selection.start, selection.end) != "") {
            selectedtext = text.substring(selection.start, selection.end);
          }
          print(selectedtext);
          if (v == SelectionChangedCause.toolbar) {
            print(selectedtext);
            _showOptions(context);

            print(highlights);
          }
        } catch (e) {
          print(e);
        }
      },
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
              itemCount: lwiynat.length,
              itemBuilder: (context, _index) {
                return Center(
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.album),
                          title: Text(lwiynat[_index]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text("assign"),
                              onPressed: () {
                                setState(() {
                                  highlights.add(selectedtext);

                                  if (lwiynat[_index] == "red") {
                                    colors.add(Colors.red);
                                  } else if (lwiynat[_index] == "yellow") {
                                    colors.add(Colors.amber);
                                  } else {
                                    colors.add(Colors.green);
                                  }
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
}
