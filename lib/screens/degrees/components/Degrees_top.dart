import 'package:flutter/material.dart';

class Degrees_top extends StatelessWidget {
  const Degrees_top({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 75,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'الدرجات',
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.blue,
                    fontFamily: 'AraHamah1964B-Bold'),
              ),
              SizedBox(
                width: 20,
              ),
              CircleAvatar(
                  minRadius: 30,
                  backgroundImage: AssetImage('assets/images/Group.png')),
            ],
          ),
        )
      ],
    );
  }
}
