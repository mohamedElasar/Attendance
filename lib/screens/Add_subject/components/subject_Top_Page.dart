import 'package:flutter/material.dart';

class Subject_Top_Page extends StatelessWidget {
  const Subject_Top_Page({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: size.height * .1,
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            size: 30,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'المواد الدراسية',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'AraHamah1964B-Bold'),
              ),
            ),
          ),
          Icon(
            Icons.arrow_right_outlined,
          ),
        ],
      ),
    );
  }
}
