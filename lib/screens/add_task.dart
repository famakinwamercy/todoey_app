
import 'package:flutter/material.dart';
class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(20),
      decoration:
    BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(20),
        topLeft: Radius.circular(20))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Text("Add Task",textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30,
            fontWeight: FontWeight.bold,color: Colors.blueAccent),),
       TextFormField(autofocus: true,),
        FlatButton(color: Colors.blueAccent,
            onPressed: (){}, child: Text("Add",style: TextStyle(color: Colors.white),))
      ],),
    );
  }
}
