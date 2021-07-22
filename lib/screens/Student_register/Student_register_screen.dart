import 'package:attendance/managers/App_State_manager.dart';
import 'package:attendance/navigation/screens.dart';
import 'package:attendance/screens/Admin_Login/components/Login_Form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import 'components/Register_form.dart';
import 'components/title_with_register.dart';

class Student_Register_Screen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Attendance_Screens.student_registerpath,
      key: ValueKey(Attendance_Screens.student_registerpath),
      child: const Student_Register_Screen(),
    );
  }

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
              width: 30,
            ),
            InkWell(
              onTap: () {
                Provider.of<AppStateManager>(context, listen: false)
                    .go_to_Home();
              },
              child: RotatedBox(
                quarterTurns: 2,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
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
