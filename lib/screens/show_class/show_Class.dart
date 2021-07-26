import 'dart:ui';
import 'package:attendance/constants.dart';
import 'package:attendance/screens/show_class/components/Class_top_page.dart';
import 'package:attendance/screens/show_group_presence/show_Presence.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Show_Group_Class extends StatefulWidget {
  Show_Group_Class({
    Key? key,
  }) : super(key: key);

  @override
  _Show_Group_ClassState createState() => _Show_Group_ClassState();
}

class _Show_Group_ClassState extends State<Show_Group_Class> {
  List<String> items = [
    'حصة الأحد',
    'حصة الثلاثاء',
    'حصة الخميس',
    'حصة الأحد',
    'حصة الثلاثاء',
    'حصة الخميس',
  ];
  var colors = [
    kbackgroundColor5,
    Colors.white,
   
  ];
  var text_colors = [Colors.white, Colors.black];
  String text = '';

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
      backgroundColor: Colors.white,
     
      body: Column(
        children: [
         
          Show_Class_Top_Page(
            size: size,
          ),
          
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20,
              end: 20,
              top: 20,
            ),
            child: Wrap(spacing: 10.0, runSpacing: 10.0, children: <Widget>[
              buildChip('الأحد'),
              buildChip('2pm'),
              buildChip('لغة عربية'),
              buildChip('الصف الأول الثانوي'),
              buildChip('مجموعة الياسمين 2'),
              buildChip('أ/ محمد عبد المقصود '),
          
            ]),
          ),
          SizedBox(
            height: 30,
          ),

          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 20,
                  end: 20,
                  top: 20,
                ),
                child: Container(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (BuildContext ctxt, int Index) => ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Show_Group_Presence()));
                      },
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                               
                                Radius.circular(5)),
                            border: Border.all(
                              color: Colors.grey,
                              width: 0.7,
                            ),
                          ),
                          height: 55,
                          
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(5.0),
                            color: colors[Index % colors.length], 
                            child: Center(
                              child: Text(
                                items[Index],
                                style: TextStyle(
                                    color: text_colors[Index % colors.length],
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget buildChip(text) => Chip(
        labelPadding: EdgeInsets.all(2.0),
        label: Text(
          text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: kbackgroundColor5,
        elevation: 6.0,
        shadowColor: Colors.grey[60],
        padding: EdgeInsets.all(8.0),
      );
}
