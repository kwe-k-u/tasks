import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tasks/ui/widgets/TaskListTile.dart';
import 'package:tasks/utils/TaskStatus.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(itemBuilder: (context, index){
          return TaskListTile(
          title: "Important task",
          status: TaskStatus.ongoing,
          dueDate: new DateTime.now(),
          );
        }),
      ),
    );
  }


  Widget _showSnackBar(String text){
    return  SnackBar(content: Text(text));
  }
}
