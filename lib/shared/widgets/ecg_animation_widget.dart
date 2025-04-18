// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvvm_structure_reference/features/heart_rate/data/model/heart_rate_model.dart';

class ECGMonitor extends StatefulWidget {
  const ECGMonitor({super.key});

  @override
  State<ECGMonitor> createState() => _ECGMonitorState();
}

class _ECGMonitorState extends State<ECGMonitor> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _heartController;
  bool isTesting = false;
  HeartRateEcg? heartRateEcg;
  int? heartRate;
  String? statusText;
  String? messageText;

  Future<void> loadJsonData() async {
    final String jsonString = await rootBundle.loadString(
      'assets/json/model.json',
    );
    final jsonData = jsonDecode(jsonString);
    setState(() {
      heartRate = jsonData['ecg']['heartRate'];
      statusText = jsonData['ecg']['status'];
      messageText = jsonData['ecg']['message'];
    });
  }

  Future<void> loadHeartRateData() async {
    await Future.delayed(const Duration(seconds: 2));

    final json = {
      "heartRate": 75,
      "status": "Good",
      "message": "Your average heart rate is 5 bpm better than yesterday's.",
    };

    setState(() {
      heartRateEcg = HeartRateEcg.fromJson(json);
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    _heartController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      lowerBound: 1.0,
      upperBound: 1.2,
    );
    loadJsonData().then((_) {
      if (heartRate != null && statusText != null && messageText != null) {
        setState(() {
          heartRateEcg = HeartRateEcg(
            heartRate: heartRate!,
            status: statusText!,
            message: messageText!,
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _heartController.dispose();
    super.dispose();
  }

  void startHeartAnimation() {
    _heartController.repeat(reverse: true);
  }

  void stopHeartAnimation() {
    _heartController.stop();
    _heartController.value = 1.0;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    if (heartRateEcg == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      backgroundColor: Color(0XFFCCCCCC),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/Group.png', width: screenWidth * 0.1),
                  SizedBox(width: screenWidth * 0.02),
                  Expanded(
                    child: Text(
                      heartRateEcg?.message ?? "...",
                      style: TextStyle(
                        color: Color(0XFF333333),
                        fontSize: screenWidth * 0.04,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/dot.svg',
                        color: Color(0XFF6B6B6B),
                        width: screenWidth * 0.07,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.01),
                        child: Text(
                          heartRateEcg?.status ?? '...',
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: screenWidth * 0.04,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Stack(
              alignment: Alignment.center,
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return CustomPaint(
                      size: Size(screenWidth * 0.9, screenHeight * 0.15),
                      painter: ECGPainter(_controller.value),
                    );
                  },
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.02),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Transform(
                          transform:
                              Matrix4.identity()
                                ..setEntry(3, 2, 0.001)
                                ..rotateX(0.1),
                          alignment: Alignment.bottomCenter,
                          child: Icon(
                            Icons.favorite,
                            color: Color(0XFF9BA9B3).withOpacity(0.4),
                            size: screenWidth * 0.55,
                          ),
                        ),
                        Transform(
                          transform:
                              Matrix4.identity()
                                ..setEntry(3, 2, 0.001)
                                ..rotateX(0.07),
                          alignment: Alignment.bottomCenter,
                          child: Icon(
                            Icons.favorite,
                            color: Color(0XFF7E8A8C).withOpacity(0.6),
                            size: screenWidth * 0.50,
                          ),
                        ),
                        ScaleTransition(
                          scale: _heartController,
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              double heartSize = constraints.maxWidth * 0.45;
                              double fontSize = heartSize * 0.1;
                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: const Color(0XFF62727C),
                                    size: heartSize,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Current Heart Rate',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: fontSize * 0.6,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: screenHeight * 0.005),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            // ignore: unnecessary_null_comparison
                                            HeartRateEcg != null
                                                ? '${heartRateEcg!.heartRate}'
                                                : '...',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: fontSize,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(width: screenWidth * 0.01),
                                          Text(
                                            'bpm',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: fontSize * 0.6,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isTesting = !isTesting;
                        });

                        if (isTesting) {
                          startHeartAnimation();
                          await loadJsonData();
                        } else {
                          stopHeartAnimation();
                        }
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFF62727C),
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.2,
                          vertical: screenHeight * 0.015,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            screenWidth * 0.05,
                          ),
                        ),
                      ),
                      child: Text(
                        isTesting ? 'Stop Test' : 'Test Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ECGPainter extends CustomPainter {
  final double animationValue;

  ECGPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Color(0XFF7E8A8C)
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;

    final path = Path();
    double width = size.width;
    double height = size.height / 2;
    double speed = width * animationValue;

    path.moveTo(-speed, height);
    for (double x = -speed; x <= width; x += 5) {
      double position = (x + speed) % 100;
      double y = height;
      if (position < 40) {
        y = height;
      } else if (position == 45) {
        y += 15;
      } else if (position == 50) {
        y -= 30;
      } else if (position == 55) {
        y += 20;
      } else if (position < 100) {
        y = height;
      } else if (position == 120) {
        y -= 7;
      }
      path.lineTo(x, y);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
