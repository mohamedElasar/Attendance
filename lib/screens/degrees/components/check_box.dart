// import 'package:flutter/material.dart';

// bool added= false ;

// class CheckBox<V> {
//   const CheckBox(this.value, this.label );
 
//   final V value;
//   final String label;
// }

// class MultiSelectDialog<V> extends StatefulWidget {
//    static bool add= added;
  
//   MultiSelectDialog(
//       {Key? key, required this.items, required this.initialSelectedValues})
//       : super(key: key);

//   final List<CheckBox<V>> items;
//   final Set<V> initialSelectedValues;

//   @override
//   State<StatefulWidget> createState() => _MultiSelectDialogState<V>();
// }

// class _MultiSelectDialogState<V> extends State<MultiSelectDialog<V>> {
//   final _selectedValues = Set<V>();
//   // static bool isadded = added;

//   void initState() {
//     super.initState();
//     if (widget.initialSelectedValues != null) {
//       _selectedValues.addAll(widget.initialSelectedValues);
//     }
//   }

//   void _onItemCheckedChange(V itemValue, bool checked) {
//     setState(() {
//       if (checked) {
//         _selectedValues.add(itemValue);
//         added = !added;
//       } else {
//         _selectedValues.remove(itemValue);
//         added = !added;
//       }
//     });
//   }

//   void _onCancelTap() {
//     Navigator.pop(context);
//      setState(() {
//       added = !added;
//     });
//   }

//   void _onSubmitTap() {
//     Navigator.pop(context, _selectedValues);
//     setState(() {
//       added = !added;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('أختار مجموعة'),
//       contentPadding: EdgeInsets.only(top: 12.0),
//       content: SingleChildScrollView(
//         child: ListTileTheme(
//           contentPadding: EdgeInsets.fromLTRB(14.0, 0.0, 24.0, 0.0),
//           child: ListBody(
//             children: widget.items.map(_buildItem).toList(),
//           ),
//         ),
//       ),
//       actions: <Widget>[
//         FlatButton(
//           child: Text('CANCEL'),
//           onPressed: _onCancelTap,
//         ),
//         FlatButton(
//           child: Text('OK'),
//           onPressed: _onSubmitTap,
//         )
//       ],
//     );
//   }

//   Widget _buildItem(CheckBox<V> item) {
//     final checked = _selectedValues.contains(item.value);
//     return CheckboxListTile(
//       value: checked,
//       title: Text(item.label),
//       controlAffinity: ListTileControlAffinity.leading,
//       onChanged: (checked) => _onItemCheckedChange(item.value, checked!),
//     );
//   }
// }
