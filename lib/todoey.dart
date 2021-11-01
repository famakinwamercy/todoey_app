import 'package:flutter/material.dart';
import 'package:todoey_app/components/task_tile.dart';
import 'package:todoey_app/screens/add_task.dart';
class Todoey extends StatefulWidget {
  const Todoey({Key? key}) : super(key: key);

  @override
  _TodoeyState createState() => _TodoeyState();
}

class _TodoeyState extends State<Todoey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.blueAccent,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            CircleAvatar(child: Icon(Icons.list,
            size: 30,),backgroundColor: Colors.white,radius: 30,
            ),
            SizedBox(height: 10,),
            Text("Todoey",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.white),),
                Text("12 tasks",style: TextStyle(color: Colors.white,fontSize: 15),),],),),
          Expanded(
            child: Container(height: 300,
              decoration: BoxDecoration(color: Colors.white,borderRadius:
              BorderRadius.only(topLeft: Radius.circular(20),
                  topRight: Radius.circular(20))),
              child: Column(
                children: [SizedBox(height: 15,),
                  TaskTile(title: 'Buy bread',),
                  TaskTile(title: 'Buy milk',),
                  TaskTile(title: 'Buy egg',),
                ],
              )

            ),
          )
        ],
      ),
    floatingActionButton: FloatingActionButton(backgroundColor: Colors.blueAccent,
      child: Icon(Icons.add),
      onPressed: (){
      showModalBottomSheet(context: context, builder: (context)=>AddTask());
      },),);
  }
}


