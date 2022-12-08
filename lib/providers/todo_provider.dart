import 'package:flutter/cupertino.dart';
import '../models/Task.dart';

class Todo extends ChangeNotifier {
  List<TaskModel> taskList = [];

  addTaskInList() {
    TaskModel taskModel = TaskModel("Task no. ${taskList.length}",
        "This is the task detail no. ${taskList.length}");
    taskList.add(taskModel);

    notifyListeners();
  }
}
