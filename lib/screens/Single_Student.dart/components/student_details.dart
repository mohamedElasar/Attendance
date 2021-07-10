import 'package:attendance/screens/Single_Student.dart/components/name_widget.dart';
import 'package:flutter/material.dart';

import 'contacts_widget.dart';

class Student_details extends StatelessWidget {
  const Student_details({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Name(size: size, name: 'الاسم'),
            Text(
              '        رقم التليفون',
              style: TextStyle(fontSize: 16, fontFamily: 'GE-bold'),
            ),
            Contacts_widget(size: size),
            Container(
              child: Row(
                children: [
                  Text(
                    '         رقم ولى الامر ',
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
            Center(
              child: Container(
                width: size.width * .8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Name(size: size / 2, name: 'المدرسين', arrow: true),
                    // SizedBox(
                    //   width: 20,
                    // ),
                    Name(
                      size: size / 2,
                      name: 'الشعبه',
                      arrow: true,
                    )
                  ],
                ),
              ),
            ),
            Name(size: size, name: 'المحافظه', arrow: true),
            Name(size: size, name: 'المدرسه', arrow: true),
            Divider(
              thickness: 2,
            ),
            Center(
              child: Container(
                width: size.width * .8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Name(size: size / 2, name: 'الحضور والغياب'),
                    // SizedBox(
                    //   width: 20,
                    // ),
                    Name(size: size / 2, name: 'الدرجات')
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
                    Name(size: size / 2, name: 'ملاحظات')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
