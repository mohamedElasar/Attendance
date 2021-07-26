import 'package:flutter/cupertino.dart';
import 'package:smart_select/smart_select.dart';

// class Create_Teacher {
//   // int? id;
//   String? name;
//   String? phone;
//   String? phone2;
//   String? stages;
//   String? school;
//   int? subject_id;

//   int? city_id;
//   String? experience;
//   String? assistant_phone;
//   String? assistant_phone2;
//   String? note;

//   Create_Teacher({
//     // this.id,
//     this.name,
//     this.city_id,
//     this.assistant_phone,
//     this.assistant_phone2,
//     this.experience,
//     this.note,
//     this.phone,
//     this.phone2,
//     this.stages,
//     this.subject_id,
//     this.school,
//   });

//   Create_Teacher.fromJson(Map<String, dynamic> json) {
//     // id = json['id'];
//     city_id = json['city_id'];
//     name = json['name'];
//     phone = json['phone'];
//     subject_id = json['subject_id'];
//     phone2 = json['phone2'];
//     stages = json['stages'];
//     assistant_phone = json['assistant_phone'];
//     assistant_phone2 = json['assistant_phone2'];
//     school = json['school'];
//     experience = json['experience'];
//     note = json['note'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> year_data = new Map<String, dynamic>();

//     // year_data['id'] = this.id;
//     year_data['name'] = this.name;
//     year_data['phone'] = this.phone;
//     year_data['phone2'] = this.phone2;
//     year_data['subject_id'] = this.subject_id;
//     year_data['city_id'] = this.city_id;
//     year_data['stages'] = this.stages;
//     year_data['assistant_phone'] = this.assistant_phone;
//     year_data['assistant_phone2'] = this.assistant_phone2;
//     year_data['school'] = this.school;
//     year_data['experience'] = this.experience;
//     year_data['note'] = this.note;

//     return year_data;
//   }
// }

// ////////////

class Create_Year {
  // int? id;
 @required String name;

   int? stage_id;

  Create_Year({
    // this.id,
     required this.name,
     this.stage_id,
  });

  // Create_Year.fromJson(Map<String, dynamic> json) {
  //   // id = json['id'];

  //   name = json['name'];
  //   stage_id = json['stage_id'];

  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> year_data = new Map<String, dynamic>();

  //   // year_data['id'] = this.id;
  //   year_data['name'] = this.name;

  //   year_data['stage_id'] = this.stage_id;

  //   return year_data;
  // }

  factory Create_Year.fromJson(Map<String, dynamic> json) {
    return Create_Year(

  //  id = json['id'];

    name : json['name'],
    stage_id : json['stage_id'],
    );
  }
}
////////////

// class Autogenerated {
//   List<Data>? data;
//   Links? links;
//   Meta? meta;

//   Autogenerated({this.data, this.links, this.meta});

//   Autogenerated.fromJson(Map<String, dynamic> json) {
//     int index = 0;
//     if (json['data'] != null) {
//       // ignore: deprecated_member_use
//       data = new List<Data>.generate(length, (index) => null);
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//     links = json['links'] != null ? new Links.fromJson(json['links']) : null;
//     meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     if (this.links != null) {
//       data['links'] = this.links!.toJson();
//     }
//     if (this.meta != null) {
//       data['meta'] = this.meta!.toJson();
//     }
//     return data;
//   }
// }

class Data {
  int? id;
  String? name;
  Stage? stage;

  Data({this.id, this.name, this.stage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stage = json['stage'] != null ? new Stage.fromJson(json['stage']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.stage != null) {
      data['stage'] = this.stage!.toJson();
    }
    return data;
  }
}

class Stage {
  int? id;
  String? name;

  Stage({this.id, this.name});

  Stage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Links {
  String? first;
  Null? last;
  Null? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  String? path;
  int? perPage;
  int? to;

  Meta({this.currentPage, this.from, this.path, this.perPage, this.to});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    return data;
  }
}
