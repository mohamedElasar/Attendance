import 'package:flutter/material.dart';

class Academic_Top_Page extends StatelessWidget {
  const Academic_Top_Page({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: size.height * .1,
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            size: 30,
          ),
          Text(
            'السنوات الدراسية',
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontFamily: 'AraHamah1964B-Bold'),
          ),
          Icon(
            Icons.arrow_right_outlined,
          ),
        ],
      ),
    );
  }
}
