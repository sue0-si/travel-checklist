import 'package:flutter/material.dart';

import '../../model/todo.dart';
import '../main.dart';
import '../main_screen.dart';

class CategoryItemButton extends StatefulWidget {
  const CategoryItemButton({
    super.key,
    required this.itemList,
    required this.tabIndex,
  });

  final List<String> itemList;
  final String tabIndex;

  @override
  State<CategoryItemButton> createState() => _CategoryItemButtonState();
}

class _CategoryItemButtonState extends State<CategoryItemButton> {
  int selectedButtonIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: widget.itemList.length,
              itemBuilder: (context, index) => ElevatedButton(
                onPressed: () async {
                  await todos.add(Todo(
                    title: widget.itemList[index],
                    category: widget.tabIndex,
                    isDone: false,
                  ));
                  if (mounted) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
                  }
                },
                style: ButtonStyle(
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(
                      width: selectedButtonIndex == index ? 3.0 : 0.0,
                      color: selectedButtonIndex == index
                          ? Theme.of(context).colorScheme.primary
                          : Colors.transparent,
                    ),
                  ),
                ),
                child: Text(widget.itemList[index]),
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 2.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
