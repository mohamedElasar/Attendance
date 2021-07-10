import 'package:flutter/material.dart';

import '../../../constants.dart';

class Login_Form extends StatefulWidget {
  const Login_Form({Key? key}) : super(key: key);

  @override
  _Login_FormState createState() => _Login_FormState();
}

class _Login_FormState extends State<Login_Form> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late FocusNode myFocusNode;

  var _isLoading = false;

  bool _rememberme = false;
  Map<String, String> _authData = {
    'Username': '',
    'Password': '',
  };

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    // log user in
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 54,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: kTextColor1,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextFormField(
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,
              onEditingComplete: () => myFocusNode.requestFocus(),
              onSaved: (value) {
                _authData['Username'] = value!;
              },
              keyboardType: TextInputType.text,
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: "Username",
                hintStyle: TextStyle(
                  color: kTextColor2.withOpacity(1),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 54,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextFormField(
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,
              focusNode: myFocusNode,
              onSaved: (value) {
                _authData['password'] = value!;
              },
              obscureText: true,
              keyboardType: TextInputType.text,
              scrollPadding: const EdgeInsets.only(bottom: 32.0),
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(
                  color: kTextColor2.withOpacity(1),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
              ),
            ),
          ),
          if (!_isLoading)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: Container(
                child: CheckboxListTile(
                  title: Text('? Remember Me'),
                  value: _rememberme,
                  onChanged: (newval) {
                    setState(() {
                      _rememberme = newval!;
                    });
                  },
                  // selected: _rememberme,
                ),
              ),
            ),
          if (_isLoading)
            Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: CircularProgressIndicator())
          else
            TextButton(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Log In',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              style: TextButton.styleFrom(
                primary: kTextColor1,
                backgroundColor: kbuttonColor1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
              onPressed: _submit,
            )
        ],
      ),
    );
  }
}
