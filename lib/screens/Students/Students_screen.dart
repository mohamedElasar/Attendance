import 'package:attendance/navigation/screens.dart';
import 'package:attendance/screens/Admin_Login/components/Login_Form.dart';
import 'package:attendance/screens/Admin_Login/components/Page_Title.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'components/Filter_Container.dart';
import 'components/Students_Top_Page.dart';
import 'components/Students_page_title.dart';
import 'package:data_table_2/data_table_2.dart';

import 'components/table/Row_builder.dart';
import 'components/table/table_head.dart';

class Students_Screen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Attendance_Screens.data_students,
      key: ValueKey(Attendance_Screens.data_students),
      child: const Students_Screen(),
    );
  }

  const Students_Screen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kbackgroundColor2,
        body: (Column(
          children: [
            Student_Top_Page(size: size),
            Students_Page_Title(title: '1:30 سنتر الياسمين '),
            Filter_Container(),
            Expanded(
              child: Column(
                children: [
                  TABLE_HEAD(size: size),
                  Rows_Builder(size: size),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
