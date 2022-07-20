class project {
  String? projectname;
  String? inputType;
  String? outputType;
  List<Labels>? labels;
  String? id;

  project(
      {this.projectname,
      this.inputType,
      this.outputType,
      this.labels,
      this.id});

  project.fromJson(Map<String, dynamic> json) {
    projectname = json['projectname'];
    inputType = json['input_type'];
    outputType = json['output_type'];
    id = json['_id'];
    if (json['labels'] != null) {
      labels = <Labels>[];
      json['labels'].forEach((v) {
        labels!.add(new Labels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['input_type'] = this.inputType;
    data['projectname'] = this.projectname;
    data['output_type'] = this.outputType;
    data['_id'] = this.id;
    if (this.labels != null) {
      data['labels'] = this.labels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Labels {
  String? name;

  Labels({this.name});

  Labels.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
