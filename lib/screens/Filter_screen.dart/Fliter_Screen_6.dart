import 'package:attendance/constants.dart';
import 'package:attendance/navigation/screens.dart';
import 'package:attendance/screens/Filter_screen.dart/components/filters_top.dart';
import 'package:attendance/screens/Students/components/Students_Top_Page.dart';
import 'package:flutter/material.dart';

class Filter_Screen_6 extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Attendance_Screens.data_students,
      key: ValueKey(Attendance_Screens.data_students),
      child: const Filter_Screen_6(),
    );
  }

  const Filter_Screen_6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: kbackgroundColor2,
        body: Column(
          children: [
            Student_Top_Page(size: size),
            Filters_top(size: size),
            Tabel_here(
              size: size,
            ),
          ],
        ),
      ),
    );
  }
}

class Tabel_here extends StatelessWidget {
  Tabel_here({Key? key, required this.size}) : super(key: key);
  Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height * .75,
        // color: Colors.red,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
              Container(
            width: double.infinity,
            // height: MediaQuery.of(context).size.height * .5,
            child: SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: size.width * .3,
                          // height: size.height,
                          decoration: BoxDecoration(
                              // color: Colors.red,
                              ),
                          child: Column(
                            children: [
                              Container(
                                width: size.width * .3,
                                height: size.height * .25,
                                child: Center(
                                  child: Container(
                                    height: 30,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      color: kbackgroundColor3,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'تفعيل',
                                        style:
                                            TextStyle(fontFamily: 'GE-light'),
                                      ),
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  // border: Border.all(color: Colors.black),
                                  border: Border(
                                    top: BorderSide.none,
                                    right: BorderSide.none,
                                    left: BorderSide(color: Colors.grey),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  buildcellHead('اليوم'),
                                  buildcellHead('التاريخ'),
                                  buildcellHead('الاسم  |  الحصه'),
                                  buildname(size, 'سامح الصقار'),
                                  buildname(size, 'محمد احمد '),
                                  buildname(size, ' احمد محمد'),
                                  buildname(size, 'احمد سعيد'),
                                  buildname(size, 'احمد سعيد'),
                                  buildname(size, 'احمد سعيد'),
                                  buildname(size, 'احمد سعيد'),
                                  buildname(size, 'احمد سعيد'),
                                  buildname(size, 'احمد سعيد'),
                                  buildname(size, 'احمد سعيد'),
                                  buildname(size, 'احمد سعيد'),
                                  buildname(size, 'احمد سعيد'),
                                  buildname(size, 'احمد سعيد'),
                                  buildname(size, 'احمد سعيد'),
                                  buildname(size, 'احمد سعيد'),
                                  buildname(size, 'احمد سعيد'),
                                  buildname(size, 'احمد سعيد'),
                                  buildname(size, 'احمد سعيد'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]),
                  Flexible(
                    child: Container(
                      // color: Colors.blue,
                      //asdasdasdasdasdasd
                      height: 26 * 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Container(
                                decoration: BoxDecoration(
                                    // color: Colors.amber,
                                    ),
                                child: Column(
                                  children: [
                                    buildfilter('80-90', kbackgroundColor3,
                                        'AraHamah1964R-Bold'),
                                    buildfilter(
                                        'درجات', kbackgroundColor1, 'GE-light'),
                                    buildfilter(
                                        'تعويضات', kbuttonColor3, 'GE-light'),
                                    buildfilter(
                                        'غياب', kbackgroundColor3, 'GE-light'),
                                    buildfilter(
                                        'حضور', kbuttonColor2, 'GE-light'),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                      ),
                                      width: 65,
                                      height: 35,
                                      child: Center(
                                        child: Text(
                                          'السبت',
                                          style: TextStyle(
                                              fontFamily: 'GE-medium'),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                      ),
                                      width: 65,
                                      height: 35,
                                      child: Center(
                                        child: Text(
                                          '15/7',
                                          style: TextStyle(
                                              fontFamily: 'AraHamah1964R-Bold'),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                      ),
                                      width: 65,
                                      height: 35,
                                      child: Center(
                                        child: Text(
                                          'حصه 1',
                                          style: TextStyle(
                                              fontFamily: 'GE-medium'),
                                        ),
                                      ),
                                    ),
                                    build_icon(40),
                                    build_icon(40),
                                    build_icon(40),
                                    build_icon(40),
                                    build_icon(40),
                                    build_icon(40),
                                    build_icon(40),
                                    build_icon(40),
                                    build_icon(40),
                                    build_icon(40),
                                    build_icon(40),
                                    build_icon(40),
                                    build_icon(40),
                                    build_icon(40),
                                    build_icon(40),
                                    build_icon(40),
                                    build_icon(40),
                                    build_icon(40),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Container buildfilter(String name, Color color, String style) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.grey),
      ),
      width: 65,
      height: size.height * .25 / 5,
      child: Center(
        child: Text(
          name,
          style: TextStyle(fontFamily: style),
        ),
      ),
    );
  }

  Container buildcellHead(String name) {
    return Container(
      width: size.width * .3,
      height: 35,
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Center(
        child: Text(
          name,
          style: TextStyle(fontFamily: 'GE-medium'),
        ),
      ),
    );
  }

  List<Widget> _buildCells(int count) {
    return List.generate(
      count,
      (index) => Container(
        alignment: Alignment.center,
        width: 120.0,
        height: 60.0,
        color: Colors.white,
        margin: EdgeInsets.all(4.0),
        child: Text('hi'),
      ),
    );
  }

  List<Widget> _buildRows(int count) {
    return List.generate(
      count,
      (index) => Row(
        children: _buildCells(10),
      ),
    );
  }

  Container buildname(Size size, String name) {
    return Container(
      width: size.width * .3,
      height: 40,
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Center(
        child: Text(
          name,
          style: TextStyle(fontFamily: 'GE-light'),
        ),
      ),
    );
  }

  Container build_icon(double height) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
      ),
      width: 65,
      height: height,
      child: Center(
        child: Icon(
          Icons.done,
          color: Colors.green,
        ),
      ),
    );
  }
}
