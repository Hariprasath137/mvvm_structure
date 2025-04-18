import 'package:flutter/material.dart';

class TalkToTvamev extends StatelessWidget {
  const TalkToTvamev({super.key});

  @override
  Widget build(BuildContext context) {
    
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      color: const Color(0XFFCCCCCC),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, 
              children: [
                Image.asset(
                  "assets/tvamev.png",
                  height: screenWidth * 0.2,
                ),
                SizedBox(width: screenWidth * 0.03), 
                Expanded(
                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Talk to Tvamev",
                        style: TextStyle(
                          color: Color(0XFF000000),
                          fontSize: screenWidth * 0.06, 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: screenWidth * 0.01,
                      ),
                      Text(
                        "Get personalized workout plans",
                        style: TextStyle(
                          fontSize: screenWidth * 0.045, 
                          color: Color(0XFF595959),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: screenWidth * 0.04), 
           
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFFFFFFFF), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: screenWidth * 0.02, 
                  ),
                ),
                child: Text(
                  "Start Chat",
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    color: Color(0XFF1E1D1D),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
