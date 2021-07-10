import 'package:attendance/screens/Admin_Login/components/Login_Form.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'components/Register_form.dart';
import 'components/title_with_register.dart';

class Student_Register_Screen extends StatelessWidget {
  const Student_Register_Screen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'تسجيل طالب',
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
                backgroundImage: AssetImage('assets/images/pic.png')),
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
        body: SingleChildScrollView(child: Register_Form(size: size)),
      ),
    );
  }
}
