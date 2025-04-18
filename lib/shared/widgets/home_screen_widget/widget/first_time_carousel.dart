import 'package:flutter/material.dart';

class FirstTimeCarousel extends StatefulWidget {
  @override
  _FirstTimeCarousel createState() =>
      _FirstTimeCarousel();
}

class _FirstTimeCarousel
    extends State<FirstTimeCarousel> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = 45.0;
    double spacing = 8.0;
    double dynamicSizedBoxWidth = iconSize + (spacing * 3);

    final List<Map<String, String>> cardData = [
      {
        "icon": "trending_down",
        "head": "Real-time Monitoring",
        "body": "Get insights to improve fitness and well-being",
      },
      {
        "icon": "monitor_heart_outlined",
        "head": "Health Insights",
        "body": "Monitor heart, stress, and activity in real time",
      },
      {
        "icon": "image_outlined",
        "head": "Health Insights",
        "body": "Monitor heart, stress, and activity in real time",
      },
    ];

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white, // EBEBEB
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    // controller: _pageController,
                    itemCount: cardData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.monitor_heart_outlined),
                                  onPressed: null,
                                  iconSize: iconSize,
                                  color: Colors.yellow,
                                ),
                                SizedBox(width: spacing),
                                Expanded(
                                  child: Text(
                                    cardData[index]["head"]!,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: dynamicSizedBoxWidth),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NotificationPage(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    cardData[index]["body"]!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Boo..!")),
      body: Center(
        child: Text(
          "You are in a redirected page via InkWell!",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: Scaffold(body: FirstTimeCarousel())));
