import 'package:flutter/material.dart';

import 'todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ToDo(),
      child: MaterialApp(
        title: 'ToDo App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo App'),
      ),
      body: Consumer<ToDo>(
        builder: (context, todo, _) {
          return ListView.builder(
            itemCount: todo.todos.length,
            itemBuilder: (context, index) {
              final todoItem = todo.todos[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ToDoDetailPage(todo: todoItem),
                    ),
                  );
                },
                child: Card(
                  child: ListTile(
                    title: Text(
                      todoItem.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String title = '';
              String description = '';

              return AlertDialog(
                title: const Text('Add ToDo'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: const InputDecoration(hintText: 'Title'),
                      onChanged: (value) {
                        title = value;
                      },
                    ),
                    TextField(
                      decoration: const InputDecoration(hintText: 'Description'),
                      onChanged: (value) {
                        description = value;
                      },
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<ToDo>(context, listen: false).addToDo(title,
                          description);
                      Navigator.pop(context);
                    },
                    child: const Text('Add'),
                  ),]
               ) 
             } 
          )
        }
       ), );
  }
}