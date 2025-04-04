import 'package:flutter/material.dart';

class GlucoseMonitoringContainer2 extends StatefulWidget {
  @override
  _GlucoseMonitoringContainerState createState() =>
      _GlucoseMonitoringContainerState();
}

class _GlucoseMonitoringContainerState
    extends State<GlucoseMonitoringContainer2> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = 45.0;
    double spacing = 8.0;
    double dynamicSizedBoxWidth = iconSize + (spacing * 3);

    final List<Map<String, String>> cardData = [
      {
        "icon": "image_outlined",
        "text": "Your glucose level is high, know more with tvamev.",
      },
      {
        "icon": "image_outlined",
        "text":
        "Hey, your sleep cycle seems irregular, Try some tips for better rest with tvamev.!",
      },
      {
        "icon": "image_outlined",
        "text": "Feeling too stressed, try some relaxing methods from tvamev!",
      },
    ];

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            // width: screenWidth * 0.9,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
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
                                  icon: Icon(Icons.image_outlined),
                                  onPressed: null,
                                  iconSize: iconSize,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: spacing),
                                Expanded(
                                  child: Text(
                                    cardData[index]["text"]!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal,
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
                                    "Talk to tvamev",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
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
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              width: screenWidth * 0.9,
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.grey,
                    ),
                    child: Stack(
                      children: List.generate(3, (index) {
                        double widthPerDot = 20;
                        double offset = _currentPage == index
                            ? index * widthPerDot.toDouble()
                            : 0.0;

                        return Positioned(
                          left: offset,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            width: widthPerDot,
                            height: 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: _currentPage == index
                                  ? Colors.blueGrey
                                  : Colors.transparent,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
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

void main() => runApp(MaterialApp(home: Scaffold(body: GlucoseMonitoringContainer2())));
