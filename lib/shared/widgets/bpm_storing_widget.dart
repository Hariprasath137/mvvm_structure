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
    // Get the text scaler for dynamic font scaling
    final TextScaler textScaler = MediaQuery.textScalerOf(context);

    return Card(
      color: const Color(0XFF9BA9B3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24.0), // Keep the original padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/heartIcon.png'),
            const SizedBox(height: 12), // Keep the original spacing
            Flexible(
              child: Text(
                widget.hrState,
                style: TextStyle(
                  fontSize: textScaler.scale(
                    16,
                  ), // Dynamically scale the font size
                  fontFamily: "Poppins",
                  color: const Color(0XFF7E8A8C),
                ),
                overflow: TextOverflow.ellipsis, // Handle overflow gracefully
              ),
            ),
            const SizedBox(height: 6), // Keep the original spacing
            Flexible(
              child: Text(
                "${widget.bpm} bpm",
                style: TextStyle(
                  fontSize: textScaler.scale(
                    18,
                  ), // Dynamically scale the font size
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis, // Handle overflow gracefully
              ),
            ),
          ],
        ),
      ),
    );
  }
}
