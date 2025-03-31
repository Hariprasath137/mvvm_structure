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
      color: Color(0XFFE5E5E5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.stateType,
              style: TextStyle(color: Color(0XFF7E8A8C), fontSize: 16),
            ),
            Text(
              widget.value,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "ml/kg/min",
              style: TextStyle(color: Color(0XFFA9AAAA), fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
