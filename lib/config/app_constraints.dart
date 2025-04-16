import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/features/heart_rate/view/heart_rate_screen.dart';
import 'package:mvvm_structure_reference/features/heart_rate/view/peak_hr_screen.dart';
import 'package:mvvm_structure_reference/features/heart_rate/view/resting_hr_screen.dart';
import 'package:mvvm_structure_reference/features/home_screen/view/home_screen.dart';
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_trends.dart';
import 'package:mvvm_structure_reference/features/home_screen/view/ring_detected_screen.dart';
import 'package:mvvm_structure_reference/features/home_screen/view/log_activity_screen.dart';
import 'package:mvvm_structure_reference/features/home_screen/view/first_time_user_screen.dart';

class AppRoutes {
  static const String home = '/home_screen';
  static const String heartrate = '/heart_rate_screen';
  static const String resting = '/resting_hr';
  static const String peak = '/peak_hr';
  static const String hrtrends = '/heart_trends';
  static const String firstTimeUser = '/firstTimeUser';
  static const String logActivity = '/logActivity';
  static const String ringDetected = '/ringDetected';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case heartrate:
        return MaterialPageRoute(builder: (context) => HeartRateScreen());

      case resting:
        return MaterialPageRoute(builder: (context) => RestingHr());

      case peak:
        return MaterialPageRoute(builder: (context) => PeakHr());

      case hrtrends:
        return MaterialPageRoute(builder: (context) => HeartRateTrends());

      case firstTimeUser:
        return MaterialPageRoute(builder: (context) => FirstTimeUser());

      case logActivity:
        return MaterialPageRoute(builder: (context) => LogActivity());

      case ringDetected:
        return MaterialPageRoute(
          builder: (context) => RingDetectedScreen(),
        );

      default:
        return MaterialPageRoute(
          builder:
              (context) =>
                  const Scaffold(body: Center(child: Text("Page not found"))),
        );
    }
  }
}
//
// routes: {
// '/ringDetected': (context) => RingDetectedScreen(),
// '/firstTimeUser': (context) => FirstTimeUserScreen(),
// '/logActivity': (context) => LogActivityScreen(),
// },