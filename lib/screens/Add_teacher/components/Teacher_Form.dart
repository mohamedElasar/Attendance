import 'dart:convert';

import 'package:attendance/helper/httpexception.dart';
import 'package:attendance/managers/teacher_manager.dart';
import 'package:attendance/models/create_teacher.dart';
import 'package:attendance/models/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_select/smart_select.dart';
import 'package:http/http.dart' as http;
import '../../../constants.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Welcome> fetchAlbum() async {
  final response = await http.get(
      // Uri.parse('https://www.postman.com/collections/c30988bbe00b2318180a')); 
      Uri.parse('https://development.mrsaidmostafa.com/api/years'));

  print(response.body);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Welcome.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  int? id;
  String? name;
  Stage? stage;

  Album({
    this.id,
    this.name,
    required this.stage,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      name: json['name'],
      stage: json['stage'],
    );
  }
}

class Stage {
  final int id;
  final String name;

  Stage({
    required this.id,
    required this.name,
  });

  factory Stage.fromJson(Map<String, dynamic> json) {
    return Stage(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Teacher_Form extends StatefulWidget {
  const Teacher_Form({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _Teacher_FormState createState() => _Teacher_FormState();
}

class _Teacher_FormState extends State<Teacher_Form> {
  // late Future<Create_Year> futureYear;
  late Future<Welcome> futureAlbum;

  final GlobalKey<FormState> _formKey = GlobalKey();
  var _isLoading = false;
  Map<String, dynamic> _register_data = {
    'name': '',
    'Teacher_phone_number': '',
    'Teacher_phone_number2': '',
    'Assistant_phone_number1': '',
    'Assistant_phone_number2': '',
    'school': '',
    'years_experience': '',
    'observations': '',
    'govern_value': null,
    'subject': null,
    // 'years_levels' :null
  };

  // List<S2Choice<String>> years_levels = [
  //   S2Choice<String>(value: 'الاول الثانوي', title: 'الاول الثانوي'),
  //   S2Choice<String>(value: 'الثاني الثانوي', title: 'الثانى الثانوي'),
  //   S2Choice<String>(value: 'الثالث الثانوي', title: 'الثالث الثانوي'),
  // ];
  // List<String> _years_levels = [];
  List<String> name = [];

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var alternativePhoneController = TextEditingController();

  var yearsController = TextEditingController();
  var languageController = TextEditingController();
  var governomentController = TextEditingController();

  var schoolController = TextEditingController();
  var assistantphoneController = TextEditingController();
  var assisAlternativePhoneController = TextEditingController();
  var notesController = TextEditingController();
  var experienceController = TextEditingController();

  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    // futureYear = Teacher_manager().fetchYear();
    futureAlbum = fetchAlbum();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  Future<Create_Year> fetch() async {
    final url = Uri.parse(
        'https://www.getpostman.com/collections/c30988bbe00b2318180a');
    http.Response response =
        await http.get(url, headers: {'Accept': 'application/json'});
    print(response.body);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // return Create_Year.fromJson(jsonDecode(response.body));
      print('okkk');

      return Create_Year.fromJson(json.decode(response.body));
      // print(response.body.);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
      print('no');
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
      print('yes');
    });
    try {
      await Provider.of<Teacher_manager>(context, listen: false).add_teacher(
        _register_data['name'].toString(),
        _register_data['Teacher_phone_number'].toString(),
        _register_data['Teacher_phone_number2'].toString(),
        _register_data['subject'].toString(),
        _register_data['govern_value'].toString(),

        // years_levels
        _register_data['stages'].toString(),

        _register_data['Assistant_phone_number1'].toString(),
        _register_data['Assistant_phone_number2'].toString(),
        _register_data['school'].toString(),

        _register_data['years_experience'].toString(),
        _register_data['observations'].toString(),
      );
      // if (_rememberme)
      //   await Provider.of<Auth_manager>(context, listen: false).rememberMe();
    } on HttpException catch (error) {
      var errorMessage = 'These credentials do not match our records';
      if (error.toString().contains('credentials do not match')) {
        _showErrorDialog('البيانات غير صحيحه', '');
      } else {
        const successMessage = 'تم تسجيل المعلم بنجاح';
        const Message = '';
        _showErrorDialog(successMessage, Message);
      }
      ;
    } catch (error) {
      const errorMessage = 'حاول مره اخري';
      const Message = 'حدث خطا';
      _showErrorDialog(errorMessage, Message);
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _showErrorDialog(String message, String text) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          text,
          style: TextStyle(fontFamily: 'GE-Bold'),
        ),
        content: Text(
          message,
          style: TextStyle(fontFamily: 'GE-medium'),
        ),
        actions: <Widget>[
          Center(
            child: FlatButton(
              color: kbackgroundColor1,
              child: Text(
                'حسنا',
                style: TextStyle(fontFamily: 'GE-medium'),
              ),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
          )
        ],
      ),
    );
  }

  //  _formKey.currentState.save();
  //    Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => Home()),);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * .8,
      width: widget.size.width,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 5,
            ),
            build_edit_field(
                item: 'name',
                hint: 'الاسم',
                controller: nameController,
                inputType: TextInputType.name),
            build_edit_field(
                item: 'Teacher_phone_number',
                hint: 'رقم التليفون',
                controller: phoneController,
                inputType: TextInputType.phone),
            build_edit_field(
                item: 'Teacher_phone_number2',
                hint: 'رقم تليفون بديل',
                controller: alternativePhoneController,
                inputType: TextInputType.phone),
            Center(
              child: Container(
                width: widget.size.width * .9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        alignment: Alignment.centerRight,
                        width: widget.size.width / 2 * .9,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Container(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              style: TextStyle(
                                  fontFamily: 'GE-medium', color: Colors.black),
                              value: _register_data['subject'],
                              hint: Text('الماده'),
                              isExpanded: true,
                              iconSize: 30,
                              onChanged: (newval) {
                                setState(() {
                                  _register_data['subject'] = newval.toString();
                                });
                              },
                              icon: Icon(Icons.keyboard_arrow_down),
                              items: ['لغه عربيه', 'رياضيات']
                                  .map((item) => DropdownMenuItem(
                                        child: Text(item),
                                        value: item,
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        alignment: Alignment.centerRight,
                        width: widget.size.width / 2 * .9,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Container(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              style: TextStyle(
                                  fontFamily: 'GE-medium', color: Colors.black),
                              value: _register_data['govern_value'],
                              hint: Text('المحافظه'),
                              isExpanded: true,
                              iconSize: 30,
                              onChanged: (newval) {
                                setState(() {
                                  _register_data['govern_value'] =
                                      newval.toString();
                                });
                              },
                              icon: Icon(Icons.keyboard_arrow_down),
                              items: ['الجيزه', 'القاهره']
                                  .map((item) => DropdownMenuItem(
                                        child: Text(item),
                                        value: item,
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Center(
            //   child: Container(
            //     alignment: Alignment.centerRight,
            //     width: widget.size.width * .9,
            //     padding: EdgeInsets.symmetric(horizontal: 20),
            //     height: 70,
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(20),
            //       border: Border.all(color: Colors.grey),
            //     ),
            //     child: Container(
            //       child: FutureBuilder<Create_Year>(
            //                   future: futureYear,
            //                   builder: (context, snapshot) {
            //                     if (snapshot.hasData) {
            //                   return SmartSelect<String>.multiple(
            //                     title: 'السنوات الدراسيه',
            //                     value: [],
            //                     onChange: (selected) =>
            //                         setState(() => _years_levels = selected.value),
            //                     choiceItems: years_levels,
            //                     modalType: S2ModalType.bottomSheet,
            //                     tileBuilder: (context, state) {
            //                       return S2Tile.fromState(
            //                         state,
            //                         isTwoLine: true,
            //                       );
            //                     },
            //                   ),
            //                     }
            //                 else if (snapshot.hasError) {
            //               return Text("${snapshot.error}");
            //             }
            //                   }
            // }

            // future: futureYear,
            // builder: (context, snapshot) {
            //   if (snapshot.hasData) {
            //  return SmartSelect<String>.multiple(
            //     title: 'السنوات الدراسيه',
            //     value: [],
            //     onChange: (selected) =>
            //         setState(() => name = selected.value),
            //     choiceItems: snapshot.data!.name,
            //     modalType: S2ModalType.bottomSheet,
            //     tileBuilder: (context, state) {
            //       return S2Tile.fromState(
            //         state,
            //         isTwoLine: true,
            //       );
            //     },
            //   );

            //   // print('$snapshot.data!.name');
            //   // print('data');
            //               print('A');
            //               return Text(snapshot.data!.name);
            //             } else if (snapshot.hasError) {
            //               print('B');
            //               return Text("${snapshot.error}");

            //               // Text("${snapshot.error}");
            //             }
            //             print('C');

            //             // By default, show a loading spinner.
            //             return CircularProgressIndicator();
            //           }),
            //     ),
            //   ),
            // ),
            build_edit_field(
                item: 'Assistant_phone_number1',
                hint: 'رقم تليفون مساعد',
                controller: assistantphoneController,
                inputType: TextInputType.phone),
            build_edit_field(
                item: 'Assistant_phone_number2',
                hint: 'رقم تليفون مساعد 2',
                controller: assisAlternativePhoneController,
                inputType: TextInputType.phone),
            build_edit_field(
                item: 'school',
                hint: 'المدرسه',
                controller: schoolController,
                inputType: TextInputType.text),
            build_edit_field(
                item: 'years_experience',
                hint: 'سنوات الخبره',
                controller: yearsController,
                inputType: TextInputType.number),
            build_edit_field(
                item: 'observations',
                hint: 'ملاحظات',
                controller: notesController,
                inputType: TextInputType.text),
            IconButton(
              icon: Icon(
                Icons.save,
                size: 40,
              ),
              color: Colors.orange[200],
              onPressed: () {
                _submit();
                // fetchAlbum();

                // fetch();
              },
            ),

            Center(
              child: FutureBuilder<Welcome>(
                future: futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text("${snapshot.data?.info.name}");
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  // By default, show a loading spinner.
                  return CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Center build_edit_field({
    required String item,
    required String hint,
    bool small = false,
    required TextEditingController controller,
    required TextInputType inputType,
    Function? validate,
  }) {
    return Center(
      child: Container(
        alignment: Alignment.centerRight,
        width: small ? widget.size.width * .9 / 2 : widget.size.width * .9,
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey),
        ),
        child: Container(
          child: TextFormField(
            onSaved: (value) {
              _register_data[item] = value!;
            },
            keyboardType: inputType,
            controller: controller,
            // validator:validate() ,
            onChanged: (value) {},
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                fontFamily: 'GE-medium',
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
