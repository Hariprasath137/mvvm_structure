import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/features/home_screen/viewmodel/home_screen_viewmodel.dart';
import 'package:mvvm_structure_reference/shared/widgets/duration_input.dart';
import 'package:mvvm_structure_reference/shared/widgets/gridview_cards.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LogActivity());
  }
}
class LogActivity extends StatefulWidget {
  @override
  _LogActivityState createState() => _LogActivityState();
}

class _LogActivityState extends State<LogActivity> {
  List<Map<String, dynamic>> intensityLevels = [
    {'label': 'Light', 'isSelected': false, 'isHighlighted': false},
    {'label': 'Moderate', 'isSelected': true, 'isHighlighted': true},
    {'label': 'Intense', 'isSelected': false, 'isHighlighted': false},
  ];

  List<GridItem> items = [
    GridItem(icon: Icons.book, text: "Reading"),
    GridItem(icon: Icons.directions_walk, text: "Walking"),
    GridItem(icon: Icons.directions_bike_rounded, text: "Cycling"),
    GridItem(icon: Icons.sports_gymnastics, text: "Gymnastics"),
    GridItem(icon: Icons.water, text: "Swimming"),
  ];

  late Future<List<dynamic>> _initData;

  @override
  void initState() {
    super.initState();
    _initData = Future.wait([loadActivityLog()]);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final padding = screenWidth * 0.05;
    final spacing = screenHeight * 0.02;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Log your activity",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: _initData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading data'));
          } else {
            final activityLog = snapshot.data?[0] as List<String>;

            if (items.length < 6) {
              items.add(GridItem(icon: Icons.more_horiz, text: "See more"));
            }

            return SingleChildScrollView(
              padding: EdgeInsets.only(
                left: padding,
                right: padding,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Detected Movement
                  Container(
                    width: screenWidth * 0.9,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: activityLog.isEmpty
                          ? Text('No activity logs available.')
                          : Column(
                        children: List.generate(activityLog.length, (index) {
                          final logText = activityLog[index];

                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: index == activityLog.length - 1 ? 0.0 : 12.0,
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.star_border_rounded, size: 16),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    logText,
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),

                    ),
                  ),
                  SizedBox(height: 24),

                  Text(
                    'Choose Activity',
                    style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(height: 12),

                  ThreeByTwoGrid(items: items),

                  Text(
                    'Or enter custom activity',
                    style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w300, fontSize: 20),
                  ),
                  SizedBox(height: 12),

                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Rock Climbing',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                    ),
                  ),
                  SizedBox(height: 12),

                  Text(
                    'Duration',
                    style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  DurationInput(),
                  SizedBox(height: 12),

                  Text(
                    'Intensity Level',
                    style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(height: 12),

                  Row(
                    children: intensityLevels.map((intensity) {
                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                for (var level in intensityLevels) {
                                  level['isSelected'] = false;
                                  level['isHighlighted'] = false;
                                }
                                intensity['isSelected'] = true;
                                intensity['isHighlighted'] = true;
                              });
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: intensity['isHighlighted'] ? Colors.grey[400] : Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: intensity['isSelected'] ? Colors.white12 : Colors.grey,
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  intensity['label'],
                                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 24),

                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF3A4750),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text('Save Activity', style: TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
