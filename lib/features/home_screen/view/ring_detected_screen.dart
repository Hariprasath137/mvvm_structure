import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/features/home_screen/data/home_screen_model.dart';
import 'package:mvvm_structure_reference/features/home_screen/viewmodel/home_screen_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RingDetectedScreen(),
    );
  }
}

class RingDetectedScreen extends StatefulWidget {
  @override
  _RingDetectedScreenState createState() => _RingDetectedScreenState();
}

class _RingDetectedScreenState extends State<RingDetectedScreen> {
  late Future<RingDetectionData> _ringDataFuture;

  @override
  void initState() {
    super.initState();
    _ringDataFuture = loadRingDetectionData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Ring Detected",
            style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<RingDetectionData>(
        future: _ringDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || !snapshot.hasData) {
            return Center(child: Text('Error loading data'));
          }

          final data = snapshot.data!;
          final iconsAndText = data.iconsAndText.map((item) {
            return IconTextPair(icon: _mapStringToIconData(item.icon), text: item.text);
          }).toList();

          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: RingDetected(
                  time: data.time,
                  activity: data.activity,
                  iconsAndText: iconsAndText,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  IconData _mapStringToIconData(String iconName) {
    switch (iconName) {
      case 'insert_emoticon':
        return Icons.insert_emoticon;
      case 'directions_walk':
        return Icons.directions_walk;
      case 'access_time':
        return Icons.access_time;
      default:
        return Icons.help_outline;
    }
  }
}



class RingDetected extends StatelessWidget {
  final String time;
  final String activity;
  final List<IconTextPair> iconsAndText;

  RingDetected({
    required this.time,
    required this.activity,
    required this.iconsAndText,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;

    double containerWidth = screenWidth * 0.9;

    // Define base sizes
    double fontSize = 20.0 * textScaleFactor;
    double iconSize = 20.0 * textScaleFactor;
    double smallSpacing = 8.0 * textScaleFactor;

    return Container(
      width: containerWidth,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),  // Set background color of the widget to white
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Padding(
        padding: EdgeInsets.all(smallSpacing * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  size: iconSize,
                  color: Colors.black,
                ),
                SizedBox(width: smallSpacing),
                Text(
                  time,
                  textScaleFactor: textScaleFactor,
                  style: TextStyle(fontSize: fontSize, color: Colors.black, fontWeight: FontWeight.w200),
                ),
              ],
            ),
            SizedBox(height: smallSpacing),

            Text(
              "Did we get this right?",
              textScaleFactor: textScaleFactor,
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: smallSpacing),
            Text(
              "We detected activity and think you are $activity. Is that correct?",
              textScaleFactor: textScaleFactor,
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w400, color: Colors.black),
            ),
            SizedBox(height: smallSpacing),

            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
              child: Padding(
                padding: EdgeInsets.all(smallSpacing),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: iconsAndText.map((pair) {
                      return Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(pair.icon, size: iconSize, color: Colors.black),
                              SizedBox(height: smallSpacing),
                              Text(pair.text, style: TextStyle(fontSize: fontSize - 2, color: Colors.black)),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(height: smallSpacing),

            // Yes button
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3A4750),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  'Yes, I was $activity',
                  style: TextStyle(fontSize: fontSize, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: smallSpacing),

            // No button
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFFFFF),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  'No, select a different activity',
                  style: TextStyle(fontSize: fontSize, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconTextPair {
  final IconData icon;
  final String text;

  IconTextPair({required this.icon, required this.text});
}
