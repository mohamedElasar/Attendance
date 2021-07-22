import 'package:attendance/managers/Auth_manager.dart';
import 'package:attendance/managers/stage_manager.dart';
import 'package:attendance/managers/year_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Student_Top_Page extends StatelessWidget {
  const Student_Top_Page({Key? key, required this.size, this.arrowback = true})
      : super(key: key);
  final Size size;
  final bool arrowback;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: size.height * .1,
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              //test
              InkWell(
                onTap: () {
                  Provider.of<Auth_manager>(context, listen: false).logout();
                },
                child: Icon(
                  Icons.menu,
                  size: 30,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  // margin: EdgeInsets.symmetric(horizontal: 5),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: size.height * .05,
                  // width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 1),
                        blurRadius: (1),
                        color: Colors.grey,
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            hintText: "بحث",
                            hintStyle: TextStyle(fontFamily: 'GE-light'),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                          ),
                        ),
                      ), //test
                      Icon(Icons.search)
                    ],
                  ),
                ),
              ),
              SizedBox(width: 5),
              arrowback
                  ? RotatedBox(
                      quarterTurns: 2,
                      child: Icon(
                        Icons.arrow_back,
                      ),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
