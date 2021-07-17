import 'package:flutter/material.dart';

import '../../../constants.dart';

class TABLE_HEAD_2 extends StatelessWidget {
  const TABLE_HEAD_2({
    Key? key,
    required this.size,
    // required this.color,
    required this.data,
    this.head = true,
  }) : super(key: key);
  final size;
  // final Color color;
  final List<dynamic> data;
  final bool head;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // color: color,
          ),
      height: 30,
      child: Row(
        children: [
          Spacer(),
          CELL_2(
            height: 30,
            width: size.width / 5,
            text: data[0],
            head: head,
          ),
          CELL_2(
            height: 30,
            width: size.width / 3,
            text: data[1],
            head: head,
          ),
          head
              ? CELL_2(
                  height: 30,
                  width: size.width / 5,
                  text: data[2],
                  head: head,
                )
              : CELL_Icon(
                  height: 30,
                  width: size.width / 5,
                  attend: data[2],
                ),
          CELL_2(
            height: 30,
            width: size.width / 5,
            text: data[3],
            head: head,
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class CELL_2 extends StatelessWidget {
  const CELL_2(
      {Key? key,
      required this.width,
      required this.height,
      required this.text,
      this.head = true})
      : super(key: key);
  final double width;
  final double height;
  final text;
  final bool head;
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 18, fontFamily: 'GE-bold');
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          border: Border.all(width: 1),
          color: head ? kbuttonColor3 : Colors.transparent),
      child: Center(
          child: Text(
        text,
        style: textStyle,
      )),
    );
  }
}

class CELL_Icon extends StatelessWidget {
  const CELL_Icon(
      {Key? key, required this.width, required this.height, this.attend = true})
      : super(key: key);
  final double width;
  final double height;
  final bool attend;
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 18, fontFamily: 'GE-bold');
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
      ),
      child: Center(
        child: attend
            ? Icon(
                Icons.done,
                color: Colors.green,
              )
            : Icon(
                Icons.cancel_outlined,
                color: Colors.red,
              ),
      ),
    );
  }
}
