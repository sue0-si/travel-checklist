import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travel_checklist/model/todo.dart';

import 'main.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _textController = TextEditingController();
  int selectedButtonIndex = -1;
  final List<String> _categoryList = [
    'immigration',
    'electronics',
    'makeups',
    'clothes',
    'etc'
  ];

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void inputMissingPopup(BuildContext context) {
    Fluttertoast.showToast(
      msg: 'Text field is required.',
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 5,
      // 5초 동안 보여지도록 설정
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void categoryNotSelectedPopup(BuildContext context) {
    Fluttertoast.showToast(
      msg: 'Category is not selected',
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 5,
      // 5초 동안 보여지도록 설정
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New task'),
        actions: [
          IconButton(
            onPressed: () async {
              if (selectedButtonIndex == -1) {
                return categoryNotSelectedPopup(context);
              } else if (_textController.text == '') {
                return inputMissingPopup(context);
              }
              await todos.add(Todo(
                  title: _textController.text,
                  category: _categoryList[selectedButtonIndex]));
              if (mounted) {
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Choose category'),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 5,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 2.0,
                ),
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (selectedButtonIndex == index) {
                          selectedButtonIndex = -1;
                        } else {
                          selectedButtonIndex = index;
                        }
                      });
                    },
                    style: ButtonStyle(
                      // 현재 선택된 버튼이면 border를 두껍게
                      side: MaterialStateProperty.all<BorderSide>(
                        BorderSide(
                          width: selectedButtonIndex == index ? 3.0 : 0.0,
                          color: selectedButtonIndex == index
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                        ),
                      ),
                    ),
                    child: Text(_categoryList[index]),
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: TextField(
                controller: TextEditingController(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: 'Enter task',
                  filled: true,
                  fillColor: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
