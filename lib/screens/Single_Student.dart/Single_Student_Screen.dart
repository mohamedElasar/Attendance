import 'package:attendance/navigation/screens.dart';
import 'package:attendance/screens/Admin_Login/components/Login_Form.dart';
import 'package:attendance/screens/Admin_Login/components/Page_Title.dart';
import 'package:attendance/screens/Students/components/Students_Top_Page.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

import 'package:data_table_2/data_table_2.dart';

import 'components/student_details.dart';
import 'components/student_pic_name.dart';

class Single_Student_Screen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Attendance_Screens.single_student,
      key: ValueKey(Attendance_Screens.single_student),
      child: const Single_Student_Screen(),
    );
  }

  const Single_Student_Screen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kbackgroundColor2,
        body: (Column(
          children: [
            Student_Top_Page(size: size),
            Student_pic_name(),
            SizedBox(height: 5),
            Student_details(size: size)
          ],
        )),
      ),
    );
  }
}
