import 'package:flutter/material.dart';

class TaskCheckBox extends StatefulWidget {
  @override
  _TaskCheckBoxState createState() => _TaskCheckBoxState();
}

class _TaskCheckBoxState extends State<TaskCheckBox> {
   bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return
    Checkbox(value: isChecked,
        onChanged: (bool? newValue){
      setState(() {
        isChecked = newValue;
      });
    }
    );
  }

}
