import 'package:attendance/screens/Add_teacher/components/Teacher_Form.dart';
import 'package:flutter/material.dart';

class Add_Teacher_Screeen extends StatelessWidget {
  const Add_Teacher_Screeen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'تسجيل معلم',
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
            backgroundImage: AssetImage('assets/images/pic2.png'),
          ),
          SizedBox(
            width: 70,
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
      body: SingleChildScrollView(child: Teacher_Form(size: size)),
    );
  }
}
