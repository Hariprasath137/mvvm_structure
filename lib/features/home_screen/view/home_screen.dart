import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/config/app_constraints.dart';
import 'package:mvvm_structure_reference/shared/widgets/activity_card.dart';
import 'package:mvvm_structure_reference/shared/widgets/glucose_monitoring1.dart';
import 'package:mvvm_structure_reference/shared/widgets/glucose_monitoring2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2020, 5),
        lastDate: DateTime(2060)
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _showGratitudeNotification() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Clicked from Wellness Widget Card ;)')),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Health",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 0.0),
            child: IconButton(
              icon: Icon(
                Icons.notifications_none_outlined,
                color: Colors.black,
              ),
              onPressed: () {

              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Icon(
                Icons.circle_outlined,
                color: Colors.black,
              ),
              onPressed: () {

              },
            ),
          ),
          SizedBox(width: 5),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Good Morning, Hareesh',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '80%',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.battery_6_bar_rounded, size: 24),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Monday, Feb 12',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'Connected',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              Column(
                children: [
                  Container(
                    height: 1,
                    color: Colors.grey[300],
                    margin: EdgeInsets.symmetric(vertical: 8),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_left),
                        onPressed: () {
                        },
                      ),

                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: Row(
                          children: [
                            Icon(Icons.calendar_month_outlined, size: 24),
                            SizedBox(width: 8),
                            Text(
                              'Today, Jan 15',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_right),
                        onPressed: null,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey[300],
                    margin: EdgeInsets.symmetric(vertical: 8),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // WellnessCarousel(),
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(16),
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          width: 80,
                          margin: EdgeInsets.only(right: 8),
                          child: Center(
                            child: Text(
                              "Wellness Score",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),

                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          width: 270,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Main text
                                Text(
                                  "Your step count is 20% higher than last week! Keep going.",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 8),
                                InkWell(
                                  onTap: _showGratitudeNotification,
                                  child: Text(
                                    "Talk to tvamev",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60, // Adjust this to match the total width of all the dots
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.grey, // Background color for inactive dots
                    ),
                    child: Stack(
                      children: List.generate(3, (index) {
                        double widthPerDot = 20; // Width of each individual dot

                        // The offset that shifts the active dot to the correct position
                        double offset = _currentPage == index ? index * widthPerDot.toDouble() : 0.0;

                        return Positioned(
                          left: offset,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            width: widthPerDot,
                            height: 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: _currentPage == index ? Colors.blueGrey : Colors.transparent,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),//Carousel Indicator

              SizedBox(height: 16),
              GlucoseMonitoringContainer1(),
              SizedBox(height: 16),
              GlucoseMonitoringContainer2(),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today's Activity",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                      });
                    },
                    child: Row(
                      children: [
                        Text(
                          'View All ',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              CarouselWidget(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.swap_horiz),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        onPressed: () => Navigator.pushNamed(context, AppRoutes.heartrate),
      ),
    );

  }
}
