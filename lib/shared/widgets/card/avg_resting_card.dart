import 'package:flutter/material.dart';

class AvgRestingCard extends StatelessWidget {
  const AvgRestingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final TextScaler textScaler = MediaQuery.textScalerOf(context);

    return FractionallySizedBox(
      widthFactor: 0.75, 
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 200, 
        ),
        child: Card(
          color: const Color(0XFFEDEDED),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min, 
              children: [
                FittedBox(
                  child: Text(
                    "Avg. Resting HR",
                    style: TextStyle(
                      fontSize: textScaler.scale(16),
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                FittedBox(
                  child: Text(
                    "70 bpm",
                    style: TextStyle(
                      fontSize: textScaler.scale(18),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
