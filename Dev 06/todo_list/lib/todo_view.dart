import 'package:flutter/material.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  // List<String> task = [];
  final task = <String>[];
  TextEditingController taskController = TextEditingController();

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: taskController,
              decoration: const InputDecoration(
                labelText: 'Nhập tên công việc',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: addTask,
            child: const Text('Thêm công việc'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: task.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(task.elementAt(index)),
                  trailing: IconButton(
                      onPressed: () {
                        task.removeAt(index);
                        setState(() {});
                      },
                      icon: const Icon(Icons.delete),
                      ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void addTask() {
    setState(() {
      task.add(taskController.text);
      debugPrint(task.toString());
      taskController.clear();
    });
  }
}
