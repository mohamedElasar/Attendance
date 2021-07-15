import 'package:attendance/navigation/screens.dart';
import 'package:attendance/screens/Single_Student.dart/components/student_pic_name.dart';
import 'package:attendance/screens/Students/components/Students_Top_Page.dart';
import 'package:attendance/screens/Students/components/table/Row_builder.dart';
import 'package:attendance/screens/Students/components/table/table_head.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'components/table_head_2.dart';

class Single_Student_attend extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Attendance_Screens.single_student_attend,
      key: ValueKey(Attendance_Screens.single_student_attend),
      child: const Single_Student_attend(),
    );
  }

  const Single_Student_attend({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kbackgroundColor2,
        appBar: AppBar(
          leading: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          actions: [
            Icon(
              Icons.arrow_forward,
              color: Colors.black,
            ),
            SizedBox(
              width: 10,
            )
          ],
          backgroundColor: Colors.white,
          elevation: 0,
          title: Center(
            child: Text(
              'حضور ودرجات طالب',
              style: TextStyle(color: Colors.black, fontFamily: 'GE-Bold'),
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        // backgroundColor: kbackgroundColor2,
        body: (Column(
          children: [
            Student_pic_name(),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'اسم الماده',
                    style: TextStyle(fontFamily: 'GE-medium'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'اسم المدرس',
                    style: TextStyle(fontFamily: 'GE-medium'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'اسم المجموعه',
                    style: TextStyle(fontFamily: 'GE-medium'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Column(
                children: [
                  TABLE_HEAD_2(
                    size: size,
                    data: ['الحصه', 'التاريخ', 'الحضور', 'الدرجه'],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => TABLE_HEAD_2(
                        head: false,
                        size: size,
                        data: ['1', '14/5', false, '50'],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
