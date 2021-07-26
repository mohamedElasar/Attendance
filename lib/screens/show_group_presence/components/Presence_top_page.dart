import 'package:flutter/material.dart';

class Show_Presence_Top_Page extends StatelessWidget {
  const Show_Presence_Top_Page({Key? key, required this.size}) : super(key: key);
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.person,
              size: 40,
            ),
          ),
          SizedBox(
            width: 30,
          ),

          Center(
            child: Text(
              'حصة الأحد',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'AraHamah1964B-Bold'
                  ),
            ),
          ),
          // Icon(
          //   Icons.arrow_right_outlined,
          // ),
        ],
      ),
    );
  }
}
