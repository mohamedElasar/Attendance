import 'package:attendance/managers/App_State_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Rows_Builder extends StatefulWidget {
  final size;

  Rows_Builder({Key? key, this.size}) : super(key: key);

  @override
  _Rows_BuilderState createState() => _Rows_BuilderState();
}

class _Rows_BuilderState extends State<Rows_Builder> {
  List<dynamic> mylist = [
    [false, 'A', 'B', 'C'],
    [false, 'D', 'E', 'F'],
    [false, 'D', 'E', 'F'],
    [false, 'D', 'E', 'F'],
    [false, 'D', 'E', 'F'],
  ];
  void _myfunction(index) {
    setState(() {
      mylist[index][0] = !mylist[index][0];
    });
  }

  void _tapFnc() {
    Provider.of<AppStateManager>(context, listen: false)
        .goToSingleStudent(true);
  }

  @override
  Widget build(BuildContext context) {
    print(mylist);
    return Expanded(
      child: ListView.builder(
        itemCount: mylist.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: TABLE_ROW(
              size: widget.size,
              name: mylist[index][1],
              id: mylist[index][2],
              mobile: mylist[index][3],
              check: mylist[index][0],
              myfnc: () => _myfunction(index),
              tapFnc: () => _tapFnc(),
            ),
          );
        },
      ),
    );
  }
}

class TABLE_ROW extends StatelessWidget {
  const TABLE_ROW({
    Key? key,
    required this.size,
    this.check = false,
    required this.name,
    required this.id,
    required this.mobile,
    required this.myfnc,
    required this.tapFnc,
  }) : super(key: key);
  final size;
  final bool check;
  final String name;
  final String id;
  final String mobile;
  final VoidCallback myfnc;
  final VoidCallback tapFnc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.5),
      height: 30,
      width: double.infinity,
      child: Row(
        children: [
          Spacer(),
          Round_check_box(
            height: 30,
            width: size.width / 8,
            check: check,
            fnc: myfnc,
          ),
          InkWell(
              onTap: tapFnc,
              child: CELL(height: 30, width: size.width / 3, text: name)),
          CELL(height: 30, width: size.width / 6, text: id),
          CELL(height: 30, width: size.width / 5, text: mobile),
          Phone_Icon(height: 30, width: size.width / 7),
          Spacer(),
        ],
      ),
    );
  }
}

class CELL extends StatelessWidget {
  const CELL({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
  }) : super(key: key);
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

// class Round_CheckBox extends StatefulWidget {
//   const Round_CheckBox(
//       {Key? key,
//       required this.width,
//       required this.height,
//       required this.check})
//       : super(key: key);

//   @override
//   _Round_CheckBoxState createState() => _Round_CheckBoxState();
//   final double width;
//   final double height;
//   final bool check;
// }

// class _Round_CheckBoxState extends State<Round_CheckBox> {
//   bool _value = widget.check;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         setState(() {
//           _value = !_value;
//         });
//       },
//       child: Container(
//         width: widget.width,
//         height: widget.height,
//         decoration: BoxDecoration(border: Border.all(width: 1)),
//         child: Container(
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: _value ? Colors.orange[300] : Colors.orange[100],
//           ),
//         ),
//       ),
//     );
//   }
// }

class Round_check_box extends StatelessWidget {
  const Round_check_box({
    Key? key,
    required this.width,
    required this.height,
    required this.check,
    required this.fnc,
  }) : super(key: key);

  final double width;
  final double height;
  final bool check;
  final VoidCallback fnc;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fnc,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(border: Border.all(width: 1)),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: check ? Colors.orange[300] : Colors.orange[100],
          ),
        ),
      ),
    );
  }
}
