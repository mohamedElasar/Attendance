import 'package:flutter/material.dart';

class Rows_Builder extends StatelessWidget {
  final size;

  const Rows_Builder({Key? key, this.size}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return TABLE_ROW(size: size);
        },
      ),
    );
  }
}

class TABLE_ROW extends StatelessWidget {
  const TABLE_ROW({Key? key, required this.size}) : super(key: key);
  final size;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.5),
      height: 30,
      width: double.infinity,
      child: Row(
        children: [
          Spacer(),
          Round_CheckBox(height: 30, width: size.width / 8),
          // CELL_Checkbox(height: 30, width: size.width / 8),
          CELL(height: 30, width: size.width / 3, text: 'محمد أحمد'),
          CELL(height: 30, width: size.width / 6, text: 'A123'),
          CELL(height: 30, width: size.width / 5, text: '0101123'),
          Phone_Icon(height: 30, width: size.width / 7),
          Spacer(),
        ],
      ),
    );
  }
}

class CELL extends StatelessWidget {
  const CELL(
      {Key? key, required this.width, required this.height, required this.text})
      : super(key: key);
  final double width;
  final double height;
  final text;
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 20, fontFamily: 'AraHamah1964B-Bold');
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
      ),
      child: Center(
          child: Text(
        text,
        style: textStyle,
      )),
    );
  }
}

class CELL_Checkbox extends StatelessWidget {
  const CELL_Checkbox({Key? key, required this.width, required this.height})
      : super(key: key);
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
      ),
      child: Center(
        child: Checkbox(
          onChanged: (newval) {},
          value: false,
        ),
      ),
    );
  }
}

class Phone_Icon extends StatelessWidget {
  const Phone_Icon({Key? key, required this.width, required this.height})
      : super(key: key);
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration:
          BoxDecoration(border: Border.all(width: 1), color: Colors.green),
      child: Center(
        child: Icon(
          Icons.phone_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}

class Round_CheckBox extends StatefulWidget {
  const Round_CheckBox({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  _Round_CheckBoxState createState() => _Round_CheckBoxState();
  final double width;
  final double height;
}

class _Round_CheckBoxState extends State<Round_CheckBox> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _value = !_value;
        });
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(border: Border.all(width: 1)),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _value ? Colors.orange[300] : Colors.orange[100],
          ),
        ),
      ),
    );
  }
}
