import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/adapter.dart';

class FunctionsTodo {
  static ValueNotifier<List<Todo>> f_todo = ValueNotifier([]);
  static Future<void> addTodo(Todo value) async {
    final Dbtodo = await Hive.openBox<Todo>('todos');
    await Dbtodo.add(value);

    // f_todo.value.add(value);
    getAllTodo();
    //f_todo.notifyListeners();
    print(Dbtodo.values.first.title);
  }

  static Future<void> getAllTodo() async {
    final Dbtodo = await Hive.openBox<Todo>('todos');
    f_todo.value.clear();
    f_todo.value.addAll(Dbtodo.values);
    f_todo.notifyListeners();
  }

  static Future<void> deleteitem(int index) async {
    final Dbtodo = await Hive.openBox<Todo>('todos');
    Dbtodo.deleteAt(index);
    getAllTodo();
  }

  static Future<void> updateitem(int index, Todo value) async {
    final Dbtodo = await Hive.openBox<Todo>('todos');
    Dbtodo.putAt(index, value);
    getAllTodo();
  }
}
