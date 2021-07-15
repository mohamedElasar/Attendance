import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    'parent_name': '',
    'relation': '',
    'parent_phone': '',
    'parent_whatsapp': '',
    'gender': '',
    'department': '',
    'governorte': '',
    'school': '',
    'code': '',
    'group': '',
    'discount': '',
    'scan': '',
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

  List<S2Choice<String>> groups = [
    S2Choice<String>(value: 'مجموعة الساعة 1', title: 'مجموعة الساعة 1'),
    S2Choice<String>(value: 'مجموعة الساعة 2', title: 'مجموعة الساعة 2'),
    S2Choice<String>(value: 'مجموعة الساعة 3', title: 'مجموعة الساعة 3'),
  ];
  List<String> _groups = [];

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
              inputType: TextInputType.name,
              controller: nameController,
              // validate: (value) {
              //   if (value.isEmpty) {
              //     return 'This field is required';
              //   }
              // }
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
                      // validate: (value) {
                      //       if (value.isEmpty) {
                      //         return 'This field is required';
                      //       }
                      //     }
                    ),
                    build_edit_field(
                      item: 'relation',
                      hint: 'القرابه',
                      small: true,
                      inputType: TextInputType.name,
                      controller: relationController,
                      // validate: (value) {
                      //   if (value.isEmpty) {
                      //     return 'This field is required';
                      //   }
                      // }
                    ),
                  ],
                ),
              ),
            ),
            build_edit_field(
              item: 'parent_phone',
              hint: 'رقم تليفون ولى الأمر',
              inputType: TextInputType.phone,
              controller: parentNameController,
              // validate: (value) {
              //   if (value.isEmpty) {
              //     return 'This field is required';
              //   }
              // }
            ),
            build_edit_field(
              item: 'parent_watsapp',
              hint: 'رقم واتساب ولى الأمر',
              inputType: TextInputType.phone,
              controller: parentWhatsController,
              // validate: (value) {
              //   if (value.isEmpty) {
              //     return 'This field is required';
              //   }
              // }
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
                          value: _register_data['track'],
                          hint: Text('الشعبة'),
                          isExpanded: true,
                          iconSize: 30,
                          onChanged: (newval) {
                            setState(() {
                              _register_data['track'] = newval.toString();
                            });
                          },
                          icon: Icon(Icons.keyboard_arrow_down),
                          items: ['أدبي', 'علمي']
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
                    style:
                        TextStyle(fontFamily: 'GE-medium', color: Colors.black),
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
                    items: [
                      'الإسكندرية',
                      'الإسماعيلية',
                      'أسوان',
                      'أسيوط',
                      'الأقصر',
                      'البحر الأحمر',
                      'البحيرة',
                      'بني سويف',
                      'بورسعيد',
                      'جنوب سيناء',
                      'الجيزة',
                      'الدقهلية',
                      'دمياط',
                      'سوهاج',
                      'السويس',
                      'الشرقية',
                      'شمال سيناء',
                      'الغربية',
                      'الفيوم',
                      'القاهرة',
                      'القليوبية',
                      'قنا',
                      'كفر الشيخ',
                      'مطروح',
                      'المنوفية',
                      'المنيا',
                      'الوادي الجديد'
                    ]
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
              item: 'school',
              hint: 'المدرسه',
              inputType: TextInputType.name,
              controller: schoolController,
              // validate: (value) {
              //   if (value.isEmpty) {
              //     return 'This field is required';
              //   }
              // }
            ),

            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              build_edit_field(
                item: 'code',
                hint: 'الكود الخاص',
                small: true,
                inputType: TextInputType.number,
                controller: barCodeController,
                // validate: (value) {
                //   if (value.isEmpty) {
                //     return 'This field is required';
                //   }
                // }
              ),
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
                        setState(() => _groups = selected.value),
                    choiceItems: groups,
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
                  // validate: (value) {
                  //   if (value.isEmpty) {
                  //     return 'This field is required';
                  //   }
                  // }
                ),
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

              // validate: (value) {
              //             if (value.isEmpty) {
              //               return 'This field is required';
              //             }
              //           }
            ),
          
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
    //  Function ?validate ,
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
            //  validator: validate(),
            onChanged: (value) {},
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                fontFamily: 'GE-medium',
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
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
