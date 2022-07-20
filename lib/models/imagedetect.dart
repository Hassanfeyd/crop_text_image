class Imagedetect {
  String? idproject;
  List<ArrBoxes>? arrBoxes;
  String? fileName;

  Imagedetect({this.idproject, this.arrBoxes, this.fileName});

  Imagedetect.fromJson(Map<String, dynamic> json) {
    idproject = json['idproject'];
    if (json['arr_boxes'] != null) {
      arrBoxes = <ArrBoxes>[];
      json['arr_boxes'].forEach((v) {
        arrBoxes!.add(new ArrBoxes.fromJson(v));
      });
    }
    fileName = json['file_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idproject'] = this.idproject;
    if (this.arrBoxes != null) {
      data['arr_boxes'] = this.arrBoxes!.map((v) => v.toJson()).toList();
    }
    data['file_name'] = this.fileName;
    return data;
  }
}

class ArrBoxes {
  double? x;
  double? y;
  double? width;
  double? height;
  String? name;
  String? source;

  ArrBoxes({this.x, this.y, this.width, this.height, this.name, this.source});

  ArrBoxes.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
    width = json['width'];
    height = json['height'];
    name = json['name'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['x'] = this.x;
    data['y'] = this.y;
    data['width'] = this.width;
    data['height'] = this.height;
    data['name'] = this.name;
    data['source'] = this.source;
    return data;
  }
}
