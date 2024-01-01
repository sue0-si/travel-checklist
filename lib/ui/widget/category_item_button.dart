import 'package:flutter/material.dart';

class CategoryItemButton extends StatelessWidget {
  const CategoryItemButton({
    super.key,
    required this.itemList,
  });

  final List<String> itemList;

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
              itemCount: itemList.length,
              itemBuilder: (context, index) => ElevatedButton(
                onPressed: () {},
                child: Text(itemList[index]),
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
    );
  }
}
