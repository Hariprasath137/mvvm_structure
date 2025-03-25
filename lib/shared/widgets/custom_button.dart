import 'package:flutter/material.dart';

class CloseSliderItemWidget extends StatelessWidget {
  const CloseSliderItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 288,
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(),
      ),
    );
  }
}
