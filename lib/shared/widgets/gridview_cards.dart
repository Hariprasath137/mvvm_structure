import 'package:flutter/material.dart';

class ThreeByTwoGrid extends StatelessWidget {
  final List<GridItem> items;

  const ThreeByTwoGrid({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        if (index == items.length - 1) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("See more tapped!"),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    'See more',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    items[index].icon,
                    color: Colors.black,
                    size: 30,
                  ),
                  SizedBox(height: 8),
                  Text(
                    items[index].text,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

// Model class
class GridItem {
  final IconData icon;
  final String text;

  GridItem({required this.icon, required this.text});
}
