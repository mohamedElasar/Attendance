import 'package:flutter/material.dart';

class Filters_top extends StatelessWidget {
  const Filters_top({
    Key? key,
    this.size,
  }) : super(key: key);
  final size;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: size.height * .1,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'سنتر الياسمين',
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.blue,
                    fontFamily: 'AraHamah1964B-Bold'),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
