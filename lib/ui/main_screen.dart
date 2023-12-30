import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_checklist/ui/widget/category_tabBar.dart';

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
          Expanded(
            flex: 1,
            child: DefaultTabController(
              length: 4,
              child: CategoryTabBar(),
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView(
              children: [
                Text('Hi'),
                Text('Hello'),
              ],
            ),
          ),
        ],
      ),

      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: const Icon(Icons.add),
      ),
    );
  }
}

