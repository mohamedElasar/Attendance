import 'package:attendance/managers/App_State_manager.dart';
import 'package:attendance/navigation/screens.dart';
import 'package:attendance/screens/Students/components/Students_Top_Page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import 'components/choices.dart';
import 'components/options_widget.dart';

class Home_Screen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Attendance_Screens.homepath,
      key: ValueKey(Attendance_Screens.homepath),
      child: const Home_Screen(),
    );
  }

  const Home_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kbackgroundColor2,
        body: (Column(
          children: [
            Student_Top_Page(
              size: size,
              arrowback: false,
            ),
            Options(size: size),
            SizedBox(height: 10),
            Choices(size: size),
            // build_chip_container_down(null, 'مجموعه الحضور'),
            SizedBox(
              height: 10,
            ),
            Consumer<AppStateManager>(
              builder: (context, appstatemanager, child) => GestureDetector(
                onTap: appstatemanager.homeOptions ? () {} : null,
                child: Scan_button(
                  active: appstatemanager.homeOptions,
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}

class Scan_button extends StatelessWidget {
  const Scan_button({Key? key, required this.active}) : super(key: key);
  final bool active;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all()),
      child: Container(
        alignment: Alignment.center,
        height: 70,
        width: 70,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: active ? Colors.black54 : Colors.black26),
        child: Text(
          'Scan',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
