import 'package:flutter/material.dart';

import '../../../constants.dart';

class Filter_Container extends StatelessWidget {
  const Filter_Container({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Filter_Chip(
                title: 'غياب',
              ),
              Filter_Chip(
                title: 'درجات',
              ),
              Filter_Chip(
                title: 'تعويضات',
              ),
              Filter_Chip(
                title: 'متوسطات',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Filter_Chip(
                title: 'خصومات',
              ),
              Filter_Chip(
                title: 'ملاحظات',
              ),
              Filter_Chip(
                title: 'شحن حصص',
              ),
              Filter_Chip(
                title: 'بونص',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Filter_Chip extends StatelessWidget {
  const Filter_Chip({
    Key? key,
    this.title,
  }) : super(key: key);
  final title;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: kbuttonColor3.withOpacity(.8),
      label: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Container(
          child: Text(
            title,
            style: TextStyle(fontSize: 16, fontFamily: 'GE-light'),
          ),
        ),
      ),
    );
  }
}
