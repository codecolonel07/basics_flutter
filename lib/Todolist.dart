import 'package:flutter/material.dart';

class TodoItem {
  String title;
  bool isDone;

  TodoItem({required this.title, this.isDone = false});
}

class TodoListApp extends StatefulWidget {
  @override
  _TodoListAppState createState() => _TodoListAppState();
}



class _TodoListAppState extends State<TodoListApp> {
  List<TodoItem> todos = [];

  TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void addTodo() {
    String title = _textEditingController.text.trim();
    if (title.isNotEmpty) {
      setState(() {
        todos.add(TodoItem(title: title));
      });
      _textEditingController.clear();
    }
  }

  void toggleTodoStatus(int index) {
    setState(() {
      todos[index].isDone = !todos[index].isDone;
    });
  }

  void deleteTodoItem(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  Widget buildTodoItem(TodoItem todo, int index) {
    return ListTile(
      leading: Checkbox(
        value: todo.isDone,
        onChanged: (value) {
          toggleTodoStatus(index);
        },
      ),
      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          deleteTodoItem(index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return buildTodoItem(todos[index], index);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Add a todo item',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: addTodo,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TodoListApp(),
  ));
}
