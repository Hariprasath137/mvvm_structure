import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/features/heart_rate/view/heart_rate_screen.dart';
import 'package:mvvm_structure_reference/features/home_screen/view/home_screen.dart';

class AppRoutes {
  static const String home = '/home_screen';
  static const String heartrate = '/heart_rate_screen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:

        return MaterialPageRoute(builder: (context) => HomeScreen());

      case heartrate:
        return MaterialPageRoute(builder: (context) => HeartRateScreen());

      default:
        return MaterialPageRoute(
          builder:
              (context) =>
                  const Scaffold(body: Center(child: Text("Page not found"))),
        );
    }
  }
}
