import 'package:flutter/material.dart';

class BPMValue extends StatefulWidget {
  final String bpm;
  const BPMValue({super.key, required this.bpm});

  @override
  State<BPMValue> createState() => _BPMValueState();
}

class _BPMValueState extends State<BPMValue> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 91,
      width: 90,
      child: Card(
        color: Color(0XFF767A7B),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // SizedBox(height: 10),
              Text(
                widget.bpm,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                ),
              ),
              // SizedBox(height: 10),
              Text(
                "bpm",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: "Poppins",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
