import 'dart:ui';


import 'package:attendance/screens/show_class/show_Class.dart';
import 'package:attendance/screens/show_group/components/group_top_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Show_Group extends StatefulWidget {
  Show_Group({
    Key? key,
  }) : super(key: key);

  @override
  _Show_GroupState createState() => _Show_GroupState();
}

class _Show_GroupState extends State<Show_Group> {
  List<String> items = [
    'مجموعة الياسمين1',
    'مجموعة الياسمين2',
    'مجموعة الياسمين3',
    'مجموعة الياسمين4',
    'مجموعة الياسمين5'
  ];
  var colors = [
    Colors.grey[600],
    Colors.white,
   
  ];
  var text_colors = [Colors.white, Colors.black];

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
      backgroundColor: Colors.grey[350],
      
      body: Column(
        children: [
          
          Show_Group_Top_Page(
            size: size,
          ),
          Container(
            color: Colors.white,
            height: 20,
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
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Show_Group_Class()));
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
                            height: 60,
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(5.0),
                            color: colors[Index % colors.length], 
                            child: Center(
                              child: Text(
                                items[Index],
                                style: TextStyle(
                                    color: text_colors[Index % colors.length],
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
}
