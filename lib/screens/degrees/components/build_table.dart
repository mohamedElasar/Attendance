 
 
 

// import 'package:flutter/material.dart';

// Widget buildTable (){
//      final size = MediaQuery.of(context).size;
//     return SingleChildScrollView(
//               child: Container(
//                 margin: EdgeInsets.symmetric(vertical: 20),
//                 width: size.width * .8,
//                 decoration: BoxDecoration(
//                   color: Colors.red,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(20),
//                     topRight: Radius.circular(20),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       width: size.width * 0.9,
//                       // height: 55,
//                       child: Align(
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 20),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               IconButton(
//                                 icon: Icon(
//                                   isButtomSheetShown ? Icons.edit : Icons.add,
//                                 ),
//                                 color: Colors.black,
//                                 onPressed: () {
//                                   setState(() {
//                                     isButtomSheetShown = !isButtomSheetShown;
//                                   });

//                                   setState(() {
//                                     build_row = !build_row;
//                                   });

//                                   if (isButtomSheetShown) {
//                                     var controller = scaffoldKey.currentState!
//                                             .showBottomSheet(
//                                       (context) => Container(
//                                         padding: EdgeInsets.all(20.0),
//                                         color: Colors.white,
//                                         child: Form(
//                                           key: formKey,
//                                           child: Column(
//                                             mainAxisSize: MainAxisSize.min,
//                                             children: [
//                                               Container(
//                                                 alignment:
//                                                     Alignment.centerRight,
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     .8,
//                                                 padding: EdgeInsets.symmetric(
//                                                     horizontal: 20),
//                                                 height: 40,
//                                                 decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(20),
//                                                   border: Border.all(
//                                                       color: Colors.grey),
//                                                 ),
//                                                 child:
//                                                     DropdownButtonHideUnderline(
//                                                   child: DropdownButton(
//                                                     style: TextStyle(
//                                                         fontFamily: 'GE-medium',
//                                                         color: Colors.black),
//                                                     value:
//                                                         _register_data['class'],
//                                                     hint: Text('الحصة'),
//                                                     isExpanded: true,
//                                                     iconSize: 30,
//                                                     onChanged: (newval) {
//                                                       setState(() {
//                                                         _register_data[
//                                                                 'class'] =
//                                                             newval.toString();
//                                                       });
//                                                     },
//                                                     icon: Icon(Icons
//                                                         .keyboard_arrow_down),
//                                                     items: ['1', '2', '3', '4']
//                                                         .map((item) =>
//                                                             DropdownMenuItem(
//                                                               child: Text(item),
//                                                               value: item,
//                                                             ))
//                                                         .toList(),
//                                                   ),
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 height: 15,
//                                               ),

//                                               // Container(
//                                               //   alignment:
//                                               //       Alignment.centerRight,
//                                               //   width: MediaQuery.of(context)
//                                               //           .size
//                                               //           .width *
//                                               //       .8,
//                                               //   padding: EdgeInsets.symmetric(
//                                               //       horizontal: 20),
//                                               //   height: 40,
//                                               //   decoration: BoxDecoration(
//                                               //     borderRadius:
//                                               //         BorderRadius.circular(20),
//                                               //     border: Border.all(
//                                               //         color: Colors.grey),
//                                               //   ),
//                                               //   child: ElevatedButton(
//                                               //     child: Text(status),

//                                               //     onPressed: () {
//                                               //       // if (pressattendence ==
//                                               //       //     true) {
//                                               //       //   setState(() {
//                                               //       //     pressattendence =
//                                               //       //         !pressattendence;
//                                               //       //     // status = 'غياب';
//                                               //       //   });

//                                               //       //   print("true");
//                                               //       // } else {
//                                               //       //   setState(() {
//                                               //       //     pressattendence =
//                                               //       //         !pressattendence;
//                                               //       //     // status = 'حضور';
//                                               //       //   });
//                                               //       //   print("false");
//                                               //       // }

//                                               //       print("okkkkk");
//                                               //       setState(() {
//                                               //         // pressattendence =
//                                               //         //     !pressattendence;
//                                               //         status = 'غياب';
//                                               //       });
//                                               //     },
//                                               //     // width: MediaQuery.of(context)
//                                               //     //         .size
//                                               //     //         .width *
//                                               //     //     .8,
//                                               //     //     backgroundColor: ,
//                                               //   ),
//                                               // ),
//                                               //=======
//                                               Container(
//                                                 width: MediaQuery.of(context)
//                                                         .size
//                                                         .width *
//                                                     .8,
//                                                 height: 40,
//                                                 child: ElevatedButton(
//                                                     onPressed: () {
//                                                       setState(() {
//                                                         buttonText = 'حضور';
//                                                         color = Colors.green;
//                                                         icon = Icons.check;
//                                                         icon_color =
//                                                             Colors.green;
//                                                       });
//                                                     },
//                                                     style: ButtonStyle(
//                                                       backgroundColor:
//                                                           MaterialStateProperty
//                                                               .all<Color>(
//                                                                   color),
//                                                     ),
//                                                     child: Text(buttonText)),
//                                               ),
//                                               //======
//                                               // GestureDetector(
//                                               //   onTap: () {
//                                               //     // color:
//                                               //     // Colors.accents;
//                                               //     print("okkkkk");
//                                               //     setState(() {
//                                               //       pressattendence =
//                                               //           !pressattendence;
//                                               //     });
//                                               //   },
//                                               //   child: defaultFormField(
//                                               //     // enable: true,
//                                               //     controller:
//                                               //         attendenceController,
//                                               //     type: TextInputType.text,

//                                               //     validate: (String value) {
//                                               //       if (value.isEmpty) {
//                                               //         return 'title must not be empty';
//                                               //       }

//                                               //       return null;
//                                               //     },
//                                               //     text: 'الحضور',
//                                               //     isClickable: true,
//                                               //     interact: true,
//                                               //     focus: FocusNode(),

//                                               //     prefix: Icons
//                                               //         .check_circle_outline,
//                                               //   ),
//                                               // ),
//                                               SizedBox(
//                                                 height: 15,
//                                               ),
//                                               defaultFormField(
//                                                 controller: degreeController,
//                                                 type: TextInputType.number,
//                                                 validate: (String value) {
//                                                   if (value.isEmpty) {
//                                                     return 'title must not be empty';
//                                                   }

//                                                   return null;
//                                                 },
//                                                 text: 'الدرجة',
//                                                 // enable:true,

//                                                 prefix:
//                                                     Icons.fact_check_rounded,
//                                               ),
//                                               SizedBox(
//                                                 height: 15,
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                         //   .closed
//                                         //   .then((value) {
//                                         // setState(() {
//                                         //   isButtomSheetShown = false;
//                                         // })
//                                         ;
//                                     controller.closed.then((value) {
//                                       setState(() {
//                                         isButtomSheetShown =
//                                             !isButtomSheetShown;
//                                       });
//                                     });
//                                   }

//                                   //   icon:
//                                   //   Icons.edit;
//                                   //   print(value);
//                                   // });
//                                   else {
//                                     // controller.close();
//                                     // isButtomSheetShown = false;
//                                     Navigator.of(context).pop();
//                                     setState(() {
//                                       isButtomSheetShown = !isButtomSheetShown;
//                                     });
//                                   }
//                                   setState(() {
//                                     build_row = true;
//                                   });

//                                   //////////
//                                 },
//                               ),

//                               // Container(
//                               //   alignment: Alignment.centerRight,
//                               //   width:
//                               //       MediaQuery.of(context).size.width / 2 * .8,
//                               //   padding: EdgeInsets.symmetric(horizontal: 20),
//                               //   height: 40,
//                               //   // decoration: BoxDecoration(
//                               //   //   // color: Colors.white,
//                               //   //   borderRadius: BorderRadius.circular(20),
//                               //   //   border: Border.all(color: Colors.grey),
//                               //   // ),
//                               //   child: DropdownButtonHideUnderline(
//                               //     child: DropdownButton(
//                               //       style: TextStyle(
//                               //           fontFamily: 'GE-medium',
//                               //           color: Colors.black),
//                               //       value: _register_data['name'],
//                               //       hint: Text('الاسم'),
//                               //       isExpanded: true,
//                               //       iconSize: 30,
//                               //       onChanged: (newval) {
//                               //         setState(() {
//                               //           _register_data['name'] =
//                               //               newval.toString();
//                               //         });
//                               //       },
//                               //       icon: Icon(Icons.keyboard_arrow_down),
//                               //       items: [
//                               //         'سامح الصقار',
//                               //         'محمد أحمد',
//                               //         'أكرم محمود'
//                               //       ]
//                               //           .map((item) => DropdownMenuItem(
//                               //                 child: Text(item),
//                               //                 value: item,
//                               //               ))
//                               //           .toList(),
//                               //     ),
//                               //   ),
//                               // ),

//                               Container(
//                                 alignment: Alignment.centerRight,
//                                 width:
//                                     MediaQuery.of(context).size.width / 2 * .8,
//                                 padding: EdgeInsets.symmetric(horizontal: 10),

//                                 // decoration: BoxDecoration(
//                                 //   // color: Colors.white,
//                                 //   borderRadius: BorderRadius.circular(20),
//                                 //   border: Border.all(color: Colors.grey),
//                                 // ),
//                                 child: SearchableDropdown<KeyValueModel>(
//                                   isCaseSensitiveSearch: true,
//                                   items: listan
//                                       .map((data) =>
//                                           DropdownMenuItem<KeyValueModel>(
//                                             child: Text(data.key),
//                                             value: data,
//                                           ))
//                                       .toList(),
//                                   onChanged: (KeyValueModel value) {
//                                     setState(() => _selectedValue = value);
//                                   },
//                                   hint: Text('الاسم'),
//                                 ),
//                               ),
//                               Text(
//                                 'A12345',
//                               ),
//                               // Container(
//                               //   // alignment: Alignment.centerRight,
//                               //   width:
//                               //       MediaQuery.of(context).size.width / 2 * .4,
//                               //   padding: EdgeInsets.symmetric(horizontal: 10),

//                               //   // decoration: BoxDecoration(
//                               //   //   // color: Colors.white,
//                               //   //   borderRadius: BorderRadius.circular(20),
//                               //   //   border: Border.all(color: Colors.grey),
//                               //   // ),
//                               //   child: SearchableDropdown<KeyValueCode>(
//                               //     isCaseSensitiveSearch: true,
//                               //     items: listan
//                               //         .map((data__code) =>
//                               //             DropdownMenuItem<KeyValueCode>(
//                               //               child: Text(data__code.key),
//                               //               value: data__code,
//                               //             ))
//                               //         .toList(),
//                               //     onChanged: (KeyValueCode value) {
//                               //       setState(() => _selectedCode = value  );
//                               //     },
//                               //     hint: Text('الكود'),
//                               //   ),
//                               // ),
//                             ],
//                           ),
//                         ),
//                         alignment: Alignment.center,
//                       ),
//                       decoration: BoxDecoration(
//                         color: kbackgroundColor1,
//                         border: Border.all(),
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(20),
//                           topRight: Radius.circular(20),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       width: size.width * .8,
//                       height: 30,
//                       decoration: BoxDecoration(
//                         color: Colors.green,
//                       ),
//                       child: Row(
//                         children: [
//                           buildCell(size.width * .2, 'الحصه',
//                               bkground: kbuttonColor3),
//                           buildCell(size.width * .2, 'التاريخ',
//                               bkground: kbuttonColor3),
//                           buildCell(size.width * .2, 'الحضور',
//                               bkground: kbuttonColor3),
//                           buildCell(size.width * .2, 'الدرجه',
//                               bkground: kbuttonColor3),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       width: size.width * .8,
//                       height: 30,
//                       decoration: BoxDecoration(
//                         color: Colors.green,
//                       ),
//                       child: Row(
//                         children: [
//                           buildCell(size.width * .2, '1',
//                               bkground: Colors.white),
//                           buildCell(size.width * .2, '14/2',
//                               bkground: Colors.white),
//                           buildicon(size.width * .2, 'ok',
//                               bkground: Colors.white),
//                           buildCell(size.width * .2, '80',
//                               bkground: Colors.white),
//                         ],
//                       ),
//                     ),
//                     build_row ? buildRow() : SizedBox(),

//                     // while(table_len > 0) ? buildNewTable() : SizedBox(),
//                   ],
//                 ),
//               ),
//             );
//   }