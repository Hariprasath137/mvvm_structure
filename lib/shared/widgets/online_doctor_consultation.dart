import 'package:flutter/material.dart';

class OnlineDoctorConsultation extends StatelessWidget {
  final String doctorName;
  final String doctorField;
  final String doctorDescription;

  const OnlineDoctorConsultation({
    super.key,
    required this.doctorName,
    required this.doctorField,
    required this.doctorDescription,
  });

  @override
  Widget build(BuildContext context) {
    final TextScaler textScaler = MediaQuery.textScalerOf(context);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(textScaler.scale(24.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Online Doctor Consultation",
              style: TextStyle(
                fontSize: textScaler.scale(24),
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Row(
              children: [
                // Left-side Text Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: textScaler.scale(8)),
                      Text(
                        "Share your heart report & get expert advice.",
                        style: TextStyle(
                          fontSize: textScaler.scale(18),
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: textScaler.scale(4)),
                      Text(
                        "Understand your heart data with expert advice.",
                        style: TextStyle(
                          fontSize: textScaler.scale(17),
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: textScaler.scale(12)),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0XFF637887),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          "Consult Now",
                          style: TextStyle(
                            fontSize: textScaler.scale(16),
                            color: const Color(0XFFFFFFFF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Right-side Doctor's Image and Name
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: Image.asset(
                        "assets/Video.png", // Change to your image path
                        height: textScaler.scale(200),
                        width: textScaler.scale(130),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: textScaler.scale(5), // Adjust as needed
                      child: Container(
                        width: textScaler.scale(
                          120,
                        ), // Fixed width for the container
                        padding: EdgeInsets.symmetric(
                          horizontal: textScaler.scale(10),
                          vertical: textScaler.scale(6),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: textScaler.scale(5),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              doctorName,
                              style: TextStyle(
                                fontSize: textScaler.scale(13),
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                              overflow:
                                  TextOverflow
                                      .ellipsis, // Handle overflow gracefully
                              maxLines: 1, // Limit to one line
                            ),
                            Text(
                              doctorField,
                              style: TextStyle(
                                fontSize: textScaler.scale(12),
                                color: Colors.black54,
                              ),
                              overflow:
                                  TextOverflow
                                      .ellipsis, // Handle overflow gracefully
                              maxLines: 1, // Limit to one line
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
