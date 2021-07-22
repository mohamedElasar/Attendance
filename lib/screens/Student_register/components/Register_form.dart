import 'package:attendance/helper/httpexception.dart';
import 'package:attendance/managers/Student_manager.dart';
import 'package:attendance/managers/cities_manager.dart';
import 'package:attendance/managers/group_manager.dart';
import 'package:attendance/models/city.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smart_select/smart_select.dart';

import '../../../constants.dart';

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
  void _submit() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    if (_register_data['gender'] == null ||
        _register_data['language'] == null ||
        cityname == 'المحافظه' ||
        _groups_shown.isEmpty) {
      return;
    }
    _formKey.currentState!.save();
    // print('asdasdasd');
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<StudentManager>(context, listen: false)
          .add_student(
              nameController.text,
              emailController.text,
              phonecontroller.text,
              schoolController.text,
              notesController.text,
              cityId_selected,
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
              confirmpasswordController.text)
          .then((_) {
        nameController.text = '';
        parentNameController.text = '';
        relationController.text = '';
        parentPhoneController.text = '';
        parentWhatsController.text = '';
        schoolController.text = '';
        barCodeController.text = '';
        groupController.text = '';
        discountController.text = '';
        languageController.text = '';
        notesController.text = '';
        emailController.text = '';
        studyTypeController.text = '';
        phonecontroller.text = '';
        passwordcontroller.text = '';
        confirmpasswordController.text = '';
        parentphoneController.text = '';
        _register_data['gender'] = null;
        _register_data['language'] = null;
        cityname = 'المحافظه';
        _groups_id = [];
        _groups_shown = [];
      }).then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green[300],
                content: Text(
                  'تم اضافه الطالب بنجاح',
                  style: TextStyle(fontFamily: 'GE-medium'),
                ),
                duration: Duration(seconds: 3),
              )));
    } on HttpException catch (error) {
      _showErrorDialog(error.toString());
    } catch (error) {
      const errorMessage = 'حاول مره اخري';
      _showErrorDialog(errorMessage);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'حدث خطا',
          style: TextStyle(fontFamily: 'GE-Bold'),
        ),
        content: Text(
          message,
          style: TextStyle(fontFamily: 'AraHamah1964R-Bold'),
        ),
        actions: <Widget>[
          Center(
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(kbackgroundColor1)),
              // color: kbackgroundColor1,
              child: Text(
                'حسنا',
                style: TextStyle(fontFamily: 'GE-medium', color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
          )
        ],
      ),
    );
  }

  var _isLoading = true;
  Map<String, dynamic> _register_data = {
    // 'second_lang': '',
    'language': null,
    'observations': '',
    'gender': null,
    'track': null,
    'government': null,
  };
  String cityname = 'المحافظه';
  late String cityId_selected;
  List<String> _groups_id = [];
  List<String> _groups_shown = [];

  void _modalBottomSheetMenu(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 250.0,
            color: Colors.transparent,
            child: Column(
              children: [
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kbackgroundColor3,
                  ),
                  child: Center(
                    child: Text(
                      'المحافظه',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'GE-bold',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0))),
                    child: Consumer<CitiesManager>(
                      builder: (_, citymanager, child) {
                        if (citymanager.cities!.isEmpty) {
                          if (citymanager.loading) {
                            return Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: CircularProgressIndicator(),
                            ));
                          } else if (citymanager.error) {
                            return Center(
                                child: InkWell(
                              onTap: () {
                                citymanager.setloading(true);
                                citymanager.seterror(false);
                                Provider.of<CitiesManager>(context,
                                        listen: false)
                                    .getMoreData();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text("error please tap to try again"),
                              ),
                            ));
                          }
                        } else {
                          return ListView.builder(
                            controller: _sc,
                            itemCount: citymanager.cities!.length +
                                (citymanager.hasmore ? 1 : 0),
                            itemBuilder: (BuildContext ctxt, int index) {
                              if (index == citymanager.cities!.length) {
                                if (citymanager.error) {
                                  return Center(
                                      child: InkWell(
                                    onTap: () {
                                      citymanager.setloading(true);
                                      citymanager.seterror(false);
                                      Provider.of<CitiesManager>(context,
                                              listen: false)
                                          .getMoreData();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child:
                                          Text("error please tap to try again"),
                                    ),
                                  ));
                                } else {
                                  return Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: CircularProgressIndicator(),
                                  ));
                                }
                              }

                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    cityId_selected = citymanager
                                        .cities![index].id
                                        .toString();
                                    cityname = citymanager.cities![index].name!;
                                  });
                                  Navigator.pop(context);
                                },
                                child: ListTile(
                                  title: Text(citymanager.cities![index].name!),
                                ),
                              );
                            },
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _modalBottomSheetMenumulti(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          height: 250.0,
          color: Colors.transparent,
          child: Column(
            children: [
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kbackgroundColor3,
                ),
                child: Center(
                  child: Text(
                    'المجموعات',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'GE-bold',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0))),
                  child: Consumer<GroupManager>(
                    builder: (_, yearmanager, child) {
                      if (yearmanager.groups.isEmpty) {
                        if (yearmanager.loading) {
                          return Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: CircularProgressIndicator(),
                          ));
                        } else if (yearmanager.error) {
                          return Center(
                              child: InkWell(
                            onTap: () {
                              yearmanager.setloading(true);
                              yearmanager.seterror(false);
                              Provider.of<GroupManager>(context, listen: false)
                                  .getMoreData();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text("error please tap to try again"),
                            ),
                          ));
                        }
                      } else {
                        return Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                controller: _sc2,
                                itemCount: yearmanager.groups.length +
                                    (yearmanager.hasmore ? 1 : 0),
                                itemBuilder: (BuildContext ctxt, int index) {
                                  if (index == yearmanager.groups.length) {
                                    if (yearmanager.error) {
                                      return Center(
                                          child: InkWell(
                                        onTap: () {
                                          yearmanager.setloading(true);
                                          yearmanager.seterror(false);
                                          Provider.of<GroupManager>(context,
                                                  listen: false)
                                              .getMoreData();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Text(
                                              "error please tap to try again"),
                                        ),
                                      ));
                                    } else {
                                      return Center(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: CircularProgressIndicator(),
                                      ));
                                    }
                                  }

                                  return StatefulBuilder(
                                    builder: (BuildContext context,
                                        StateSetter checkboxstate) {
                                      return ListTile(
                                        title: Text(
                                            yearmanager.groups[index].name!),
                                        leading: Checkbox(
                                          onChanged: (value) {
                                            checkboxstate(() {
                                              yearmanager
                                                      .groups[index].choosen =
                                                  !yearmanager
                                                      .groups[index].choosen!;
                                            });
                                          },
                                          value:
                                              yearmanager.groups[index].choosen,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            )
                          ],
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ).then((value) {
      setState(() {
        _groups_id = Provider.of<GroupManager>(context, listen: false)
            .groups
            .where((element) => element.choosen == true)
            .toList()
            .map((e) => e.id.toString())
            .toList();
        _groups_shown = Provider.of<GroupManager>(context, listen: false)
            .groups
            .where((element) => element.choosen == true)
            .toList()
            .map((e) => e.name.toString())
            .toList();
      });
    });
  }

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
  ScrollController _sc = new ScrollController();
  ScrollController _sc2 = new ScrollController();
  @override
  void dispose() {
    _isLoading = false;
    nameController.dispose();
    parentNameController.dispose();
    relationController.dispose();
    parentPhoneController.dispose();
    parentWhatsController.dispose();
    schoolController.dispose();
    barCodeController.dispose();
    groupController.dispose();
    discountController.dispose();
    languageController.dispose();
    notesController.dispose();
    emailController.dispose();
    studyTypeController.dispose();
    phonecontroller.dispose();
    passwordcontroller.dispose();
    confirmpasswordController.dispose();
    parentphoneController.dispose();
    focus1.dispose();
    focus2.dispose();
    focus3.dispose();
    focus4.dispose();
    focus5.dispose();
    focus6.dispose();
    focus7.dispose();
    focus8.dispose();
    focus9.dispose();
    focus10.dispose();
    focus11.dispose();
    focus12.dispose();
    focus13.dispose();
    focus14.dispose();
    _sc.dispose();
    _sc2.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<CitiesManager>(context, listen: false).resetlist();
      Provider.of<GroupManager>(context, listen: false).resetlist();

      Provider.of<CitiesManager>(context, listen: false)
          .get_cities()
          .then((value) =>
              Provider.of<GroupManager>(context, listen: false).get_groups())
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });

      _sc.addListener(
        () {
          if (_sc.position.pixels == _sc.position.maxScrollExtent) {
            Provider.of<CitiesManager>(context, listen: false).getMoreData();
          }
        },
      );
      _sc2.addListener(
        () {
          if (_sc2.position.pixels == _sc2.position.maxScrollExtent) {
            Provider.of<GroupManager>(context, listen: false).getMoreData();
          }
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: Container(
              margin: EdgeInsets.all(50),
              child: CircularProgressIndicator(),
            ),
          )
        : Container(
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
                  build_edit_field(
                    item: 'password',
                    hint: 'password',
                    // small: true,
                    inputType: TextInputType.name,
                    controller: passwordcontroller,
                    validate: (value) {
                      if (value.isEmpty) {
                        return '*';
                      }
                    },
                    focus: focus4,
                  ),
                  build_edit_field(
                      item: 'confirm_password',
                      hint: 'confirm_password',
                      // small: true,
                      inputType: TextInputType.name,
                      controller: confirmpasswordController,
                      validate: (value) {
                        if (value.isEmpty) {
                          return '*';
                        }
                      },
                      focus: focus5),
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
                                    fontFamily: 'GE-medium',
                                    color: Colors.black),
                                value: _register_data['gender'],
                                hint: Text('النوع'),
                                isExpanded: true,
                                iconSize: 30,
                                onChanged: (newval) {
                                  setState(() {
                                    _register_data['gender'] =
                                        newval.toString();
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
                            child: InkWell(
                              onTap: () => _modalBottomSheetMenu(context),
                              child: Container(
                                child: Row(
                                  children: [
                                    Text(
                                      cityname,
                                      style: TextStyle(fontFamily: 'GE-light'),
                                    ),
                                    Spacer(),
                                    Icon(Icons.keyboard_arrow_down)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                      child: InkWell(
                        onTap: () => _modalBottomSheetMenumulti(context),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        ' المجموعات الدراسيه ',
                                        style:
                                            TextStyle(fontFamily: 'GE-light'),
                                      ),
                                      Icon(Icons.keyboard_arrow_down)
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                width: widget.size.width * .9,
                                child: ListView.builder(
                                  itemCount: _groups_shown.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => Row(
                                    children: [
                                      Text(
                                        _groups_shown[index],
                                        style:
                                            TextStyle(fontFamily: 'GE-light'),
                                      ),
                                      Text(', ')
                                    ],
                                  ),
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  build_edit_field(
                      item: 'studyType',
                      hint: 'الشعبه',
                      // small: true,
                      inputType: TextInputType.name,
                      controller: studyTypeController,
                      validate: (value) {
                        if (value.isEmpty) {
                          return '*';
                        }
                      },
                      focus: focus10),
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
                  Container(
                    width: widget.size.width * .9,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                          Center(
                            child: Container(
                              alignment: Alignment.centerRight,
                              width: widget.size.width / 2 * .9,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              height: 40,
                              decoration: BoxDecoration(),
                              child: Container(
                                child: Row(
                                  children: [
                                    Text('scan code  '),
                                    Icon(Icons.camera_alt_outlined),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]),
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
                  Container(
                    width: widget.size.width * .9,
                    child: TextButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(2),
                          backgroundColor:
                              MaterialStateProperty.all(kbuttonColor2)),
                      onPressed: _submit,
                      child: Text(
                        'تسجيل',
                        style: TextStyle(
                            fontFamily: 'GE-Bold', color: Colors.black),
                      ),
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
    Function(String)? validate,
    FocusNode? focus,
  }) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        alignment: Alignment.centerRight,
        width: small ? widget.size.width * .9 / 2 : widget.size.width * .9,
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 55,
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
