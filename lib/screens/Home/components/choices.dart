import 'package:attendance/managers/App_State_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class Choices extends StatefulWidget {
  const Choices({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _ChoicesState createState() => _ChoicesState();
}

List<String> years_levels = ['الاول الثانوي', 'الثاني الثانوي'];
List<String> subjects = ['اللغه العربيه', 'الرياضيات'];
List<String> teachers = ['احمد محمد', 'عبد المعز'];
List<String> groups = ['سنترالياسمين  1:30', 'سنتر المندره 2:30'];
var year_level = null;
var subject = null;
var teacher = null;
var group = null;

class _ChoicesState extends State<Choices> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * .53,
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Choice_container(
                  hinttext: 'السنه الدراسيه',
                  color: kbuttonColor3,
                  items: years_levels,
                  size: widget.size,
                  value: year_level,
                  fnc: (newval) {
                    setState(() {
                      year_level = newval;
                      Provider.of<AppStateManager>(context, listen: false)
                          .setHomeOptions(false);
                      subject = null;
                      teacher = null;
                      group = null;
                    });
                  },
                  active: true,
                ),
                Choice_container(
                  hinttext: 'الماده الدراسيه',
                  color: kbackgroundColor1,
                  items: subjects,
                  size: widget.size,
                  value: subject,
                  fnc: (newval) {
                    setState(() {
                      subject = newval;
                      Provider.of<AppStateManager>(context, listen: false)
                          .setHomeOptions(false);
                      teacher = null;
                      group = null;
                    });
                  },
                  active: year_level != null,
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Choice_container(
                  hinttext: 'المدرس',
                  color: kbackgroundColor1,
                  items: teachers,
                  size: widget.size,
                  value: teacher,
                  fnc: (newval) {
                    setState(() {
                      teacher = newval;
                      Provider.of<AppStateManager>(context, listen: false)
                          .setHomeOptions(false);
                      group = null;
                    });
                  },
                  active: subject != null,
                ),
                Choice_container(
                  hinttext: 'المجموعه',
                  color: kbackgroundColor3,
                  items: groups,
                  size: widget.size,
                  value: group,
                  fnc: (newval) {
                    setState(() {
                      group = newval;
                      Provider.of<AppStateManager>(context, listen: false)
                          .setHomeOptions(true);
                    });
                  },
                  active: teacher != null,
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button_Container(
                  color: kbuttonColor2,
                  size: widget.size,
                  text: 'ادخال طالب',
                  fnc: () async {
                    Provider.of<AppStateManager>(context, listen: false)
                        .registerStudent();
                  },
                ),
                Button_Container(
                  color: kbuttonColor3,
                  size: widget.size,
                  text: 'ادخال معلم',
                  fnc: () async {
                    Provider.of<AppStateManager>(context, listen: false)
                        .registerTeacher();
                  },
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button_Container(
                  color: kbackgroundColor3,
                  size: widget.size,
                  text: 'الدرجات ',
                  fnc: () {},
                ),
                Button_Container(
                  color: kbuttonColor2,
                  size: widget.size,
                  text: 'ادخال مجموعه',
                  fnc: () async {
                    Provider.of<AppStateManager>(context, listen: false)
                        .registerGroup();
                  },
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button_Container(
                  color: kbuttonColor2,
                  size: widget.size,
                  text: 'المواد الدراسيه',
                  fnc: () async {
                    Provider.of<AppStateManager>(context, listen: false)
                        .modifySubjects();
                  },
                ),
                Button_Container(
                  color: kbackgroundColor1,
                  size: widget.size,
                  text: 'السنوات الدراسيه',
                  fnc: () async {
                    Provider.of<AppStateManager>(context, listen: false)
                        .addYears();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Choice_container extends StatelessWidget {
  Choice_container(
      {Key? key,
      required this.size,
      required this.color,
      required this.items,
      required this.value,
      required this.fnc,
      required this.hinttext,
      required this.active})
      : super(key: key);
  final String hinttext;
  final Size size;
  final Color color;
  final List<String> items;
  final String value;
  final void Function(dynamic) fnc;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 6),
        margin: EdgeInsets.all(1),
        alignment: Alignment.center,
        height: size.height * .6 * .16,
        width: size.width * .45,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButton(
          // disabledHint: Text('disabled'),
          isExpanded: true,
          hint: Text(
            hinttext,
            style: TextStyle(
              fontFamily: 'AraHamah1964B-Bold',
              fontSize: 30,
              color: active ? Colors.black : Colors.black26,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          value: value,
          onChanged: active ? fnc : null,
          items: items
              .map((e) => DropdownMenuItem(
                    child: Text(
                      e,
                      style: TextStyle(
                          fontFamily: 'AraHamah1964B-Bold', fontSize: 30),
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: e,
                  ))
              .toList(),
        ));
  }
}

class Button_Container extends StatelessWidget {
  const Button_Container(
      {Key? key,
      required this.size,
      required this.color,
      required this.text,
      required this.fnc})
      : super(key: key);
  final Size size;
  final Color color;
  final String text;
  final VoidCallback fnc;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fnc,
      child: Container(
        margin: EdgeInsets.all(1),
        alignment: Alignment.center,
        height: size.height * .6 * .16,
        width: size.width * .45,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(fontFamily: 'AraHamah1964B-Bold', fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
