import 'package:flutter/material.dart';
import 'package:todoey_app/components/task_tile.dart';
class Todoey extends StatefulWidget {
  const Todoey({Key? key}) : super(key: key);

  @override
  _TodoeyState createState() => _TodoeyState();
}

class _TodoeyState extends State<Todoey> {
  final textController = TextEditingController();
  List<String> _taskItems = [];


  void removeTask(int index){
    setState(() {
      _taskItems.removeAt(index);
    });
  }

  Widget taskTile(String task, int index, ) {

    return Dismissible(key: ValueKey(_taskItems[index]),
      onDismissed: (direction){},
      confirmDismiss: (direction) async{
      return await showDialog(context: context, builder: (_)=> deleteTask(index));},
      background:  Container(color: Colors.red,padding: EdgeInsets.only(left: 15),
      child: Align(child: Icon(Icons.delete,color: Colors.white,),
        alignment: Alignment.centerLeft,),),
      child: ListTile(title: Text(
        task, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,
         ),),
         trailing: TaskCheckBox()
      ),
    );
  }
  void addTask(String task){
    setState(() {
      _taskItems.add(task);
    });

  }
  Widget addToTask(){
    return Container(padding: EdgeInsets.all(20),
      decoration:
      BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(20),
          topLeft: Radius.circular(20))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Add Task",textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30,
                fontWeight: FontWeight.bold,color: Colors.blueAccent),),
          TextField(controller: textController,
            autofocus: true,),
          FlatButton(color: Colors.blueAccent,
              onPressed: (){
                addTask(textController.text);
                Navigator.of(context).pop();
              }, child: Text("Add",style: TextStyle(color: Colors.white),))
        ],),
    );
  }



  Widget _buildTaskTile(){
    return ListView.builder(
        shrinkWrap: true,itemCount: _taskItems.length,
        itemBuilder: (context, index){
        return taskTile(_taskItems[index], index );}
    );
  }
 Widget deleteTask(int index){
    return AlertDialog(
      title: Text('Mark "${_taskItems[index]}" as done?'),
      actions: <Widget>[
        FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancel")
        ),
        FlatButton(
          onPressed: () {
            removeTask(index);
              Navigator.of(context).pop();},
          child: const Text("Mark as done"),
        ),
      ],
    );
 }
  bool isChecked = false;
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
                Text("${_taskItems.length} tasks",style: TextStyle(color: Colors.white,fontSize: 15,
                ),),],),),
          Expanded(
            child: Container(height: 300,
              decoration: BoxDecoration(color: Colors.white,borderRadius:
              BorderRadius.only(topLeft: Radius.circular(20),
                  topRight: Radius.circular(20))),
              child: Column(
                children: [
                _buildTaskTile()
                ],
              )

            ),
          )
        ],
      ),
    floatingActionButton: FloatingActionButton(backgroundColor: Colors.blueAccent,
      child: Icon(Icons.add),
      onPressed: (){
      showModalBottomSheet(
          context: context, builder: (context)=>addToTask());
      },),);
  }

}


