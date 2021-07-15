import 'package:attendance/constants.dart';
import 'package:attendance/managers/App_State_manager.dart';
import 'package:attendance/screens/Single_Student.dart/components/name_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'contacts_widget.dart';

class Student_details extends StatelessWidget {
  Student_details({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  List<String> teachers_Student = ['عبد المعز', 'احمد محمد'];
  void _modalBottomSheetMenu(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 250.0,
            color: Colors.transparent,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kbackgroundColor1,
                      ),
                      child: Center(
                        child: Text(
                          'مجموعات الطالب',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'GE-bold',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                      itemCount: teachers_Student.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Provider.of<AppStateManager>(context, listen: false)
                              .goToSingleStudentAttend(true);
                        },
                        child: ListTile(
                          trailing: Text(
                            'سنتر الياسمين 1:30',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'GE-light',
                            ),
                          ),
                          subtitle: Text(
                            'مدرس لغه عربيه',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'GE-light',
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: kbackgroundColor3,
                            radius: 10,
                          ),
                          title: Text(
                            '${teachers_Student[index]}',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'GE-bold',
                            ),
                          ),
                        ),
                      ),
                    ))
                  ],
                )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Name(size: size, name: 'الاسم'),
            Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                Text(
                  'رقم التليفون',
                  style: TextStyle(fontSize: 16, fontFamily: 'GE-bold'),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '012345678912',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Contacts_widget(size: size),
            Container(
              child: Row(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    'رقم ولى الامر ',
                    style: TextStyle(fontSize: 16, fontFamily: 'GE-bold'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    '0123456789',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Contacts_widget(size: size),
            GestureDetector(
              onTap: () => _modalBottomSheetMenu(context),
              child: Name(size: size, name: 'المجموعات', arrow: true),
            ),
            // Center(
            //   child: Container(
            //     width: size.width * .8,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: [Name(size: size / 2, name: 'الملاحظات')],
            //     ),
            //   ),
            // ),
            Center(
              child: Container(
                width: size.width * .8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Name(size: size / 2, name: 'المحافظه'),
                    Name(
                      size: size / 2,
                      name: 'المدرسه',
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                width: size.width * .8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Name(size: size / 2, name: 'السداد'),
                    // SizedBox(
                    //   width: 20,
                    // ),
                    Name(size: size / 2, name: 'الشعبه')
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            Name(size: size, name: 'ملاحظات'),
            // Center(
            //   child: Container(
            //     width: size.width * .8,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Name(size: size / 2, name: 'الحضور والغياب'),
            //         Name(size: size / 2, name: 'الدرجات')
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
