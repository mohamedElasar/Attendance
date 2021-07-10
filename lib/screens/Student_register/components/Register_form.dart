import 'package:flutter/material.dart';

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
    'second_lang': '',
    'observations': '',
  };

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
                    ),
                    build_edit_field(
                      item: 'relation',
                      hint: 'القرابه',
                      small: true,
                    ),
                  ],
                ),
              ),
            ),
            build_edit_field(
              item: 'parent_phone',
              hint: 'رقم تليفون ولى الأمر',
            ),
            build_edit_field(
              item: 'parent_watsapp',
              hint: 'رقم واتساب ولى الأمر',
            ),
            Center(
              child: Container(
                width: widget.size.width * .9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Edit_Text(
                        size: widget.size / 2, name: 'النوع', arrow: true),
                    Edit_Text(
                        size: widget.size / 2, name: 'الشعبه', arrow: true)
                  ],
                ),
              ),
            ),
            Edit_Text(
              size: widget.size,
              name: 'المحافظه',
              arrow: true,
            ),
            build_edit_field(
              item: 'school',
              hint: 'المدرسه',
            ),
            build_edit_field(
              item: 'code',
              hint: 'الكود الخاص',
            ),
            Center(
              child: Container(
                width: widget.size.width * .9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Edit_Text(size: widget.size / 2, name: 'المجموعه'),
                    build_edit_field(
                      item: 'group',
                      hint: 'المجموعه',
                      small: true,
                    ),
                    build_edit_field(
                      item: 'discount',
                      hint: 'الخصم',
                      small: true,
                    ),
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
                    Edit_Text(size: widget.size / 2, name: 'سكان'),
                    build_edit_field(
                      item: 'second_lang',
                      hint: 'اللغه الثانيه',
                      small: true,
                    ),
                  ],
                ),
              ),
            ),
            build_edit_field(item: 'observations', hint: 'ملاحظات'),
          ],
        ),
      ),
    );
  }

  Center build_edit_field(
      {required String item, required String hint, bool small = false}) {
    return Center(
      child: Container(
        alignment: Alignment.centerRight,
        width: small ? widget.size.width * .9 / 2 : widget.size.width * .9,
        // margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 40,
        // width: 300,
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
            keyboardType: TextInputType.text,
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
  const Edit_Text({
    Key? key,
    required this.size,
    required this.name,
    this.arrow = false,
  }) : super(key: key);

  final Size size;
  final String name;
  final bool arrow;

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
          color: Colors.white,
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
                Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.black,
                )
            ],
          ),
        ),
      ),
    );
  }
}
