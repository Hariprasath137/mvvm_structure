import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row( // Row to wrap both columns together
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Column 1 (Block 1 and Block 3)
              Expanded(
                flex: 1,  // This controls the width for the first column
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container( //block 1
                      height: 100, // Fixed size for Block 1
                      color: Colors.blue,
                      child: Center(child: Icon(Icons.trending_down, size: 50, color: Colors.white)),
                    ),
                    Container( //block 3
                      // height: 0,
                      color: Colors.black12, // Empty space or can be set to some value
                    ),
                  ],
                ),
              ),
              // Column 2 (Block 2 and Block 4)
              Expanded(
                flex: 8,  // This controls the width for the second column
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container( // block 2
                      height: 100, // Fixed size for Block 2
                      color: Colors.red,
                      child: Align(
                        alignment: Alignment.centerLeft, // Align text to the left
                        child: Padding(
                          padding: EdgeInsets.only(left: 16.0), // Optional padding for margin
                          child: Text(
                            'Resting HR',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Container( //block 4
                      height: 100, // Block 4 height should shrink with Block 1
                      color: Colors.yellow,
                      child: Align(
                        alignment: Alignment.centerLeft, // Align text to the left
                        child: Padding(
                          padding: EdgeInsets.only(left: 16.0), // Optional padding for margin
                          child: Text(
                            '79 bpm',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}