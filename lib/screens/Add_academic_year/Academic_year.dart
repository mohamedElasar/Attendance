import 'dart:ui';

import 'package:attendance/managers/Auth_manager.dart';
import 'package:attendance/managers/stage_manager.dart';
import 'package:attendance/managers/year_manager.dart';
import 'package:attendance/navigation/screens.dart';
import 'package:attendance/screens/Students/components/Students_Top_Page.dart';
import 'package:attendance/screens/degrees/components/Degrees_top.dart';
import 'package:attendance/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_select/smart_select.dart';
import '../../constants.dart';

import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'components/Academic_Top_Page.dart';
import 'components/default_form_field.dart';

class Add_academic_year extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Attendance_Screens.years_add,
      key: ValueKey(Attendance_Screens.years_add),
      child: Add_academic_year(),
    );
  }

  Add_academic_year({
    Key? key,
  }) : super(key: key);

  @override
  _Add_academic_yearState createState() => _Add_academic_yearState();
}

class _Add_academic_yearState extends State<Add_academic_year> {
  var yearController = TextEditingController();

  String text_value = '';
  Map<String, dynamic> _add_data = {'stage': null, 'id': null};
  var _isInit = true;
  var _isLoading = false;
  ScrollController _sc = new ScrollController();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      Provider.of<YearManager>(context, listen: false).resetlist();
      _sc.addListener(() {
        if (_sc.position.pixels == _sc.position.maxScrollExtent) {
          Provider.of<YearManager>(context, listen: false).getMoreData();
        }
      });
    });
  }

  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<StageManager>(context, listen: false)
          .get_stages()
          .then((value) =>
              Provider.of<YearManager>(context, listen: false).getMoreData())
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
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: _isLoading
          ? Center(
              child: Splash_Screen(),
            )
          : Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  _add_data['stage'] = null;
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildPopupDialog(context),
                  );
                },
                child: Icon(Icons.add),
              ),
              backgroundColor: kbackgroundColor1,
              body: Column(
                children: [
                  Academic_Top_Page(size: size),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(top: 50),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Provider.of<Auth_manager>(context, listen: false)
                                  .name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                  fontFamily: 'AraHamah1964B-Bold'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          // vertical: 10,
                          horizontal: 15,
                        ),
                        width: MediaQuery.of(context).size.width * .95,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 2,
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Consumer<YearManager>(
                          builder: (_, yearmanager, child) {
                            if (yearmanager.years.isEmpty) {
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
                                    Provider.of<YearManager>(context,
                                            listen: false)
                                        .getMoreData();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child:
                                        Text("error please tap to try again"),
                                  ),
                                ));
                              }
                            } else {
                              return ListView.separated(
                                controller: _sc,
                                separatorBuilder:
                                    (BuildContext ctxt, int index) => Divider(
                                  color: Colors.grey,
                                ),
                                itemCount: yearmanager.years.length +
                                    (yearmanager.hasmore ? 1 : 0),
                                itemBuilder: (BuildContext ctxt, int index) {
                                  // if (index == yearmanager.years.length - 5) {
                                  //   Provider.of<YearManager>(context,
                                  //           listen: false)
                                  //       .getMoreData();
                                  // }
                                  if (index == yearmanager.years.length) {
                                    if (yearmanager.error) {
                                      return Center(
                                          child: InkWell(
                                        onTap: () {
                                          yearmanager.setloading(true);
                                          yearmanager.seterror(false);
                                          Provider.of<YearManager>(context,
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

                                  return Dismissible(
                                    key: Key(
                                        yearmanager.years[index].id.toString()),
                                    onDismissed: (DismissDirection) {
                                      setState(() {
                                        // litems.removeAt(Index);
                                      });
                                    },
                                    child: ListTile(
                                      title:
                                          Text(yearmanager.years[index].name!),
                                      leading: Text(
                                          //.stage.name
                                          yearmanager
                                              .years[index].stage!.name!),
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
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('اضافة سنة دراسية'),
      content: new Container(
        height: 180,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.zero),
          color: Colors.white,
        ),
        child: Column(
          children: [
            defaultFormField(
              text: 'السنة الدراسية',
              controller: yearController,
              prefix: Icons.calendar_today,
              type: TextInputType.name,
              validate: () {},
            ),
            Container(
              child: StatefulBuilder(
                builder: (BuildContext context, StateSetter dropDownState) {
                  return DropdownButtonHideUnderline(
                    child: DropdownButton(
                      style: TextStyle(
                          fontFamily: 'GE-medium', color: Colors.black),
                      value: _add_data['stage'],
                      hint: Text('المرحله الدراسية'),
                      isExpanded: true,
                      iconSize: 30,
                      onChanged: (newval) {
                        // setState(() {
                        //   _add_data['year'] = newval.toString();
                        // });
                        dropDownState(() {
                          _add_data['stage'] = newval;
                        });
                      },
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: Provider.of<StageManager>(context, listen: false)
                          .stages!
                          .map((item) => DropdownMenuItem(
                                child: Text(item.name!),
                                value: item.name!,
                                onTap: () {
                                  setState(() {
                                    _add_data['id'] = item.id;
                                    // print(_add_data['id']);
                                  });
                                },
                              ))
                          .toList(),
                    ),
                  );
                },
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: kbackgroundColor1),
                    onPressed: () {
                      setState(() {
                        text_value = yearController.text;
                      });
                      if (_add_data['stage'] == null) return;
                      if (text_value == '') return;
                      Provider.of<YearManager>(context, listen: false)
                          .add_year(text_value, _add_data['id']!.toString())
                          .then((value) => Navigator.of(context).pop())
                          .then(
                            (value) => setState(() {
                              _isInit = true;
                            }),
                          )
                          .then((value) {
                        Provider.of<YearManager>(context, listen: false)
                            .resetlist();
                      });
                      // litems.add(text_value);
                      yearController.clear();
                    },
                    child: Text(
                      'اضافة',
                      style: TextStyle(
                          color: Colors.black, fontFamily: 'GE-medium'),
                    )),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: kbackgroundColor1),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'الغاء',
                    style:
                        TextStyle(color: Colors.black, fontFamily: 'GE-medium'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
