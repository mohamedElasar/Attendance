import 'package:flutter/material.dart';

import '../../../constants.dart';

class Options extends StatelessWidget {
  const Options({Key? key, required this.size}) : super(key: key);
  final size;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .11,
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // m: MainAxisAlignment.spaceBetween,
          children: [
            build_chip_container(kbackgroundColor1, 'مجموعات'),
            build_chip_container(Colors.white, 'مدرسين'),
            build_chip_container(Colors.white, 'الكل'),
          ],
        ),
      ),
    );
  }

  Container build_chip_container(Color, text) {
    return Container(
      alignment: Alignment.center,
      height: 35,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        color: Color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(fontFamily: 'AraHamah1964B-Bold', fontSize: 22),
      ),
    );
  }
}
