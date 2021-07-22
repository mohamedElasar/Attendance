import 'package:attendance/models/subject.dart';
import 'package:attendance/models/teacher.dart';
import 'package:attendance/models/year.dart';

class GroupModel {
  int? id;
  String? name;
  YearModel? year;
  TeacherModel? teacher;
  SubjectModel? subject;
  String? day;
  String? time;
  bool? choosen;

  GroupModel(
      {this.id,
      this.year,
      this.teacher,
      this.day,
      this.time,
      this.name,
      this.subject,
      this.choosen = false});

  GroupModel.fromJson(Map<String, dynamic> json) {
    choosen = false;
    id = json['id'];
    name = json['name'];
    year = json['year'] != null ? new YearModel.fromJson(json['year']) : null;
    subject = json['subject'] != null
        ? new SubjectModel.fromJson(json['subject'])
        : null;
    teacher = json['teacher'] != null
        ? new TeacherModel.fromJson(json['teacher'])
        : null;
    day = json['day'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.year != null) {
      data['year'] = this.year!.toJson();
    }
    if (this.subject != null) {
      data['subject'] = this.subject!.toJson();
    }
    if (this.teacher != null) {
      data['teacher'] = this.teacher!.toJson();
    }
    data['day'] = this.day;
    data['time'] = this.time;
    return data;
  }
}
