import 'package:attendance/managers/Student_manager.dart';
import 'package:attendance/managers/cities_manager.dart';
import 'package:attendance/managers/group_manager.dart';
import 'package:attendance/models/city.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smart_select/smart_select.dart';

// import 'contacts_widget.dart';

class Register_Form extends StatefulWidget {
  const Register_Form({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _Register_FormState createState() => _Register_FormState();
}

class _Register_FormState extends State<Register_Form> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  List<String> _groups_id = [];
  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    Provider.of<StudentManager>(context, listen: false).add_student(
        nameController.text,
        emailController.text,
        phonecontroller.text,
        schoolController.text,
        notesController.text,
        _selectedCity.toString(),
        _groups_id.join(','),
        parentNameController.text,
        relationController.text,
        parentphoneController.text,
        parentWhatsController.text,
        _register_data['gender'],
        studyTypeController.text,
        _register_data['language'],
        discountController.text,
        barCodeController.text,
        passwordcontroller.text,
        confirmpasswordController.text);
  }

  var _isLoading = false;
  Map<String, dynamic> _register_data = {
    // 'second_lang': '',
    'language': null,
    'observations': '',
    'gender': null,
    'track': null,
    'government': null,
  };

  var nameController = TextEditingController();
  var parentNameController = TextEditingController();
  var relationController = TextEditingController();
  var parentPhoneController = TextEditingController();
  var parentWhatsController = TextEditingController();
  var schoolController = TextEditingController();
  var barCodeController = TextEditingController();
  var groupController = TextEditingController();
  var discountController = TextEditingController();
  var languageController = TextEditingController();
  var notesController = TextEditingController();
  var emailController = TextEditingController();
  var studyTypeController = TextEditingController();
  var phonecontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var confirmpasswordController = TextEditingController();
  var parentphoneController = TextEditingController();
  late int _selectedCity;

  List<S2Choice<String>> groups = [
    S2Choice<String>(value: 'مجموعة الساعة 1', title: 'مجموعة الساعة 1'),
    S2Choice<String>(value: 'مجموعة الساعة 2', title: 'مجموعة الساعة 2'),
    S2Choice<String>(value: 'مجموعة الساعة 3', title: 'مجموعة الساعة 3'),
  ];
  List<String> _groups = [];
  final focus1 = FocusNode();
  final focus2 = FocusNode();
  final focus3 = FocusNode();
  final focus4 = FocusNode();
  final focus5 = FocusNode();
  final focus6 = FocusNode();
  final focus7 = FocusNode();
  final focus8 = FocusNode();
  final focus9 = FocusNode();
  final focus10 = FocusNode();
  final focus11 = FocusNode();
  final focus12 = FocusNode();
  final focus13 = FocusNode();
  final focus14 = FocusNode();
  var _isInit = true;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<GroupManager>(context, listen: false)
          .get_groups()
          .then((_) =>
              Provider.of<CitiesManager>(context, listen: false).get_cities())
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
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
                    inputType: TextInputType.name,
                    controller: nameController,
                    validate: (value) {
                      if (value.isEmpty) {
                        return '*';
                      }
                      return null;
                    },
                    focus: focus1,
                  ),
                  build_edit_field(
                    item: 'phonenumber',
                    hint: 'رقم التليفون',
                    inputType: TextInputType.name,
                    controller: phonecontroller,
                    validate: (value) {
                      if (value.isEmpty) {
                        return '*';
                      }
                      return null;
                    },
                    focus: focus2,
                  ),
                  build_edit_field(
                    item: 'email',
                    hint: 'الايميل',
                    inputType: TextInputType.name,
                    controller: emailController,
                    validate: (value) {
                      if (value.isEmpty) {
                        return '*';
                      }
                    },
                    focus: focus3,
                  ),
                  Center(
                    child: Container(
                      width: widget.size.width * .9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Edit_Text(size: widget.size / 2, name: 'المجموعه'),
                          build_edit_field(
                              item: 'password',
                              hint: 'password',
                              small: true,
                              inputType: TextInputType.name,
                              controller: passwordcontroller,
                              validate: (value) {
                                if (value.isEmpty) {
                                  return '*';
                                }
                              },
                              focus: focus4),
                          build_edit_field(
                              item: 'confirm_password',
                              hint: 'confirm_password',
                              small: true,
                              inputType: TextInputType.name,
                              controller: confirmpasswordController,
                              validate: (value) {
                                if (value.isEmpty) {
                                  return '*';
                                }
                              },
                              focus: focus5),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: widget.size.width * .9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Edit_Text(size: widget.size / 2, name: 'المجموعه'),
                          build_edit_field(
                              item: 'parent_name',
                              hint: 'اسم ولى الامر',
                              small: true,
                              inputType: TextInputType.name,
                              controller: parentNameController,
                              validate: (value) {
                                if (value.isEmpty) {
                                  return '*';
                                }
                              },
                              focus: focus6),
                          build_edit_field(
                              item: 'relation',
                              hint: 'القرابه',
                              small: true,
                              inputType: TextInputType.name,
                              controller: relationController,
                              validate: (value) {
                                if (value.isEmpty) {
                                  return '*';
                                }
                              },
                              focus: focus7),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        build_edit_field(
                          item: 'parent_phone',
                          hint: 'رقم تليفون ولى الأمر',
                          inputType: TextInputType.phone,
                          controller: parentphoneController,
                          small: true,
                          validate: (value) {
                            if (value.isEmpty) {
                              return '*';
                            }
                          },
                          focus: focus8,
                        ),
                        build_edit_field(
                            item: 'parent_watsapp',
                            hint: 'رقم واتساب ولى الأمر',
                            inputType: TextInputType.phone,
                            controller: parentWhatsController,
                            small: true,
                            validate: (value) {
                              if (value.isEmpty) {
                                return '*';
                              }
                            },
                            focus: focus9),
                      ],
                    ),
                  ),
                  Row(
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
                              value: _register_data['gender'],
                              hint: Text('النوع'),
                              isExpanded: true,
                              iconSize: 30,
                              onChanged: (newval) {
                                setState(() {
                                  _register_data['gender'] = newval.toString();
                                });
                              },
                              icon: Icon(Icons.keyboard_arrow_down),
                              items: ['أنثي', 'ذكر']
                                  .map((item) => DropdownMenuItem(
                                        child: Text(item),
                                        value: item,
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                      )),
                      build_edit_field(
                          item: 'studyType',
                          hint: 'الشعبه',
                          small: true,
                          inputType: TextInputType.name,
                          controller: studyTypeController,
                          validate: (value) {
                            if (value.isEmpty) {
                              return '*';
                            }
                          },
                          focus: focus10)
                    ],
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
                          value: _register_data['government'],
                          hint: Text('المحافظة'),
                          isExpanded: true,
                          iconSize: 30,
                          onChanged: (newval) {
                            setState(() {
                              _register_data['government'] = newval.toString();
                            });
                          },
                          icon: Icon(Icons.keyboard_arrow_down),
                          items:
                              Provider.of<CitiesManager>(context, listen: false)
                                  .cities!
                                  .map((item) => DropdownMenuItem(
                                        child: Text(item.name!),
                                        value: item.name,
                                        onTap: () {
                                          setState(() {
                                            _selectedCity = item.id!;
                                          });
                                        },
                                      ))
                                  .toList(),
                        ),
                      ),
                    ),
                  )),
                  build_edit_field(
                      item: 'school',
                      hint: 'المدرسه',
                      inputType: TextInputType.name,
                      controller: schoolController,
                      validate: (value) {
                        if (value.isEmpty) {
                          return '*';
                        }
                      },
                      focus: focus11),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    build_edit_field(
                        item: 'code',
                        hint: 'الكود الخاص',
                        small: true,
                        inputType: TextInputType.number,
                        controller: barCodeController,
                        validate: (value) {
                          if (value.isEmpty) {
                            return '*';
                          }
                        },
                        focus: focus12),
                    Container(
                        child: Edit_Text(
                      size: widget.size / 2,
                      name: 'scan',
                      changColor: true,
                    )),
                  ]),
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
                          title: 'المجموعة ',
                          value: [],
                          onChange: (selected) =>
                              setState(() => _groups_id = selected.value),
                          choiceItems:
                              Provider.of<GroupManager>(context, listen: false)
                                  .groups
                                  .map(
                                    (e) => S2Choice<String>(
                                        value: e.id.toString(), title: e.name),
                                  )
                                  .toList(),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      build_edit_field(
                          item: 'discount',
                          hint: 'الخصم',
                          small: true,
                          inputType: TextInputType.number,
                          controller: discountController,
                          validate: (value) {
                            if (value.isEmpty) {
                              return '*';
                            }
                          },
                          focus: focus13),
                      Center(
                        child: Container(
                          width: widget.size.width / 2 * .9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
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
                                          fontFamily: 'GE-medium',
                                          color: Colors.black),
                                      value: _register_data['language'],
                                      hint: Text('اللغة الثانية'),
                                      isExpanded: true,
                                      iconSize: 30,
                                      onChanged: (newval) {
                                        setState(() {
                                          _register_data['language'] =
                                              newval.toString();
                                        });
                                      },
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      items: ['ألماني', 'فرنساوي']
                                          .map((item) => DropdownMenuItem(
                                                child: Text(item),
                                                value: item,
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  build_edit_field(
                      item: 'observations',
                      hint: 'ملاحظات',
                      controller: notesController,
                      inputType: TextInputType.text,
                      validate: (value) {
                        if (value.isEmpty) {
                          return '*';
                        }
                      },
                      focus: focus14),
                  InkWell(
                    onTap: _submit,
                    child: Icon(Icons.done),
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
    Function(String)? validate,
    FocusNode? focus,
  }) {
    return Center(
      child: Container(
        alignment: Alignment.centerRight,
        width: small ? widget.size.width * .9 / 2 : widget.size.width * .9,
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 35,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey),
        ),
        child: Container(
          child: TextFormField(
            textInputAction: TextInputAction.next,
            focusNode: focus,
            onSaved: (value) {
              _register_data[item] = value!;
            },
            keyboardType: inputType,
            controller: controller,
            validator: (value) => validate!(value!),
            onChanged: (value) {},
            decoration: InputDecoration(
              focusedErrorBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              errorStyle: TextStyle(
                textBaseline: TextBaseline.ideographic,
                decoration: TextDecoration.none,
                fontSize: 12,
              ),
              hintText: hint,
              hintStyle: TextStyle(fontFamily: 'GE-light', fontSize: 15),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}

class Edit_Text extends StatelessWidget {
  const Edit_Text(
      {Key? key,
      required this.size,
      required this.name,
      this.arrow = false,
      this.color = Colors.white,
      this.changColor = false})
      : super(key: key);

  final Size size;
  final String name;
  final bool arrow;
  final Color color;
  final bool changColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.centerRight,
        width: size.width * .9,
        // margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 40,
        // width: 300,
        decoration: BoxDecoration(
          color: changColor ? Colors.teal[100] : color,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey),
        ),
        child: Container(
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                name,
                style: TextStyle(fontFamily: 'GE-medium'),
              ),
              if (arrow) Spacer(),
              if (arrow)
                Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}
