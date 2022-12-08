import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/todo_provider.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      onPressed: () {
        Provider.of<Todo>(context, listen: false).addTaskInList();
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
