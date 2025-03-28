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
    return Card(
      color: Color(0XFF767A7B),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(widget.stateType),
            Text(widget.value),
            Text("ml/kg/min", style: TextStyle()),
          ],
        ),
      ),
    );
  }
}
