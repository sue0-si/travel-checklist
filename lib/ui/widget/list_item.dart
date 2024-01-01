import 'package:flutter/material.dart';

import '../../model/todo.dart';

class ListItem extends StatelessWidget {
  final Todo todo;
  final Function(Todo) onTap;
  final Function(Todo) onDelete;

  const ListItem({super.key, required this.todo, required this.onTap, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap(todo);
      },
      leading: todo.isDone
          ? Icon(Icons.check_box, color: Theme.of(context).colorScheme.primary)
          : const Icon(Icons.check_box_outline_blank),
      title: Text(
        todo.title,
        style: TextStyle(color: todo.isDone ? Colors.grey : Colors.black),
      ),
      subtitle: Text(
        todo.category,
        style: TextStyle(color: todo.isDone ? Colors.grey : Colors.black),
      ),
      trailing: todo.isDone ? GestureDetector(
        onTap: () {
          onDelete(todo);
        },
        child: const Icon(Icons.delete_forever),
      ) : null,
    );
  }
}
