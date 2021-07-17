import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';

class Teacher_Form extends StatefulWidget {
  const Teacher_Form({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _Teacher_FormState createState() => _Teacher_FormState();
}

class _Teacher_FormState extends State<Teacher_Form> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  var _isLoading = false;
  Map<String, dynamic> _register_data = {
    'name': '',
    'Teacher_phone_number': '',
    'Teacher_phone_number2': '',
    'Assistant_phone_number1': '',
    'Assistant_phone_number2': '',
    'school': '',
    'years_experience': '',
    'observations': '',
    'govern_value': null,
    'subject': null,
  };

  List<S2Choice<String>> years_levels = [
    S2Choice<String>(value: 'الاول الثانوي', title: 'الاول الثانوي'),
    S2Choice<String>(value: 'الثاني الثانوي', title: 'الثانى الثانوي'),
    S2Choice<String>(value: 'الثالث الثانوي', title: 'الثالث الثانوي'),
  ];
  List<String> _years_levels = [];

  
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var alternativePhoneController = TextEditingController();

  var yearsController = TextEditingController();
  var languageController = TextEditingController();
  var governomentController = TextEditingController();

  var schoolController = TextEditingController();
  var assistantphoneController = TextEditingController();
  var assisAlternativePhoneController = TextEditingController();
  var notesController = TextEditingController();
  var experienceController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * .8,
      width: widget.size.width,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 5,
            ),
            build_edit_field(
              item: 'name',
              hint: 'الاسم',
              controller: nameController,
              inputType: TextInputType.name
            ),
            build_edit_field(
              item: 'Teacher_phone_number',
              hint: 'رقم التليفون',
              controller: phoneController,
              inputType: TextInputType.phone
            ),
            build_edit_field(
              item: 'Teacher_phone_number2',
              hint: 'رقم تليفون بديل',
              controller: alternativePhoneController,
              inputType: TextInputType.phone
            
            ),
            Center(
              child: Container(
                width: widget.size.width * .9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        alignment: Alignment.centerRight,
                        width: widget.size.width / 2 * .9,
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
                        width: widget.size.width / 2 * .9,
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
                              value: _register_data['govern_value'],
                              hint: Text('المحافظه'),
                              isExpanded: true,
                              iconSize: 30,
                              onChanged: (newval) {
                                setState(() {
                                  _register_data['govern_value'] =
                                      newval.toString();
                                });
                              },
                              icon: Icon(Icons.keyboard_arrow_down),
                              items: ['الجيزه', 'القاهره']
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
            ),
            Center(
              child: Container(
                alignment: Alignment.centerRight,
                width: widget.size.width * .9,
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey),
                ),
                child: Container(
                  child: SmartSelect<String>.multiple(
                    title: 'السنوات الدراسيه',
                    value: [],
                    onChange: (selected) =>
                        setState(() => _years_levels = selected.value),
                    choiceItems: years_levels,
                    modalType: S2ModalType.bottomSheet,
                    tileBuilder: (context, state) {
                      return S2Tile.fromState(
                        state,
                        isTwoLine: true,
                      );
                    },
                  ),
                ),
              ),
            ),
            build_edit_field(
              item: 'Assistant_phone_number1',
              hint: 'رقم تليفون مساعد',
              controller: assistantphoneController,
              inputType: TextInputType.phone

            ),
            build_edit_field(
              item: 'Assistant_phone_number2',
              hint: 'رقم تليفون مساعد 2',
              controller: assisAlternativePhoneController,
              inputType: TextInputType.phone
            ),
            build_edit_field(
              item: 'school',
              hint: 'المدرسه',
              controller: schoolController,
              inputType: TextInputType.text
            ),
            build_edit_field(
              item: 'years_experience',
              hint: 'سنوات الخبره',
              controller: yearsController,
              inputType: TextInputType.number
            ),
            build_edit_field(item: 'observations', hint: 'ملاحظات',
             controller: notesController,
              inputType: TextInputType.text
            
            ),
          ],
        ),
      ),
    );
  }

  Center build_edit_field(
      {required String item, required String hint, bool small = false,
       required TextEditingController controller,
       required TextInputType inputType,
       Function? validate,
      
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
            keyboardType: inputType,
            controller: controller,
            // validator:validate() ,
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
