import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/config/app_constraints.dart';

class PeakCard extends StatefulWidget {
  final String bpm;

  const PeakCard({super.key, required this.bpm});

  @override
  State<PeakCard> createState() => _PeakCardState();
}

class _PeakCardState extends State<PeakCard> {
  @override
  Widget build(BuildContext context) {
    final TextScaler textScaler = MediaQuery.textScalerOf(context);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.peak);
      },
      child: Card(
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
              Flexible(
                child: Text(
                  "Peak HR",
                  style: TextStyle(
                    fontSize: textScaler.scale(16),
                    fontFamily: "Poppins",
                    color: const Color(0XFF7E8A8C),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 6),
              Flexible(
                child: Text(
                  "${widget.bpm} bpm",
                  style: TextStyle(
                    fontSize: textScaler.scale(18),
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
