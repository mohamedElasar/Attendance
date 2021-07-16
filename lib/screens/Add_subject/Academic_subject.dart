import 'dart:ui';

import 'package:attendance/screens/Add_subject/components/subject_Top_Page.dart';
import 'package:attendance/screens/Students/components/Students_Top_Page.dart';
import 'package:attendance/screens/degrees/components/Degrees_top.dart';
import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';
import '../../constants.dart';
import 'package:attendance/screens/degrees/components/check_box.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

import 'components/default_form_field.dart';

class Add_academic_subject extends StatefulWidget {
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
  };

  var yearController = TextEditingController();

  String text_value = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: kbackgroundColor4,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
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
                        "سنتر الياسمين",
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
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 25,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * .9,
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
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 45, top: 15, left: 10, right: 10),
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Row(
                            children: [
                              SizedBox(width: 15),
                              FloatingActionButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        _buildPopupDialog(context),
                                  );
                                },
                                child: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: ListView.separated(
                                separatorBuilder:
                                    (BuildContext ctxt, int Index) => Divider(
                                          color: Colors.grey,
                                        ),
                                itemCount: litems.length,
                                itemBuilder: (BuildContext ctxt, int Index) {
                                  return Dismissible(
                                    key: Key('${litems}'),
                                    onDismissed: (DismissDirection) {
                                      setState(() {
                                        litems.removeAt(Index);
                                      });
                                    },
                                    child: new ListTile(
                                      title: Text(litems[Index]),
                                      subtitle: Text(_add_data['year']),
                                      // style: TextStyle(
                                      //     fontSize: 28,
                                      //     fontWeight: FontWeight.bold,
                                      //     fontFamily: 'AraHamah1964B-Bold'),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  style:
                      TextStyle(fontFamily: 'GE-medium', color: Colors.black),
                  value: _add_data['year'],
                  hint: Text('المادة الدراسية'),
                  isExpanded: true,
                  iconSize: 30,
                  onChanged: (newval) {
                    setState(() {
                      _add_data['year'] = newval.toString();
                    });
                  },
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: ['الاول الثانوي ', 'الثاني الثانوي', 'الثالث الثانوي']
                      .map((item) => DropdownMenuItem(
                            child: Text(item),
                            value: item,
                          ))
                      .toList(),
                ),
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
                      litems.add(text_value);
                      yearController.clear();

                      // });
                      Navigator.of(context).pop();
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
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Colors.black,
          child: const Text('Close'),
        ),
      ],
    );
  }
}
