import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/config/app_constraints.dart';

class RestingCard extends StatefulWidget {
  final String bpm;

  const RestingCard({super.key, required this.bpm});

  @override
  State<RestingCard> createState() => _RestingCardState();
}

class _RestingCardState extends State<RestingCard> {
  @override
  Widget build(BuildContext context) {
    final TextScaler textScaler = MediaQuery.textScalerOf(context);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.resting);
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
                  "Resting HR",
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
