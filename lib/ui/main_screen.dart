import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_checklist/ui/main.dart';
import 'package:travel_checklist/ui/widget/category_tabBar.dart';

import 'create_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          color: Colors.white,
          child: Lottie.network(
              'https://lottie.host/bc908c23-9d96-497c-a09c-f4bbff8882e2/a9cmXRGXc4.json'),
        ),
        title: const Text(
          'Travel Checklist',
          style: TextStyle(color: Colors.white, fontFamily: 'Noto Sans'),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          const Expanded(
            flex: 1,
            child: DefaultTabController(
              length: 4,
              child: CategoryTabBar(),
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView(
                children: todos.values
                    .map((todo) => ListTile(
                          title: Text(todo.title),
                          subtitle: Text(todo.category),
                        ))
                    .toList()),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateScreen()),
          );
          setState(() {});
        },
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
