import 'package:attendance/managers/App_State_manager.dart';
import 'package:attendance/navigation/screens.dart';
import 'package:attendance/screens/Add_group/components/group_form.dart';
import 'package:attendance/screens/Add_teacher/components/Teacher_Form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Add_group_screen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Attendance_Screens.group_registerpath,
      key: ValueKey(Attendance_Screens.group_registerpath),
      child: const Add_group_screen(),
    );
  }

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
            width: 30,
          ),
          InkWell(
            onTap: () {
              Provider.of<AppStateManager>(context, listen: false).go_to_Home();
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
      body: SingleChildScrollView(
        child: group_form(size: size),
      ),
    );
  }
}
