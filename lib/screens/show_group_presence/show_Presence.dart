import 'dart:ui';
import 'package:attendance/constants.dart';
import 'package:attendance/screens/show_group_presence/components/Presence_top_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Show_Group_Presence extends StatefulWidget {
  Show_Group_Presence({
    Key? key,
  }) : super(key: key);

  @override
  _Show_Group_PresenceState createState() => _Show_Group_PresenceState();
}

class _Show_Group_PresenceState extends State<Show_Group_Presence> {
  List<String> items = [
    'محمد أحمد',
    'أحمد الكاشف',
    'ايه محمد',
    'عمرو الشرقاوي',
    'محمد أحمد',
    'أحمد الكاشف',
    'ايه محمد',
    'عمرو الشرقاوي'
  ];
  var colors = [
    kbackgroundColor4,
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
          
          Show_Presence_Top_Page(
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
                    itemBuilder: (BuildContext ctxt, int Index) =>
                        ListTile(

                        
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
        backgroundColor: kbackgroundColor4,
        elevation: 6.0,
        shadowColor: Colors.grey[60],
        padding: EdgeInsets.all(8.0),
      );
}
