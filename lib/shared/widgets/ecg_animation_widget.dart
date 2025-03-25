// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ECGMonitor extends StatefulWidget {
  const ECGMonitor({super.key});

  @override
  State<ECGMonitor> createState() => _ECGMonitorState();
}

class _ECGMonitorState extends State<ECGMonitor> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _heartController;
  bool isTesting = false;

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
      upperBound: 1.3,
    );
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
    _heartController.value = 1.0; // Reset heart to normal size
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0XFFCCCCCC),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min, // Center vertically
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/Group.png'),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Your average heart rate is 5 bpm better than yesterday's.",
                      style: TextStyle(
                        color: Color(0XFF333333),
                        fontSize: 16,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/dot.svg',
                        color: Color(0XFF6B6B6B),
                        width: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: const Text(
                          "Good",
                          style: TextStyle(fontFamily: "Poppins", fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 1),
            Stack(
              alignment: Alignment.center,
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return CustomPaint(
                      size: const Size(400, 100),
                      painter: ECGPainter(_controller.value),
                    );
                  },
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20), // Adjust spacing as needed
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
                            size: 260,
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
                            size: 230,
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
                                      const SizedBox(height: 4),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '75',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: fontSize,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
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
                    const SizedBox(height: 2),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isTesting = !isTesting;
                          if (isTesting) {
                            startHeartAnimation();
                          } else {
                            stopHeartAnimation();
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isTesting
                                ? Color(0XFF62727C)
                                : const Color(0XFF62727C),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 100,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        isTesting ? 'Stop Test' : 'Test Now',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
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
