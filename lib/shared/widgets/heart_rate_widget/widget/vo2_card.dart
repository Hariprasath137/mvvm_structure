import 'package:flutter/material.dart';

class Vo2Card extends StatefulWidget {
  final String stateType;
  final String value;

  const Vo2Card({super.key, required this.stateType, required this.value});

  @override
  State<Vo2Card> createState() => _Vo2CardState();
}

class _Vo2CardState extends State<Vo2Card> {
  @override
  Widget build(BuildContext context) {
    
    final TextScaler textScaler = MediaQuery.textScalerOf(context);

    return Card(
      color: const Color(0XFFE5E5E5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, 
          children: [
            Text(
              widget.stateType,
              style: TextStyle(
                color: const Color(0XFF7E8A8C),
                fontSize: textScaler.scale(
                  16,
                ), 
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              widget.value,
              style: TextStyle(
                fontSize: textScaler.scale(
                  18,
                ), 
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "ml/kg/min",
              style: TextStyle(
                color: const Color(0XFFA9AAAA),
                fontSize: textScaler.scale(
                  16,
                ),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
