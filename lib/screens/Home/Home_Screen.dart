import 'package:attendance/screens/Students/components/Students_Top_Page.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/choices.dart';
import 'components/options_widget.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kbackgroundColor2,
        body: (Column(
          children: [
            Student_Top_Page(size: size),
            Options(size: size),
            SizedBox(height: 10),

            Choices(size: size),
            build_chip_container_down(null, 'مجموعه الحضور'),
            SizedBox(
              height: 10,
            ),
            build_Scan_button()

            // Student_pic_name(),
            // SizedBox(height: 5),
            // Student_details(size: size)
          ],
        )),
      ),
    );
  }

  Container build_Scan_button() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all()),
      child: Container(
        alignment: Alignment.center,
        height: 70,
        width: 70,
        padding: EdgeInsets.all(5),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.black54),
        child: Text(
          'Scan',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }

  Container build_chip_container_down(Color, text) {
    return Container(
      alignment: Alignment.center,
      height: 30,
      width: 170,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        color: Color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(fontFamily: 'GE-light'),
            ),
            Spacer(),
            Icon(Icons.keyboard_arrow_down_outlined)
          ],
        ),
      ),
    );
  }
}
