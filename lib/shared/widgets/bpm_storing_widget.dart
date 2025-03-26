import 'package:flutter/material.dart';

class BPMStoring extends StatefulWidget {
  final String hrState;
  final String bpm;

  const BPMStoring({super.key, required this.hrState, required this.bpm});

  @override
  State<BPMStoring> createState() => _BPMStoringState();
}

class _BPMStoringState extends State<BPMStoring> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0XFF9BA9B3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/heartIcon.png'),
            const SizedBox(height: 12),
            Text(
              widget.hrState,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: "Poppins",
                color: Color(0XFF7E8A8C),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "${widget.bpm} bpm",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
