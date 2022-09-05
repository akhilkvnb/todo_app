import 'package:flutter/material.dart';
import 'package:todo_app/adapter.dart';
import 'package:todo_app/edit.dart';
import 'package:todo_app/functions.dart';

class ScreenList extends StatelessWidget {
  const ScreenList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: FunctionsTodo.f_todo,
        builder: (BuildContext cxtt, List<Todo> TList, Widget? child) {
          return ListView.builder(
              itemCount: TList.length,
              itemBuilder: ((cxt, index) {
                final data = TList[index];
                return ListTile(
                  title: Text(data.title!),
                  subtitle: Text(data.description!),
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          FunctionsTodo.deleteitem(index);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (cxt) => Edit(
                                      index: index,
                                    )));
                          },
                          icon: const Icon(Icons.edit))
                    ],
                  ),
                );
              }));
        },
      ),
    );
  }
}
