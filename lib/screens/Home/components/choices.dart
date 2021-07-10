import 'package:flutter/material.dart';

import '../../../constants.dart';

class Choices extends StatelessWidget {
  const Choices({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .53,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                build_container(size, 'الثالث الثانوي', kbuttonColor3,
                    arrow: true),
                build_container(size, 'اللغه العربيه', kbackgroundColor1),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                build_container(size, 'أ. عبد المعز', kbackgroundColor1),
                build_container(size, 'مجموعه', kbackgroundColor3),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                build_container(size, 'إدخال طالب', kbuttonColor2, arrow: true),
                build_container(size, 'إدخال معلم', kbuttonColor3, arrow: true),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                build_container(size, 'إدخال درجات', kbackgroundColor3),
                build_container(size, 'سكان', kbuttonColor2, arrow: true),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                build_container(size, 'حسابات', kbuttonColor2, arrow: true),
                build_container(size, 'شحن حصص', kbackgroundColor1),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container build_container(Size size, text, color, {bool arrow = false}) {
    return Container(
      margin: EdgeInsets.all(1),
      alignment: Alignment.center,
      height: size.height * .6 * .16,
      width: size.width * .45,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(fontFamily: 'AraHamah1964B-Bold', fontSize: 35),
          ),
          if (arrow) Spacer(),
          if (arrow)
            Icon(
              Icons.keyboard_arrow_down_outlined,
              color: Colors.white,
            )
        ],
      ),
    );
  }
}
