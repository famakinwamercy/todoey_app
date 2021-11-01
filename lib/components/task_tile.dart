import 'package:flutter/material.dart';
class TaskTile extends StatefulWidget {
  final String title;

  const TaskTile({Key? key, required this.title
  }) : super(key: key);

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(widget.title,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,
        decoration: TextDecoration.lineThrough ),),
      trailing: TaskCheckBox(),);
  }
}

class TaskCheckBox extends StatefulWidget {
  @override
  _TaskCheckBoxState createState() => _TaskCheckBoxState();
}

class _TaskCheckBoxState extends State<TaskCheckBox> {
   bool? isChecked = true;
   void toggleCheckBox(bool? newValue){
     setState(() {
       isChecked = newValue;
     });
   }

  @override
  Widget build(BuildContext context) {
    return
    //   Checkbox(
    //     activeColor: Colors.blueAccent,
    //     value: isChecked,
    //      onChanged:(newValue){
    //   setState((){
    //      isChecked = newValue;
    //    });}
    // );
    Checkbox(value: isChecked, onChanged: (bool? newValue){
      toggleCheckBox(newValue);
    }
    );
  }
}
