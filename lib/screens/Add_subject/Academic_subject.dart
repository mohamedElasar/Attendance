import 'dart:ui';

import 'package:attendance/managers/Auth_manager.dart';
import 'package:attendance/managers/stage_manager.dart';
import 'package:attendance/managers/subject_manager.dart';
import 'package:attendance/managers/year_manager.dart';
import 'package:attendance/models/year.dart';
import 'package:attendance/navigation/screens.dart';
import 'package:attendance/screens/Add_subject/components/subject_Top_Page.dart';
import 'package:attendance/screens/Students/components/Students_Top_Page.dart';
import 'package:attendance/screens/degrees/components/Degrees_top.dart';
import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';
import '../../constants.dart';
import 'package:provider/provider.dart';

import 'package:searchable_dropdown/searchable_dropdown.dart';

import '../splash_screen.dart';
import 'components/default_form_field.dart';

class Add_academic_subject extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Attendance_Screens.subjects_add,
      key: ValueKey(Attendance_Screens.subjects_add),
      child: Add_academic_subject(),
    );
  }

  Add_academic_subject({
    Key? key,
  }) : super(key: key);

  @override
  _Add_academic_subjectState createState() => _Add_academic_subjectState();
}

class _Add_academic_subjectState extends State<Add_academic_subject> {
  List<String> litems = [];

  Map<String, dynamic> _add_data = {
    'year': null,
    'id': null,
  };
  var _isInit = true;
  var _isLoading = false;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      print('here');
      setState(() {
        _isLoading = true;
      });
      Provider.of<YearManager>(context, listen: false)
          .get_years()
          .then((_) => Provider.of<SubjectManager>(context, listen: false)
              .get_subjects())
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  var yearController = TextEditingController();

  String text_value = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: _isLoading
          ? Center(
              child: Splash_Screen(),
            )
          : Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  _add_data['year'] = null;
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildPopupDialog(context),
                  );
                },
                child: Icon(Icons.add),
              ),
              backgroundColor: kbackgroundColor4,
              body: Column(
                children: [
                  Subject_Top_Page(size: size),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(top: 50),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Provider.of<Auth_manager>(context, listen: false)
                                  .name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                  fontFamily: 'AraHamah1964B-Bold'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      child: Container(
                          padding: EdgeInsets.symmetric(
                            // vertical: 10,
                            horizontal: 15,
                          ),
                          width: MediaQuery.of(context).size.width * .95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 2,
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          child: Consumer<SubjectManager>(
                            builder: (_, subjectManager, child) =>
                                ListView.separated(
                                    separatorBuilder:
                                        (BuildContext ctxt, int index) =>
                                            Divider(
                                              color: Colors.grey,
                                            ),
                                    itemCount: subjectManager.subjects.length,
                                    itemBuilder:
                                        (BuildContext ctxt, int index) {
                                      return Dismissible(
                                        key: Key(subjectManager
                                            .subjects[index].id
                                            .toString()),
                                        onDismissed: (DismissDirection) {
                                          setState(() {
                                            // litems.removeAt(Index);
                                          });
                                        },
                                        child: new ListTile(
                                          title: Text(subjectManager
                                              .subjects[index].name!),
                                          leading: Text(subjectManager
                                              //.year.name
                                              .subjects[index]
                                              .year!
                                              .name!),
                                        ),
                                      );
                                    }),
                          )),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('اضاف السنة و المادة الدراسية'),
      content: new Container(
        height: 180,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.zero),
          color: Colors.white,
        ),
        child: Column(
          children: [
            defaultFormField(
              text: 'المادة الدراسية',
              controller: yearController,
              prefix: Icons.calendar_today,
              type: TextInputType.name,
              validate: () {},
            ),
            Container(
              child: StatefulBuilder(
                builder: (BuildContext context, StateSetter dropDownState) {
                  return DropdownButtonHideUnderline(
                    child: DropdownButton(
                      style: TextStyle(
                          fontFamily: 'GE-medium', color: Colors.black),
                      value: _add_data['year'],
                      hint: Text('المواد الدراسية'),
                      isExpanded: true,
                      iconSize: 30,
                      onChanged: (newval) {
                        // setState(() {
                        //   _add_data['year'] = newval.toString();
                        // });
                        dropDownState(() {
                          _add_data['year'] = newval;
                        });
                      },
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: Provider.of<YearManager>(context, listen: false)
                          .years
                          .map(
                            (item) => DropdownMenuItem(
                              child: Text(item.name!),
                              value: item.name!,
                              onTap: () {
                                setState(() {
                                  _add_data['id'] = item.id;
                                });
                              },
                            ),
                          )
                          .toList(),
                    ),
                  );
                },
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: kbackgroundColor4),
                    onPressed: () {
                      // setState(() {
                      setState(() {
                        text_value = yearController.text;
                      });
                      if (_add_data['year'] == null) return;
                      if (text_value == '') return;
                      Provider.of<SubjectManager>(context, listen: false)
                          .add_subject(text_value, _add_data['id']!.toString())
                          .then(
                            (value) => setState(() {
                              _isInit = true;
                            }),
                          )
                          .then((value) => Navigator.of(context).pop());
                      // litems.add(text_value);
                      yearController.clear();
                    },
                    child: Text(
                      'اضافة',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: kbackgroundColor4),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('الغاء')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
