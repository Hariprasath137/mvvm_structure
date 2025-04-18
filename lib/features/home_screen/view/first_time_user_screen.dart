import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/shared/widgets/home_screen_widget/widget/profile_setup_card.dart';
import 'package:mvvm_structure_reference/shared/widgets/home_screen_widget/widget/first_time_carousel.dart';
import 'package:mvvm_structure_reference/shared/widgets/home_screen_widget/widget/health_info_card.dart';
import 'package:mvvm_structure_reference/shared/widgets/home_screen_widget/widget/health_info_tracker.dart';
import 'package:mvvm_structure_reference/shared/widgets/home_screen_widget/widget/greetings_card.dart';
import 'package:mvvm_structure_reference/features/home_screen/data/home_screen_model.dart';
import 'package:mvvm_structure_reference/features/home_screen/viewmodel/home_screen_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FirstTimeUser());
  }
}

class FirstTimeUser extends StatefulWidget {
  @override
  _FirstTimeUserState createState() => _FirstTimeUserState();
}

class _FirstTimeUserState extends State<FirstTimeUser> {
  late Future<List<HealthInfo>> _healthInfoFuture;

  @override
  void initState() {
    super.initState();
    _healthInfoFuture = loadHealthInfo();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
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
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Icon(Icons.circle_outlined, color: Colors.black),
              onPressed: () {},
            ),
          ),
          SizedBox(width: 5),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
      ),

      // Body
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = MediaQuery.of(context).size.width;
          double screenHeight = MediaQuery.of(context).size.height;
          double padding = screenWidth * 0.05;
          double spacing = screenHeight * 0.02;

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: Column(
                children: [
                  // Greetings Card - Widget
                  GreetingInfoWidget(
                    greetingMessage: 'Good Morning, Hareesh',
                    batteryPercentage: '80%',
                    date: 'Monday, Feb 12',
                    connectionStatus: 'Connected',
                  ),

                  SizedBox(height: spacing),
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Set up your personalized dashboard in just a few steps',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(height: spacing),
                        ProfileSetup(),
                      ],
                    ),
                  ),

                  SizedBox(height: spacing),
                  FirstTimeCarousel(),

                  SizedBox(height: spacing),
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Learn about Health Tracking',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(height: spacing),
                        FutureBuilder<List<HealthInfo>>(
                          future: _healthInfoFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(child: Text('Error loading health info.'));
                            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                              return Center(child: Text('No health info available.'));
                            }

                            return HealthTrackingInfoCard(data: snapshot.data!);
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: spacing),
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Why track you Health?',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(height: spacing),
                        TrackHealth(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
