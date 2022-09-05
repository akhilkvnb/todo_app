import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/adapter.dart';
import 'package:todo_app/functions.dart';
import 'package:todo_app/list.dart';

class TodoView extends StatelessWidget {
  TodoView({Key? key}) : super(key: key);
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descricontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('TodoApp'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: 'title'),
              controller: titlecontroller,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'description'),
              controller: descricontroller,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  addButton();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ScreenList()));
                },
                child: const Text('Submit'))
          ],
        ));
  }

  addButton() async {
    final _todo =
        Todo(title: titlecontroller.text, description: descricontroller.text);
    FunctionsTodo.addTodo(_todo);
  }
}
