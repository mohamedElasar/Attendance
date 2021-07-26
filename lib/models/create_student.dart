class Create_Student {
  // int? id;
  String? name;
  // String? phone;
  // // String? email;
  // // String? password;
  // String? passwordConfirmation;
   String? school;
  // int? subject_id;
   String? groups;
  // // String? groups;
   int? city_id;
   String? parent;
   String? relation_type;
   String? parent_phone;
   String? phonparent_whatsappe;
   String? gender;
   String? study_type;
   String? discount;
   String? code;
   String? second_language;

  Create_Student({
    // this.id,
    this.name,
    // this.phone,
    // this.email,
    // this.password,
    // this.passwordConfirmation,
    this.city_id,
    this.code,
    this.discount,
    this.gender,
    this.groups,
    this.parent,
    this.parent_phone,
    this.phonparent_whatsappe,
    this.relation_type,
    this.school,
    this.second_language,
    // this.subject_id,
    this.study_type,
  });

  Create_Student.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    city_id = json['city_id'];
    name = json['name'];
    // phone = json['phone'];
    // email = json['email'];
    // password = json['password'];
    // passwordConfirmation = json['passwordConfirmation'];
    school = json['school'];
    second_language = json['second_language'];
    study_type = json['study_type'];
    // subject_id = json['subject_id'];
    code = json['code'];
    gender = json['gender'];
    discount = json['discount'];
    parent = json['parent'];
    parent_phone = json['parent_phone'];
    phonparent_whatsappe = json['phonparent_whatsappe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> student_data = new Map<String, dynamic>();

    // student_data['id'] = this.id;
    // student_data['name'] = this.name;
    // student_data['phone'] = this.phone;
    // student_data['email'] = this.email;
    // student_data['password'] = this.password;
    // student_data['passwordConfirmation'] = this.passwordConfirmation;


    student_data['city_id'] = this.city_id;
    // student_data['passwordConfirmation'] = this.passwordConfirmation ;
    student_data['school'] = this.school ;
    student_data['second_language'] = this.second_language;
    student_data['study_type'] = this.study_type;
    // student_data['subject_id'] = this.subject_id;
    student_data['code'] = this.code;
    student_data['gender']= this.gender;
    student_data['discount'] = this.discount;
    student_data['parent'] = this.parent;
    student_data['parent_phone'] = this.parent_phone;
    student_data['phonparent_whatsappe'] = this.phonparent_whatsappe ;

    return student_data;
  }
}
