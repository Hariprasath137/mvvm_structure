import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
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
import 'package:mvvm_structure_reference/features/home_screen/data/home_screen_model.dart';
import 'package:mvvm_structure_reference/features/home_screen/viewmodel/home_screen_viewmodel.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Future<Greeting> _greetingFuture;
  late Future<List<String>> _wellnessTipsFuture;
  late Future<List<String>> _glucoseTipsFuture;
  late Future<List<ActivityItem>> _activityListFuture;
  late Future<HeartRateData> _heartRateFuture;
  late Future<ECGData> _ecgFuture;
  late Future<StressData> _stressFuture;
  late Future<BpHrvData> _bpDataFuture;
  late Future<BpHrvData> _hrvDataFuture;
  late Future<SleepData> _sleepFuture;
  late Future<List<SimpleMetric>> _simpleMetricsFuture;
  late Future<FallDetectionData> _fallDetectionFuture;
  late Future<AfibData> _afibFuture;
  late Future<HydrationData> _hydrationFuture;
  late Future<MedicationData> _medicationFuture;
  late Future<List<ProgressDataModel>> _goalsFuture;
  late Future<List<AchievementModel>> _achievementsFuture;
  late Future<DoctorData> _doctorDataFuture;

  @override
  void initState() {
    super.initState();
    _greetingFuture = loadGreeting();
    _wellnessTipsFuture = loadWellnessTips();
    _glucoseTipsFuture = loadGlucoseTips();
    _activityListFuture = loadActivityCarousel();
    _heartRateFuture = loadHeartRateData();
    _ecgFuture = loadECGData();
    _stressFuture = loadStressData();
    _bpDataFuture = loadBPData();
    _hrvDataFuture = loadHRVData();
    _sleepFuture = loadSleepData();
    _simpleMetricsFuture = loadSimpleMetrics();
    _fallDetectionFuture = loadFallDetectionData();
    _afibFuture = loadAfibData();
    _hydrationFuture = loadHydrationData();
    _medicationFuture = loadMedicationData();
    _goalsFuture = loadDailyGoals();
    _achievementsFuture = loadAchievements();
    _doctorDataFuture = loadDoctorData();
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
                    FutureBuilder<Greeting>(
                      future: _greetingFuture,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return SizedBox();
                        final greeting = snapshot.data!;
                        return GreetingInfoWidget(
                          greetingMessage: greeting.greetingMessage,
                          batteryPercentage: greeting.batteryPercentage,
                          date: greeting.date,
                          connectionStatus: greeting.connectionStatus,
                        );
                      },
                    ),
                    // GreetingInfoWidget(
                    //   greetingMessage: 'Good Morning, Hareesh',
                    //   batteryPercentage: '80%',
                    //   date: 'Monday, Feb 12',
                    //   connectionStatus: 'Connected',
                    // ),
                    SizedBox(height: spacing),

                    // Date Picker - Widget
                    DatePickerWidget(),
                    SizedBox(height: spacing),

                    // Wellness Carousel - Widget
                    FutureBuilder<List<String>>(
                      future: _wellnessTipsFuture,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return SizedBox();
                        return WellnessCarousel(titles: snapshot.data!);
                      },
                    ),
                    // WellnessCarousel(
                    //   titles: [
                    //     'Your step count is 20% higher than last week! Keep going.',
                    //     'You slept 2 hours more last night, great progress!',
                    //     'Your hydration is on track today, keep it up!',
                    //   ],
                    // ),
                    SizedBox(height: spacing),

                    // Glucose Monitoring Card - 2 Widget's
                    GlucoseMonitoringContainer1(),
                    SizedBox(height: spacing),
                    FutureBuilder<List<String>>(
                      future: _glucoseTipsFuture,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return SizedBox();
                        return GlucoseMonitoringContainer2(titles: snapshot.data!);
                      },
                    ),
                    // GlucoseMonitoringContainer2(
                    //   titles: [
                    //     "Your glucose level is high, know more with tvamev.",
                    //     "Your sleep cycle seems irregular, try some tips for better rest!",
                    //     "Feeling too stressed? Try some relaxing methods from tvamev!",
                    //   ],
                    // ), // PADDING FIX TO BE DONE FROM HERE
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
                    FutureBuilder<List<ActivityItem>>(
                      future: _activityListFuture,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return SizedBox();
                        final items = snapshot.data!;
                        return CarouselWidget(
                          activities: items.map((e) => e.activity).toList(),
                          steps: items.map((e) => e.steps).toList(),
                          units: items.map((e) => e.unit).toList(),
                          goals: items.map((e) => e.goal).toList(),
                        );
                      },
                    ),
                    // CarouselWidget(
                    //   activities: ["Walking", "Running", "Swimming"],
                    //   steps: [2500, 3, 500],
                    //   units: ["steps", "km", "m"],
                    //   goals: [5000, 5, 1000],
                    // ),

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
                          FutureBuilder<HeartRateData>(
                            future: _heartRateFuture,
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) return SizedBox();
                              final data = snapshot.data!;
                              return HeartRateCard(
                                normalHeartRate: data.normal,
                                restingHeartRate: data.resting,
                                peakHeartRate: data.peak,
                                normalRangeText: data.status,
                              );
                            },
                          ),

                          // HeartRateCard(
                          //   normalHeartRate: 88,
                          //   restingHeartRate: 79,
                          //   peakHeartRate: 135,
                          //   normalRangeText: 'Normal',
                          // ),

                          // ECG Card - Widget

                          SizedBox(height: spacing),
                          FutureBuilder<ECGData>(
                            future: _ecgFuture,
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) return SizedBox();
                              final ecg = snapshot.data!;
                              return ECGCard(
                                lastTracked: ecg.lastTracked,
                                heartRate: ecg.heartRate,
                                pulseTransitTime: ecg.pulseTransitTime,
                              );
                            },
                          ),
                          // ECGCard(
                          //   lastTracked: 'Sat 18 Oct, 7:35 pm',
                          //   heartRate: 80,
                          //   pulseTransitTime: 31,
                          // ),

                          SizedBox(height: spacing),
                          FutureBuilder<StressData>(
                            future: _stressFuture,
                            builder: (context, stressSnapshot) {
                              if (!stressSnapshot.hasData) return SizedBox();
                              final stress = stressSnapshot.data!;

                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Stress Card
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: StressCard(
                                        levelValue: stress.level,
                                        peakValue: stress.peak,
                                        tipText: stress.tip,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: spacing),

                                  // BP & HRV Column
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Blood Pressure
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                        child: FutureBuilder<BpHrvData>(
                                          future: _bpDataFuture,
                                          builder: (context, bpSnapshot) {
                                            if (!bpSnapshot.hasData) return SizedBox();
                                            final bp = bpSnapshot.data!;
                                            return BpHrvCard(
                                              label: bp.label,
                                              currentBPValue: bp.value,
                                              mmHg: bp.unit,
                                              normalRange: bp.range,
                                            );
                                          },
                                        ),
                                      ),

                                      SizedBox(height: spacing),

                                      // HRV
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                        child: FutureBuilder<BpHrvData>(
                                          future: _hrvDataFuture,
                                          builder: (context, hrvSnapshot) {
                                            if (!hrvSnapshot.hasData) return SizedBox();
                                            final hrv = hrvSnapshot.data!;
                                            return BpHrvCard(
                                              label: hrv.label,
                                              currentBPValue: hrv.value,
                                              mmHg: hrv.unit,
                                              normalRange: hrv.range,
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     // Stress Card - Widget
                          //     Flexible(
                          //       flex: 1,
                          //       child: Container(
                          //         decoration: BoxDecoration(
                          //           color: Colors.blue,
                          //           borderRadius: BorderRadius.circular(16),
                          //         ),
                          //         child: StressCard(
                          //           levelValue: 'High',
                          //           peakValue: '3/5',
                          //           tipText: 'Take a deep breath!',
                          //         ),
                          //       ),
                          //     ),
                          //     SizedBox(width: spacing),
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         // Blood Pressure - Widget
                          //         Container(
                          //           decoration: BoxDecoration(
                          //             color: Colors.green,
                          //             borderRadius: BorderRadius.circular(16),
                          //           ),
                          //           child: BpHrvCard(
                          //             label: 'Blood Pressure',
                          //             currentBPValue: '120/73',
                          //             mmHg: 'mmHg',
                          //             normalRange: '60 - 100',
                          //           ),
                          //         ),
                          //
                          //         // HRV Card - Widget
                          //         SizedBox(height: spacing),
                          //         Container(
                          //           decoration: BoxDecoration(
                          //             color: Colors.orange,
                          //             borderRadius: BorderRadius.circular(16),
                          //           ),
                          //           child: BpHrvCard(
                          //             label: 'HRV',
                          //             currentBPValue: '85',
                          //             mmHg: 'ms',
                          //             normalRange: '80 - 100',
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ],
                          // ),

                          // Sleep Card - Widget

                          SizedBox(height: spacing),
                          // SleepCard(
                          //   sleepQuality: 84,
                          //   sleepStages: [
                          //     {'stage': 'Deep', 'time': '4h 20m'},
                          //     {'stage': 'Light', 'time': '2h 20m'},
                          //     {'stage': 'Awake', 'time': '1h 20m'},
                          //     {'stage': 'REM', 'time': '30m'},
                          //   ],
                          // ),
                          // SizedBox(height: spacing),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     // Temperature - Widget
                          //     Expanded(
                          //       child: TempeatureSpo2Card(
                          //         label: "Temperature",
                          //         value: 32,
                          //         metric: "°F",
                          //         range: "32–34",
                          //       ),
                          //     ),
                          //
                          //     // Blood Oxygen - Widget
                          //     SizedBox(width: spacing),
                          //     Expanded(
                          //       child: TempeatureSpo2Card(
                          //         label: "Blood Oxygen",
                          //         value: 97,
                          //         metric: "%",
                          //         range: "97–99",
                          //       ),
                          //     ),
                          //   ],
                          // ),

                          // Fall Detection - Widget
                          // Sleep Card
                          // SizedBox(height: spacing),
                          FutureBuilder<SleepData>(
                            future: _sleepFuture,
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) return SizedBox();
                              final sleep = snapshot.data!;
                              return SleepCard(
                                sleepQuality: sleep.quality,
                                sleepStages: sleep.stages,
                              );
                            },
                          ),

// Temperature & Blood Oxygen
                          SizedBox(height: spacing),
                          FutureBuilder<List<SimpleMetric>>(
                            future: _simpleMetricsFuture,
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) return SizedBox();
                              final metrics = snapshot.data!;

                              // Assuming first = temp, second = SpO2
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: TempeatureSpo2Card(
                                      label: metrics[0].label,
                                      value: metrics[0].value,
                                      metric: metrics[0].metric,
                                      range: metrics[0].range,
                                    ),
                                  ),
                                  SizedBox(width: spacing),
                                  Expanded(
                                    child: TempeatureSpo2Card(
                                      label: metrics[1].label,
                                      value: metrics[1].value,
                                      metric: metrics[1].metric,
                                      range: metrics[1].range,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),


                          SizedBox(height: spacing),
                          // FallandAFib(
                          //   titleText: "Fall Detection",
                          //   statusText:
                          //   "No Falls Detected",
                          //   contactName: "Suraj Nath",
                          //   contactPhoneNumber:
                          //   "0987654321",
                          // ),
                          //
                          // // AFib Monitoring - Widget
                          // SizedBox(height: spacing),
                          // FallandAFib(
                          //   titleText: "AFib Monitoring",
                          //   statusText: "Normal Rhythm",
                          //   // contactName: ,
                          //   // contactPhoneNumber: ,
                          // ),
                          //
                          // // VO2 & Respiratory Rate Card - Widget
                          // SizedBox(height: spacing),
                          // Row(
                          //   mainAxisAlignment:
                          //   MainAxisAlignment
                          //       .spaceBetween,
                          //   children: [
                          //     Expanded(
                          //       child: TempeatureSpo2Card(
                          //         label: "VO2",
                          //         value: 0,
                          //         metric: "ml/kg",
                          //         range: "35-40",
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       width: spacing,
                          //     ),
                          //     Expanded(
                          //       child: TempeatureSpo2Card(
                          //         label: "Respiratory Rate",
                          //         value: 18,
                          //         metric: "bpm",
                          //         range: "12-20",
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          //
                          // // Hydration Card - Widget
                          // SizedBox(height: spacing),
                          // HydrationCard(
                          //   dailyGoal: "2L",
                          //   hydrationStatus: "65%",
                          //   consumed: "1300ml",
                          //   remaining: "700ml",
                          // ),
                          // Fall Detection - Widget
                          FutureBuilder<FallDetectionData>(
                            future: _fallDetectionFuture,
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) return SizedBox();
                              final fallData = snapshot.data!;
                              return FallandAFib(
                                titleText: fallData.title,
                                statusText: fallData.status,
                                contactName: fallData.contactName,
                                contactPhoneNumber: fallData.contactPhone,
                              );
                            },
                          ),

// AFib Monitoring - Widget
                          SizedBox(height: spacing),
                          FutureBuilder<AfibData>(
                            future: _afibFuture,
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) return SizedBox();
                              final afibData = snapshot.data!;
                              return FallandAFib(
                                titleText: afibData.title,
                                statusText: afibData.status,
                              );
                            },
                          ),

// VO2 & Respiratory Rate Card - Widget
                          SizedBox(height: spacing),
                          FutureBuilder<List<SimpleMetric>>(
                            future: _simpleMetricsFuture,
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) return SizedBox();
                              final metrics = snapshot.data!;

                              // Assuming first = VO2, second = Respiratory Rate
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: TempeatureSpo2Card(
                                      label: metrics[2].label,
                                      value: metrics[2].value,
                                      metric: metrics[2].metric,
                                      range: metrics[2].range,
                                    ),
                                  ),
                                  SizedBox(width: spacing),
                                  Expanded(
                                    child: TempeatureSpo2Card(
                                      label: metrics[3].label,
                                      value: metrics[3].value,
                                      metric: metrics[3].metric,
                                      range: metrics[3].range,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),

// Hydration Card - Widget
                          SizedBox(height: spacing),
                          FutureBuilder<HydrationData>(
                            future: _hydrationFuture,
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) return SizedBox();
                              final hydration = snapshot.data!;
                              return HydrationCard(
                                dailyGoal: hydration.dailyGoal,
                                hydrationStatus: hydration.status,
                                consumed: hydration.consumed,
                                remaining: hydration.remaining,
                              );
                            },
                          ),

                        ],
                      ),
                    ),

                    // Medication Card - Section - Widget
                    // Container(
                    //   width: double.infinity,
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text(
                    //         'Medication',
                    //         style: TextStyle(
                    //           fontFamily: 'Poppins',
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 24,
                    //         ),
                    //       ),
                    //       SizedBox(height: spacing),
                    //       MedicationCard(
                    //         time: '09:00 AM',
                    //         medicationName: 'Amoxicillin',
                    //         dosage: '500mg',
                    //         pillCount: '1 Pill',
                    //         isPassed: true,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    //
                    // // Daily Goals Section
                    // SizedBox(height: spacing),
                    // Row(
                    //   children: [
                    //     Text(
                    //       'Daily Goals',
                    //       style: TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 24,
                    //       ),
                    //     ),
                    //     Spacer(),
                    //     InkWell(
                    //       onTap: () {},
                    //       child: Row(
                    //         children: [
                    //           Text(
                    //             'Edit Goals',
                    //             style: TextStyle(
                    //               fontSize: 16,
                    //               color: Colors.black,
                    //             ),
                    //           ),
                    //           SizedBox(width: 6),
                    //           Icon(
                    //             Icons.border_color_rounded,
                    //             color: Colors.black,
                    //             size: 16,
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: spacing),
                    // GoalProgressCard(
                    //   progressList: [
                    //     ProgressData(
                    //       icon: Icons.directions_walk,
                    //       title: 'Steps',
                    //       progress: 2000 / 5000,
                    //       progressText: '2000/5000',
                    //       progressColor: Colors.red,
                    //     ),
                    //     ProgressData(
                    //       icon: Icons.fitness_center,
                    //       title: 'Workout Progress',
                    //       progress: 2500 / 5000,
                    //       progressText: '2500/5000',
                    //       progressColor: Colors.brown,
                    //     ),
                    //     ProgressData(
                    //       icon: Icons.water_rounded,
                    //       title: 'Swimming Progress',
                    //       progress: 800 / 1000,
                    //       progressText: '800/1000',
                    //       progressColor: Colors.blue,
                    //     ),
                    //   ],
                    // ),
                    //
                    // // Achievements Card - Widget
                    // SizedBox(height: spacing),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       'Recent Achievements',
                    //       style: TextStyle(
                    //         fontFamily: 'Poppins',
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: screenHeight * 0.025,
                    //         color: Colors.black,
                    //       ),
                    //     ),
                    //     TextButton(
                    //       onPressed: () {},
                    //       child: Row(
                    //         children: [
                    //           Text(
                    //             'View All ',
                    //             style: TextStyle(
                    //               fontFamily: 'Poppins',
                    //               fontWeight: FontWeight.normal,
                    //               fontSize: screenHeight * 0.02,
                    //               color: Colors.black,
                    //             ),
                    //           ),
                    //           Icon(
                    //             Icons.arrow_forward,
                    //             size: screenHeight * 0.02,
                    //             color: const Color(0xff4b5563),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Achievements_Widget(
                    //   activities: ["5K Steps", "Perfect Sleep", "Heart Health"],
                    //   days: ["Today", "Yesterday", "Normal"],
                    // ),
                    //
                    // // Quick Tips - Widget
                    // SizedBox(height: spacing),
                    // Container(
                    //   width: double.infinity,
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text(
                    //         'Quick Tips',
                    //         style: TextStyle(
                    //           fontFamily: 'Poppins',
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 24,
                    //         ),
                    //       ),
                    //       SizedBox(height: spacing),
                    //     ],
                    //   ),
                    // ),
                    // SwipeableCardWidget(),
                    //
                    // // Doctor Card - Widget
                    // SizedBox(height: spacing),
                    // OnlineDoctorConsultation(
                    //   doctorName: "Dr.Kawsar Ahamed",
                    //   doctorField: "Cardiologist",
                    //   doctorDescription:
                    //   "Understand your heart data with expert advice",
                    // ),

                    // Talk to Tvamev card - Widget
                    // Medication Card - Section - Widget
                    SizedBox(height: spacing),
                    FutureBuilder<MedicationData>(
                      future: _medicationFuture, // Future to fetch medication data
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return SizedBox();
                        final medications = snapshot.data!;
                        return Container(
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
                              // Dynamically create MedicationCard for each item in medications list
                              // for (var medication in medications)
                                MedicationCard(
                                  time: medications.time,
                                  medicationName: medications.name,
                                  dosage: medications.dosage,
                                  pillCount: medications.pillCount,
                                  isPassed: medications.isPassed,
                                ),
                            ],
                          ),
                        );
                      },
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

                    // Replace the hardcoded GoalProgressCard with this:
                    FutureBuilder<List<ProgressDataModel>>(
                      future: _goalsFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicator(); // or shimmer/loading UI
                        } else if (snapshot.hasError) {
                          return Text("Error loading daily goals");
                        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return Text("No daily goals data available");
                        }

                        final metrics = snapshot.data!;

                        return GoalProgressCard(
                          progressList: metrics.map((metric) {
                            return ProgressData(
                              title: metric.title,
                              progress: metric.progress / metric.goal,
                              progressText: '${metric.progress.toInt()}/${metric.goal.toInt()}',
                              progressColor: Colors.blue, // Optional: change based on metric.title if you want
                            );
                          }).toList(),
                        );
                      },
                    ),

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
                    FutureBuilder<List<AchievementModel>>(
                      future: _achievementsFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicator(); // or shimmer
                        } else if (snapshot.hasError) {
                          return Text("Error loading achievements");
                        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return Text("No recent achievements available");
                        }

                        final achievements = snapshot.data!;

                        return Achievements_Widget(
                          activities: achievements.map((a) => a.activity).toList(),
                          days: achievements.map((a) => a.day).toList(),
                        );
                      },
                    ),

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
                          // SizedBox(height: spacing),
                        ],
                      ),
                    ),
                    SwipeableCardWidget(),
                    SizedBox(height: spacing),

                    FutureBuilder<DoctorData?>(
                      future: _doctorDataFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError || snapshot.data == null) {
                          return SizedBox(); // or show an error widget
                        } else {
                          final data = snapshot.data!;
                          return OnlineDoctorConsultation(
                            doctorName: data.name,
                            doctorField: data.field,
                            doctorDescription: data.description,
                          );
                        }
                      },
                    ),

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
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.deepPurple,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        spacing: 10,
        spaceBetweenChildren: 8,
        children: [
          SpeedDialChild(
            child: Icon(Icons.wifi_tethering_outlined),
            label: 'Ring Detected Screen',
            onTap: () {
              print('Moved to Ring Detected Screen');
              Navigator.pushNamed(context, '/ringDetected');
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.start),
            label: 'First Time User Screen',
            onTap: () {
              print('Moved to First Time User Screen');
              Navigator.pushNamed(context, '/firstTimeUser');
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.note_alt_outlined),
            label: 'Log Activity Screen',
            onTap: () {
              print('Moved to Log Activity Screen');
              Navigator.pushNamed(context, '/logActivity');
            },
          ),
        ],
      ),

    );
  }
}
