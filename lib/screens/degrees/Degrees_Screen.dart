import 'package:attendance/screens/Students/components/Students_Top_Page.dart';
import 'package:attendance/screens/degrees/components/Degrees_top.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Degrees_Screen extends StatelessWidget {
  const Degrees_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: kbackgroundColor2,
        body: Column(
          children: [
            Student_Top_Page(size: size),
            Degrees_top(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              width: size.width * .8,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: size.width * .8,
                    height: 30,
                    child: Align(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                            Text(
                              'سامح الصقار',
                              style: TextStyle(
                                  fontFamily: 'GE-medium', color: Colors.black),
                            ),
                            Text(
                              'A12345',
                            ),
                          ],
                        ),
                      ),
                      alignment: Alignment.center,
                    ),
                    decoration: BoxDecoration(
                      color: kbackgroundColor1,
                      border: Border.all(),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * .8,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                    child: Row(
                      children: [
                        buildCell(size.width * .2, 'الحصه',
                            bkground: kbuttonColor3),
                        buildCell(size.width * .2, 'التاريخ',
                            bkground: kbuttonColor3),
                        buildCell(size.width * .2, 'الحضور',
                            bkground: kbuttonColor3),
                        buildCell(size.width * .2, 'الدرجه',
                            bkground: kbuttonColor3),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * .8,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                    child: Row(
                      children: [
                        buildCell(size.width * .2, '1', bkground: Colors.white),
                        buildCell(size.width * .2, '14/2',
                            bkground: Colors.white),
                        buildicon(size.width * .2, 'ok',
                            bkground: Colors.white),
                        buildCell(size.width * .2, '80',
                            bkground: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildCell(double width, String text,
      {Color bkground = Colors.white}) {
    return Container(
      height: 30,
      width: width,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontFamily: 'GE-light'),
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(),
        color: bkground,
      ),
    );
  }

  Container buildicon(double width, String text,
      {Color bkground = Colors.white}) {
    return Container(
      height: 30,
      width: width,
      child: Center(
        child: Icon(
          Icons.done,
          color: Colors.green,
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(),
        color: bkground,
      ),
    );
  }
}
