import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/controllers/models/views/screen/HomePage/todomodels.dart';
import 'package:todo/controllers/models/views/screen/HomePage/Provider/todoprovider.dart';

import 'SplashScreen/AddtoScreen/AddTodoScreen.dart';
import 'SplashScreen/EditTodo/EditProfileUpdate.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        title: Text('Todo List',style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
            icon: Icon(Icons.add,color: Colors.white,),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AddTodoScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: todoProvider.todos.length,
        itemBuilder: (context, index) {
          final todo = todoProvider.todos[index];
          return ListTile(
            title: Text(todo.title),
            subtitle: Text(todo.description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: todo.isCompleted,
                  onChanged: (value) {
                    final updatedTodo = Todo(
                      id: todo.id,
                      title: todo.title,
                      description: todo.description,
                      isCompleted: value ?? false,
                    );
                    todoProvider.updateTodo(updatedTodo);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditTodoScreen(todo: todo),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    todoProvider.deleteTodo(todo.id);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
