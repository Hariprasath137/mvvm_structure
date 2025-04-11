import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/config/app_constraints.dart';
import 'package:mvvm_structure_reference/shared/widgets/greetings_card.dart';
import 'package:mvvm_structure_reference/shared/widgets/date_column.dart';
import 'package:mvvm_structure_reference/shared/widgets/medication_card.dart';
import 'package:mvvm_structure_reference/shared/widgets/Wellness_Carousel.dart';
import 'package:mvvm_structure_reference/shared/widgets/glucose_monitoring1.dart';
import 'package:mvvm_structure_reference/shared/widgets/glucose_monitoring2.dart';
import 'package:mvvm_structure_reference/shared/widgets/activity_card.dart';
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_card.dart';
import 'package:mvvm_structure_reference/shared/widgets/ecg_card.dart';
import 'package:mvvm_structure_reference/shared/widgets/stress_card.dart';
import 'package:mvvm_structure_reference/shared/widgets/bp_hrv_card.dart';
import 'package:mvvm_structure_reference/shared/widgets/sleep_card.dart';
import 'package:mvvm_structure_reference/shared/widgets/tempeature_spo2_card.dart';
import 'package:mvvm_structure_reference/shared/widgets/fall_&_AFib.dart';
import 'package:mvvm_structure_reference/shared/widgets/hydration_card.dart';
import 'package:mvvm_structure_reference/shared/widgets/daily_goals_widget.dart';
import 'package:mvvm_structure_reference/shared/widgets/achievements_widget.dart';
import 'package:mvvm_structure_reference/shared/widgets/talk_to_tvamev.dart';
import 'package:mvvm_structure_reference/shared/widgets/online_doctor_consultation.dart';
import 'package:mvvm_structure_reference/shared/widgets/swipable_card_widget.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
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
              // Navigator.pop(context);
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
              child: Container(
                // color: Colors.blue.withOpacity(0.2),
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

                    // Date Picker - Widget
                    DatePickerWidget(),
                    SizedBox(height: spacing),

                    // Wellness Carousel - Widget
                    WellnessCarousel(),
                    SizedBox(height: spacing),

                    // Glucose Monitoring Card - 2 Widget's
                    GlucoseMonitoringContainer1(),
                    SizedBox(height: spacing),
                    GlucoseMonitoringContainer2(), // PADDING FIX TO BE DONE FROM HERE
                    SizedBox(height: spacing),

                    // Today's Activity - Title and Widget
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
                          onTap: () {},
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
                    SizedBox(height: spacing),
                    CarouselWidget(
                      activities: ["Walking", "Running", "Swimming"],
                      steps: [2500, 3, 500],
                      units: ["steps", "km", "m"],
                      goals: [5000, 5, 1000],
                    ),

                    // Health Metrics - Section and Widgets
                    SizedBox(height: spacing),
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Health Metrics',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),

                          // Heart Rate Card - Widget
                          SizedBox(height: spacing),
                          HeartRateCard(
                            normalHeartRate: 88,
                            restingHeartRate: 79,
                            peakHeartRate: 135,
                            normalRangeText: 'Normal',
                          ),

                          // ECG Card - Widget
                          SizedBox(height: spacing),
                          ECGCard(
                            lastTracked: 'Sat 18 Oct, 7:35 pm',
                            heartRate: 80,
                            pulseTransitTime: 31,
                          ),

                          SizedBox(height: spacing),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Stress Card - Widget
                              Flexible(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: StressCard(
                                    levelValue: 'High',
                                    peakValue: '3/5',
                                    tipText: 'Take a deep breath!',
                                  ),
                                ),
                              ),
                              SizedBox(width: spacing),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Blood Pressure - Widget
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: BpHrvCard(
                                      label: 'Blood Pressure',
                                      currentBPValue: '120/73',
                                      mmHg: 'mmHg',
                                      normalRange: '60 - 100',
                                    ),
                                  ),

                                  // HRV Card - Widget
                                  SizedBox(height: spacing),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: BpHrvCard(
                                      label: 'HRV',
                                      currentBPValue: '85',
                                      mmHg: 'ms',
                                      normalRange: '80 - 100',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // Sleep Card - Widget
                          SizedBox(height: spacing),
                          SleepCard(
                            sleepQuality: 84,
                            sleepStages: [
                              {'stage': 'Deep', 'time': '4h 20m'},
                              {'stage': 'Light', 'time': '2h 20m'},
                              {'stage': 'Awake', 'time': '1h 20m'},
                              {'stage': 'REM', 'time': '30m'},
                            ],
                          ),
                          SizedBox(height: spacing),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Temperature - Widget
                              Expanded(
                                child: TempeatureSpo2Card(
                                  label: "Temperature",
                                  value: 32,
                                  metric: "°F",
                                  range: "32–34",
                                ),
                              ),

                              // Blood Oxygen - Widget
                              SizedBox(width: spacing),
                              Expanded(
                                child: TempeatureSpo2Card(
                                  label: "Blood Oxygen",
                                  value: 97,
                                  metric: "%",
                                  range: "97–99",
                                ),
                              ),
                            ],
                          ),

                          // Fall Detection - Widget
                          SizedBox(height: spacing),
                          FallandAFib(
                            titleText: "Fall Detection",
                            statusText:
                            "No Falls Detected",
                            contactName: "Suraj Nath",
                            contactPhoneNumber:
                            "0987654321",
                          ),

                          // AFib Monitoring - Widget
                          SizedBox(height: spacing),
                          FallandAFib(
                            titleText: "AFib Monitoring",
                            statusText: "Normal Rhythm",
                            // contactName: ,
                            // contactPhoneNumber: ,
                          ),

                          // VO2 & Respiratory Rate Card - Widget
                          SizedBox(height: spacing),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                            children: [
                              Expanded(
                                child: TempeatureSpo2Card(
                                  label: "VO2",
                                  value: 0,
                                  metric: "ml/kg",
                                  range: "35-40",
                                ),
                              ),
                              SizedBox(
                                width: spacing,
                              ),
                              Expanded(
                                child: TempeatureSpo2Card(
                                  label: "Respiratory Rate",
                                  value: 18,
                                  metric: "bpm",
                                  range: "12-20",
                                ),
                              ),
                            ],
                          ),

                          // Hydration Card - Widget
                          SizedBox(height: spacing),
                          HydrationCard(
                            dailyGoal: "2L",
                            hydrationStatus: "65%",
                            consumed: "1300ml",
                            remaining: "700ml",
                          ),
                        ],
                      ),
                    ),

                    // Medication Card - Section - Widget
                    SizedBox(height: spacing),
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Medication',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(height: spacing),
                          MedicationCard(
                            time: '09:00 AM',
                            medicationName: 'Amoxicillin',
                            dosage: '500mg',
                            pillCount: '1 Pill',
                            isPassed: true,
                          ),
                        ],
                      ),
                    ),

                    // Daily Goals Section
                    SizedBox(height: spacing),
                    Row(
                      children: [
                        Text(
                          'Daily Goals',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Text(
                                'Edit Goals',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 6),
                              Icon(
                                Icons.border_color_rounded,
                                color: Colors.black,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: spacing),
                    GoalProgressCard(
                      progressList: [
                        ProgressData(
                          icon: Icons.directions_walk,
                          title: 'Steps',
                          progress: 2000 / 5000,
                          progressText: '2000/5000',
                          progressColor: Colors.red,
                        ),
                        ProgressData(
                          icon: Icons.fitness_center,
                          title: 'Workout Progress',
                          progress: 2500 / 5000,
                          progressText: '2500/5000',
                          progressColor: Colors.brown,
                        ),
                        ProgressData(
                          icon: Icons.water_rounded,
                          title: 'Swimming Progress',
                          progress: 800 / 1000,
                          progressText: '800/1000',
                          progressColor: Colors.blue,
                        ),
                      ],
                    ),

                    // Achievements Card - Widget
                    SizedBox(height: spacing),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent Achievements',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: screenHeight * 0.025,
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                'View All ',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal,
                                  fontSize: screenHeight * 0.02,
                                  color: Colors.black,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                size: screenHeight * 0.02,
                                color: const Color(0xff4b5563),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Achievements_Widget(
                      activities: ["5K Steps", "Perfect Sleep", "Heart Health"],
                      days: ["Today", "Yesterday", "Normal"],
                    ),

                    // Quick Tips - Widget
                    SizedBox(height: spacing),
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Quick Tips',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(height: spacing),
                        ],
                      ),
                    ),
                    SwipeableCardWidget(),

                    // Doctor Card - Widget
                    SizedBox(height: spacing),
                    OnlineDoctorConsultation(
                      doctorName: "Dr.Kawsar Ahamed",
                      doctorField: "Cardiologist",
                      doctorDescription:
                      "Understand your heart data with expert advice",
                    ),

                    // Talk to Tvamev card - Widget
                    SizedBox(height: spacing),
                    TalkToTvamev(),
                    SizedBox(height: spacing),
                  ],
                ),
              ),
            ),
          );
        },
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
