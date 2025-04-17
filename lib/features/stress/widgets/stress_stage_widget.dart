import 'package:flutter/material.dart';

class StressStageWidget extends StatelessWidget {
  const StressStageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Color(0xfff5f5f5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Stage 1 - ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text(
                'Alarm Stage ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff707070),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            'current stress score',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xff707070),
            ),
          ),
          SizedBox(height: 32),
          Container(
            padding: EdgeInsets.only(top: 22, left: 22, right: 22),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'When one feels threatened and\nactivation of the fight or flight reaction ',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff572936),
                  ),
                ),
                SizedBox(height: 30),
                Image.asset('assets/images/stress_phase_image.png'),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
