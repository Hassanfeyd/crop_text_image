import 'package:croping_images/models/textdetect.dart';

class Textdetect {
  String? text;
  List<labelses>? labels;
  String? idProject;

  Textdetect({this.text, this.labels, this.idProject});

  Textdetect.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    if (json['labels'] != null) {
      labels = <labelses>[];
      json['labels'].forEach((v) {
        labels!.add(new labelses.fromJson(v));
      });
    }
    idProject = json['id_project'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    if (this.labels != null) {
      data['labels'] = this.labels!.map((v) => v.toJson()).toList();
    }
    data['id_project'] = this.idProject;
    return data;
  }
}

class labelses {
  String? text;
  int? start;
  int? end;
  String? label;

  labelses({this.text, this.start, this.end, this.label});

  labelses.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    start = json['start'];
    end = json['end'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['start'] = this.start;
    data['end'] = this.end;
    data['label'] = this.label;
    return data;
  }
}
