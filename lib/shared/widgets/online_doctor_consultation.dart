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
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Online Doctor Consultation",
              style: TextStyle(
                fontSize: 24,
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
                      const SizedBox(height: 8),
                      Text(
                        "Share your heart report & get expert advice.",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,

                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Understand your heart data with expert advice.",
                        style: TextStyle(fontSize: 17, color: Colors.black54),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0XFF637887),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          "Consult Now",
                          style: TextStyle(color: Color(0XFFFFFFFF)),
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
                        height: 200,
                        width: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 5, // Adjust as needed
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              doctorName,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              doctorField,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
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
