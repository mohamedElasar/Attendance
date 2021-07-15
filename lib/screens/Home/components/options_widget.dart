import 'package:attendance/managers/App_State_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class Options extends StatelessWidget {
  const Options({Key? key, required this.size}) : super(key: key);
  final size;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .11,
      width: size.width,
      child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Consumer<AppStateManager>(
            builder: (context, appstatemanager, child) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // m: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: appstatemanager.homeOptions
                      ? () async {
                          appstatemanager.studentsCommunicate();
                        }
                      : null,
                  child: Chip_Container(
                      size: size,
                      active: appstatemanager.homeOptions ? true : false,
                      text: 'تواصل مع مجموعه'),
                ),
                GestureDetector(
                  onTap: appstatemanager.homeOptions
                      ? () async {
                          appstatemanager.studentsData();
                        }
                      : null,
                  child: Chip_Container(
                      size: size,
                      active: appstatemanager.homeOptions ? true : false,
                      text: 'بيانات مجموعه'),
                ),
                GestureDetector(
                  onTap: appstatemanager.homeOptions
                      ? () async {
                          appstatemanager.modifyLesson();
                        }
                      : null,
                  child: Chip_Container(
                    size: size,
                    active: appstatemanager.homeOptions ? true : false,
                    text: 'تعديل حصه',
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class Chip_Container extends StatelessWidget {
  const Chip_Container({
    Key? key,
    required this.text,
    required this.size,
    required this.active,
  }) : super(key: key);
  final String text;
  final Size size;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * .3,
      alignment: Alignment.center,
      height: 30,
      padding: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        color: active ? kbackgroundColor1 : kbackgroundColor1.withOpacity(.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'AraHamah1964B-Bold',
            fontSize: 19,
            color: active ? Colors.black : Colors.black38,
          ),
        ),
      ),
    );
  }
}
