import 'package:flutter/material.dart';

class Name extends StatelessWidget {
  const Name({
    Key? key,
    required this.size,
    required this.name,
    this.arrow = false,
  }) : super(key: key);

  final Size size;
  final String name;
  final bool arrow;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.centerRight,
        width: size.width * .8,
        // margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 40,
        // width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey),
        ),
        child: Container(
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(name, style: TextStyle(fontFamily: 'GE-medium')),
              if (arrow) Spacer(),
              if (arrow)
                Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.black,
                )
            ],
          ),
        ),
      ),
    );
  }
}
