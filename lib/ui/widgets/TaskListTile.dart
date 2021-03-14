import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tasks/utils/TaskStatus.dart';


class TaskListTile extends StatelessWidget {
  @required TaskStatus status;
  @required String title;
  String subtitle;
  IconData icon;
  

  @required DateTime dueDate;


  TaskListTile({
    this.status,
    this.icon,
    this.title,
    this.dueDate
});


  @override
  Widget build(BuildContext context) {

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.15,
      child: Container(
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: setStatusColor(status),
            child: Icon(icon),
          ),
          title: Text(title),
          subtitle: null,
          // subtitle: Text(subtitle),

        ),
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Archive',
          color: Colors.blue,
          icon: Icons.archive,
          onTap: () => _showSnackBar('Archive'),
        ),
        IconSlideAction(
          caption: 'Share',
          color: Colors.indigo,
          icon: Icons.share,
          onTap: () => _showSnackBar('Share'),
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Edit',
          color: Colors.black45,
          icon: Icons.edit,
          onTap: () => _showSnackBar('More'),
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => _showSnackBar('Delete'),
        ),
      ],
    );
  }




  Color setStatusColor(TaskStatus status){
    switch(status){
      case TaskStatus.canceled:
        return Colors.grey;
        break;
        
      case TaskStatus.ongoing:
        return Colors.yellow;
        break;
        
      case TaskStatus.complete:
        return Colors.green;
        break;
        
      case TaskStatus.pending:
        return Colors.indigo;
        break;
        
      default:
        return Colors.red;
        break;
    }
  }
  
  
  void _showSnackBar(String some){}

}



