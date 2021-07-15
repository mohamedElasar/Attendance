import 'package:attendance/constants.dart';
import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';

class group_form extends StatefulWidget {
  const group_form({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _group_formState createState() => _group_formState();
}

class _group_formState extends State<group_form> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
  }

  //  _formKey.currentState.save();
  //    Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => Home()),);

  var _isLoading = false;
  Map<String, dynamic> _register_data = {
    'name': '',
    'subject': null,
    'teacher': null,
    'year_level': null,
  };
  List<int> days = [];
  var day_selected = null;
  int count = 1;
  List<dynamic> _data = [null, null, null, null, null, null, null, null];
  List<String> weekdays = [
    'سبت',
    'أحد',
    'اثنين',
    'ثلاثاء',
    'أربعاء',
    'خميس',
    'جمعه',
  ];
  List<dynamic> _times = [
    TimeOfDay.now(),
    TimeOfDay.now(),
    TimeOfDay.now(),
    TimeOfDay.now(),
    TimeOfDay.now(),
    TimeOfDay.now(),
    TimeOfDay.now(),
    TimeOfDay.now(),
  ];

  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);

  void _selectTime(int e) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _times[e] = newTime;
      });
    }
  }

  var nameController = TextEditingController();
  var subjectController = TextEditingController();
  var teacherController = TextEditingController();
  var yearController = TextEditingController();
  var dateController = TextEditingController();

    DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2021, 7),
        lastDate: DateTime(2050));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * .9,
      width: widget.size.width,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              height: widget.size.height * .3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  build_edit_field(
                      item: 'name',
                      hint: 'الاسم',
                      inputType: TextInputType.name,
                      controller: nameController),
                  Center(
                    child: Container(
                      alignment: Alignment.centerRight,
                      width: widget.size.width * .9,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Container(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            style: TextStyle(
                                fontFamily: 'GE-medium', color: Colors.black),
                            value: _register_data['subject'],
                            hint: Text('الماده'),
                            isExpanded: true,
                            iconSize: 30,
                            onChanged: (newval) {
                              setState(() {
                                _register_data['subject'] = newval.toString();
                              });
                            },
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: ['لغه عربيه', 'رياضيات']
                                .map((item) => DropdownMenuItem(
                                      child: Text(item),
                                      value: item,
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.centerRight,
                      width: widget.size.width * .9,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Container(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            style: TextStyle(
                                fontFamily: 'GE-medium', color: Colors.black),
                            value: _register_data['teacher'],
                            hint: Text('المدرس'),
                            isExpanded: true,
                            iconSize: 30,
                            onChanged: (newval) {
                              setState(() {
                                _register_data['teacher'] = newval.toString();
                              });
                            },
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: ['سامح احمد', 'عبد المعز']
                                .map((item) => DropdownMenuItem(
                                      child: Text(item),
                                      value: item,
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.centerRight,
                      width: widget.size.width * .9,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Container(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            style: TextStyle(
                                fontFamily: 'GE-medium', color: Colors.black),
                            value: _register_data['year_level'],
                            hint: Text('السنه الدراسيه'),
                            isExpanded: true,
                            iconSize: 30,
                            onChanged: (newval) {
                              setState(() {
                                _register_data['year_level'] =
                                    newval.toString();
                              });
                            },
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: ['الثانى الثانوي', 'الاول الثانوي']
                                .map((item) => DropdownMenuItem(
                                      child: Text(item),
                                      value: item,
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
           

              Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Text("${selectedDate.toLocal()}".split(' ')[0]),
            // SizedBox(height: 20.0,),
            RaisedButton(
              onPressed: () => _selectDate(context),
              child: Text('From .. To'),
              color: Colors.white,
              
            ),
          ],
        ),
      ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (days.length < 7) {
                          days.add(count);
                          count++;
                          print(_data);
                        }
                      });
                    },
                    child: Center(
                      child: Container(
                        width: widget.size.width * .4,
                        height: 25,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color: kbackgroundColor1,
                            borderRadius: BorderRadius.circular(15)),
                        child: Align(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'اضافه موعد',
                                style: TextStyle(fontFamily: 'GE-medium'),
                              ),
                              Icon(Icons.add)
                            ],
                          ),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Dismissible(
                    background: Container(
                      // color: Colors.red,
                      child: Icon(
                        Icons.delete,
                        color: Colors.red[400],
                        size: 30,
                      ),
                    ),
                    key: UniqueKey(),
                    onDismissed: (DismissDirection direction) {
                      setState(() {
                        _data = [
                          null,
                          null,
                          null,
                          null,
                          null,
                          null,
                          null,
                          null,
                        ];
                        count = 1;
                        days = [];
                        _times = [
                          TimeOfDay.now(),
                          TimeOfDay.now(),
                          TimeOfDay.now(),
                          TimeOfDay.now(),
                          TimeOfDay.now(),
                          TimeOfDay.now(),
                          TimeOfDay.now(),
                          TimeOfDay.now(),
                        ];
                      });
                    },
                    child: Container(
                      height: widget.size.height * .4,
                      child: ListView(
                          children: days
                              .map(
                                (e) => Center(
                                  child: Container(
                                    width: widget.size.width * .9,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            width: widget.size.width / 3 * .9,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20),
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              // borderRadius:
                                              //     BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey),
                                            ),
                                            child: Container(
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                  style: TextStyle(
                                                      fontFamily: 'GE-medium',
                                                      color: Colors.black),
                                                  value: _data[e - 1],
                                                  hint: Text('اليوم'),
                                                  isExpanded: true,
                                                  iconSize: 30,
                                                  onChanged: (newval) {
                                                    setState(() {
                                                      _data[e - 1] =
                                                          newval.toString();
                                                    });
                                                  },
                                                  icon: Icon(Icons
                                                      .keyboard_arrow_down),
                                                  items: weekdays
                                                      .map((item) =>
                                                          DropdownMenuItem(
                                                            child: Text(item),
                                                            value: item,
                                                          ))
                                                      .toList(),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () => _selectTime(e),
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            width: widget.size.width / 3 * .9,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20),
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: kbackgroundColor3,
                                              border: Border.all(
                                                  color: Colors.grey),
                                            ),
                                            child: Text(
                                              '${_times[e].format(context)}',
                                              style: TextStyle(
                                                  fontFamily: 'GE-medium',
                                                  color: Colors.black54),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList()),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Center build_edit_field({
    required String item,
    required String hint,
    bool small = false,
    required TextEditingController controller,
    required TextInputType inputType,
    // Function? on_tap,
    
    
    // String Function(String)? validate,
  }) {
    return Center(
      child: Container(
        alignment: Alignment.centerRight,
        width: small ? widget.size.width * .9 / 2 : widget.size.width * .9,
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey),
        ),
        child: Container(
          child: TextFormField(
            onSaved: (value) {
              _register_data[item] = value!;
            },
            // onTap: on_tap,
            
            keyboardType: inputType,
            controller: controller,
            // validator:validate ,
            onChanged: (value) {},
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                fontFamily: 'GE-medium',
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
