import 'package:flutter/material.dart';

class Practice extends StatefulWidget {
  const Practice({Key? key}) : super(key: key);

  @override
  State<Practice> createState() => _PracticeState();
}

class Task {
  String name;
  bool isSet;

  Task({required this.name, this.isSet = false});
}

class _PracticeState extends State<Practice> {
  List<Task> todos = [];
  TextEditingController _txt = TextEditingController();

  void delete(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void add() {
    String name = _txt.text.trim();
    if (name.isNotEmpty) {
      setState(() {
        todos.add(Task(name: name));
      });
      _txt.clear();
    }
  }

  void set(int index) {
    setState(() {
      todos[index].isSet = !todos[index].isSet;
    });
  }

  Widget create(Task t, int index) {
    return ListTile(
      leading: Checkbox(
        value: t.isSet,
        onChanged: (value) {
          set(index);
        },
      ),
      title: Text(
        t.name,
        style: TextStyle(
          decoration: t.isSet ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          delete(index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _txt,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                hintText: "Enter the task",
              ),

            ),
            Center(
              child: ListView.builder(
                shrinkWrap: true,
                primary: true,
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return create(todos[todos.length-index-1], todos.length-index-1);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: add,
      ),
    );
  }
}
