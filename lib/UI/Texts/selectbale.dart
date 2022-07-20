import 'package:flutter/material.dart';
import 'dart:math';

class DynamicTextHighlighting extends StatelessWidget {
  //DynamicTextHighlighting
  final String text;
  final List<String> highlights;
  final List<Color> color;
  final TextStyle style;
  final bool caseSensitive;
  final ToolbarOptions toolbarOptions;
  final void Function(TextSelection selection, SelectionChangedCause? cause)?
      onSelectionChanged;

  //RichText

  DynamicTextHighlighting({
    //DynamicTextHighlighting
    Key? key,
    required this.text,
    required this.highlights,
    required this.color,
    this.style = const TextStyle(
      color: Colors.black,
    ),
    this.caseSensitive = true,
    required this.toolbarOptions,
    required this.onSelectionChanged,

    //RichText
  })  : assert(text != null),
        assert(highlights != null),
        assert(color != null),
        assert(style != null),
        assert(caseSensitive != null),
        super(key: key) {}

  @override
  Widget build(BuildContext context) {
    //Controls
    if (text == '') {
      return _richText(_normalSpan(text));
    }
    if (highlights.isEmpty) {
      return _richText(_normalSpan(text));
    }
    for (int i = 0; i < highlights.length; i++) {
      if (highlights[i] == null) {
        assert(highlights[i] != null);
        return _richText(_normalSpan(text));
      }
      if (highlights[i].isEmpty) {
        assert(highlights[i].isNotEmpty);
        return _richText(_normalSpan(text));
      }
    }

    //Main code
    List<TextSpan> _spans = [];
    int _start = 0;

    //For "No Case Sensitive" option
    String _lowerCaseText = text.toLowerCase();
    List<String> _lowerCaseHighlights = [];

    highlights.forEach((element) {
      _lowerCaseHighlights.add(element.toLowerCase());
    });

    while (true) {
      Map<int, String> _highlightsMap = {}; //key (index), value (highlight).

      if (caseSensitive) {
        for (int i = 0; i < highlights.length; i++) {
          int _index = text.indexOf(highlights[i], _start);
          if (_index >= 0) {
            _highlightsMap.putIfAbsent(_index, () => highlights[i]);
          }
        }
      } else {
        for (int i = 0; i < highlights.length; i++) {
          int _index = _lowerCaseText.indexOf(_lowerCaseHighlights[i], _start);
          if (_index >= 0) {
            _highlightsMap.putIfAbsent(_index, () => highlights[i]);
          }
        }
      }

      if (_highlightsMap.isNotEmpty) {
        List<int> _indexes = [];
        _highlightsMap.forEach((key, value) => _indexes.add(key));

        int _currentIndex = _indexes.reduce(min);
        String _currentHighlight = text.substring(_currentIndex,
            _currentIndex + _highlightsMap[_currentIndex]!.length);

        if (_currentIndex == _start) {
          _spans.add(_highlightSpan(
              _currentHighlight, color[highlights.indexOf(_currentHighlight)]));
          _start += _currentHighlight.length;
        } else {
          _spans.add(_normalSpan(text.substring(_start, _currentIndex)));
          _spans.add(_highlightSpan(
              _currentHighlight, color[highlights.indexOf(_currentHighlight)]));
          _start = _currentIndex + _currentHighlight.length;
        }
      } else {
        _spans.add(_normalSpan(text.substring(_start, text.length)));
        break;
      }
    }

    return SelectableText.rich(TextSpan(children: _spans),
        toolbarOptions: toolbarOptions, onSelectionChanged: (selection, cause) {
      onSelectionChanged!(selection, cause);
    });
  }

  TextSpan _highlightSpan(String value, Color c) {
    if (style.color == null) {
      return TextSpan(
        text: value,
        style: style.copyWith(
          color: Colors.black,
          backgroundColor: c,
        ),
      );
    } else {
      return TextSpan(
        text: value,
        style: style.copyWith(
          backgroundColor: c,
        ),
      );
    }
  }

  TextSpan _normalSpan(String value) {
    if (style.color == null) {
      return TextSpan(
        text: value,
        style: style.copyWith(
          color: Colors.black,
        ),
      );
    } else {
      return TextSpan(
        text: value,
        style: style,
      );
    }
  }

  RichText _richText(TextSpan text) {
    return RichText(
      key: key,
      text: text,
    );
  }
}
