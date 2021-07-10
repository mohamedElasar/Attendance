import 'package:attendance/screens/Add_group/components/group_form.dart';
import 'package:attendance/screens/Add_teacher/components/Teacher_Form.dart';
import 'package:flutter/material.dart';

class Add_group_screen extends StatelessWidget {
  const Add_group_screen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'تسجيل مجموعه',
            style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontFamily: 'AraHamah1964B-Bold'),
          ),
        ),
        actions: [
          SizedBox(width: 10),
          CircleAvatar(
            minRadius: 25,
            backgroundImage: AssetImage('assets/images/Group.png'),
          ),
          SizedBox(
            width: 50,
          ),
          Icon(
            Icons.save_rounded,
            color: Colors.orange[200],
            size: 40,
          ),
          SizedBox(
            width: 20,
          )
        ],
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(child: group_form(size: size)),
    );
  }
}
