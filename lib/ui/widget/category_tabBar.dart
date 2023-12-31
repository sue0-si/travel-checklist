import 'package:flutter/material.dart';

class CategoryTabBar extends StatelessWidget {
  const CategoryTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const TabBar(tabs: [
            Tab(
              text: 'Immigration',
            ),
            Tab(
              text: 'Electronics',
            ),
            Tab(
              text: 'Clothes',
            ),
            Tab(
              text: 'Makeups',
            ),
          ]),
          Expanded(
            child: TabBarView(
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      const Text('button1'),
                      const SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: GridView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) => ElevatedButton(
                            onPressed: () {},
                            child: const Text('buttonon'),
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: 2.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Center(child: Text('Tab2')),
                const Center(child: Text('Tab3')),
                const Center(child: Text('Tab4')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
