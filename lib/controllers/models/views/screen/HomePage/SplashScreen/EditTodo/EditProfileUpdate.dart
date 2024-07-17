import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/controllers/models/views/screen/HomePage/todomodels.dart';
import 'package:todo/controllers/models/views/screen/HomePage/Provider/todoprovider.dart';

class EditTodoScreen extends StatelessWidget {
  final Todo todo;

  EditTodoScreen({required this.todo});

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _titleController.text = todo.title;
    _descriptionController.text = todo.description;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: Colors.amber,
        title: Text('Edit TODO',style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                  labelText: 'Title',border: OutlineInputBorder()),
            ),
            SizedBox(height: 15,),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.description),
                  labelText: 'Description',border: OutlineInputBorder()),
            ),
            Row(
              children: [
                Text('Completion '),
                Checkbox(
                  value: todo.isCompleted,
                  onChanged: (value) {
                    todo.isCompleted = value ?? false;
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedTodo = Todo(
                  id: todo.id,
                  title: _titleController.text,
                  description: _descriptionController.text,
                  isCompleted: todo.isCompleted,
                );
                Provider.of<TodoProvider>(context, listen: false)
                    .updateTodo(updatedTodo);
                Navigator.of(context).pop();
              },
              child: Text('Update TODO',style: TextStyle(color: Colors.white,fontSize: 18),),style: ElevatedButton.styleFrom( minimumSize: Size(300, 60),backgroundColor: Colors.amber),
            ),
          ],
        ),
      ),
    );
  }
}
