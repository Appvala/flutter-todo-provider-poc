import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/todo_provider.dart';
import '../presentation/widgets/add_todo_button.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          const Positioned(
            top: 40,
            left: 20,
            child: Text(
              "Todos",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Positioned(
            top: 35,
            right: 20,
            child: AddTodo(),
          ),
          Image.asset("assets/image.png"),
          DraggableScrollableSheet(
            maxChildSize: 0.85,
            minChildSize: 0.15,
            builder: (BuildContext context, ScrollController scrolController) {
              return Container(
                padding: const EdgeInsets.only(top: 24.0),
                decoration: BoxDecoration(
                  color: Colors.yellow[200],
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                ),
                child: Consumer<Todo>(builder: (context, todo, child) {
                  return (todo.taskList.isEmpty)
                      ? const Center(
                          child: Text("Add Your Tasks",
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold)))
                      : ListView.builder(
                          itemCount: todo.taskList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                todo.taskList[index].title,
                                style: TextStyle(
                                    color: Colors.grey[900],
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                todo.taskList[index].detail,
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                              trailing: const Icon(
                                Icons.check_circle,
                                color: Colors.blueAccent,
                              ),
                              isThreeLine: true,
                            );
                          },
                          controller: scrolController,
                        );
                }),
              );
            },
          )
        ],
      ),
    );
  }
}
