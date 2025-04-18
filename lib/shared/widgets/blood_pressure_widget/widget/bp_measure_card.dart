import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/features/blood_pressure/data/model/blood_pressure_model.dart';

class BloodPressureCard extends StatelessWidget {
  final BloodPressureCardModel bloodPressureData;

  const BloodPressureCard({super.key, required this.bloodPressureData});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        color: Color(0XFFD6D6D6),
        margin: EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: Text(
                'Last measured at ${bloodPressureData.lastMeasured}',
                style: TextStyle(color: Colors.grey[600], fontSize: 14.0),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        bloodPressureData.bloodPressure,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                      Text(
                        " mmHg",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0XFF595959),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.circle, size: 10.0, color: Color(0XFF6B6B6B)),
                      SizedBox(width: 4.0),
                      Text(
                        bloodPressureData.status,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 24.0,
                        color: Color(0XFF475569),
                      ),
                      SizedBox(width: 4.0),
                      Text(
                        bloodPressureData.heartRate,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF121417),
                          fontSize: 24.0,
                        ),
                      ),
                      Text(
                        ' bpm',
                        style: TextStyle(
                          color: Color(0XFF595959),
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0XFF3A4750),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 8.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    child: Text('Test Now'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),

            Container(
              decoration: BoxDecoration(
                color: Color(0XFFA9AAAA),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
              ),
              padding: EdgeInsets.all(12.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Image.asset('assets/Group.png', color: Colors.white),
                    SizedBox(width: 18.0),
                    Expanded(
                      child: Text(
                        'Great job! Your blood pressure improved by 5 points since yesterday.',
                        style: TextStyle(color: Colors.white, fontSize: 14.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
