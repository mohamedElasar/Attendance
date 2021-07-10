import 'package:flutter/material.dart';

import '../../../constants.dart';

class Students_Page_Title extends StatelessWidget {
  const Students_Page_Title({
    Key? key,
    required this.title,
  }) : super(key: key);

  final title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        title,
        style: TextStyle(
            fontFamily: 'GE-bold', fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
