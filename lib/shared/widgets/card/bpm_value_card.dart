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
    
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    
    final TextScaler textScaler = MediaQuery.textScalerOf(context);

    
    final squareSize = screenWidth * 0.22; 

    return SizedBox(
      height: squareSize, 
      width: squareSize,
      child: Card(
        color: const Color(0XFF767A7B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            screenWidth * 0.05, 
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.03,
            vertical: screenWidth * 0.01,
          ), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:
                MainAxisAlignment.center, 
            children: [
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    widget.bpm,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: textScaler.scale(
                        screenWidth * 0.05,
                      ), 
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                    ),
                    overflow:
                        TextOverflow.ellipsis, 
                  ),
                ),
              ),
              SizedBox(height: screenWidth * 0.005), 
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "bpm",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: textScaler.scale(
                        screenWidth * 0.03,
                      ), 
                      fontFamily: "Poppins",
                    ),
                    overflow:
                        TextOverflow.ellipsis, 
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
