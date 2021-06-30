import 'package:attendance/screens/Admin_Login/components/Login_Form.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import 'components/Page_Title.dart';
import 'components/Top_page.dart';

class Admin_logIn extends StatelessWidget {
  const Admin_logIn({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kbackgroundColor1,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Top_Page(size: size),
              Page_Title(title: 'Admin Log in'),
              Login_Form(),
            ],
          ),
        ),
      ),
    );
  }
}
