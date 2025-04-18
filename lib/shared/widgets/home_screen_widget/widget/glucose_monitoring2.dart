import 'package:flutter/material.dart';

class GlucoseMonitoringContainer2 extends StatefulWidget {
  final List<String> titles;

  GlucoseMonitoringContainer2({required this.titles});

  @override
  _GlucoseMonitoringContainer2State createState() =>
      _GlucoseMonitoringContainer2State();
}

class _GlucoseMonitoringContainer2State
    extends State<GlucoseMonitoringContainer2> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = 45.0;
    double spacing = 8.0;
    double dynamicSizedBoxWidth = iconSize + (spacing * 3);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
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
                    itemCount: widget.titles.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                    widget.titles[index],
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
          SizedBox(height: 8),
          Container(
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
                    children: List.generate(widget.titles.length, (index) {
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
