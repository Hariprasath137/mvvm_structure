import 'package:flutter/material.dart';

class FactorsHeartRate extends StatefulWidget {
  const FactorsHeartRate({super.key});

  @override
  State<FactorsHeartRate> createState() => _FactorsHeartRateState();
}

class _FactorsHeartRateState extends State<FactorsHeartRate> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Map<String, String>> factors = [
    {
      "title": "Sleep Quality",
      "description":
          "Poor sleep patterns can elevate resting heart rate over time.",
      "image": "assets/factors.png",
    },
    {
      "title": "Stress Levels",
      "description":
          "High stress can cause an increase in heart rate and blood pressure.",
      "image": "assets/factors.png",
    },
    {
      "title": "Physical Activity",
      "description":
          "Regular exercise helps maintain a healthy resting heart rate.",
      "image": "assets/factors.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    
    double screenWidth = MediaQuery.of(context).size.width;

    
    final TextScaler textScaler = MediaQuery.textScalerOf(context);

   
    final double cardHeight =
        250.0; 

    return SizedBox(
      height: cardHeight,
      child: PageView.builder(
        controller: _pageController,
        itemCount: factors.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          final factor = factors[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            child: Card(
              color: const Color(0XFFF5F5F5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
               
                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, textConstraints) {
                        
                          final double titleSize = textScaler
                              .scale(16.0)
                              .clamp(12.0, 20.0);
                          final double subtitleSize = textScaler
                              .scale(14.0)
                              .clamp(10.0, 18.0);
                          final double descriptionSize = textScaler
                              .scale(12.0)
                              .clamp(8.0, 16.0);

                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                           
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Factors Affecting Heart Rate",
                                      style: TextStyle(
                                        fontSize: titleSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      factor["title"]!,
                                      style: TextStyle(
                                        fontSize: subtitleSize,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Expanded(
                                      child: Text(
                                        factor["description"]!,
                                        style: TextStyle(
                                          fontSize: descriptionSize,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                           
                              Expanded(
                                flex: 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    factor["image"]!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "View Details",
                                style: TextStyle(
                                  fontSize: textScaler
                                      .scale(12.0)
                                      .clamp(8.0, 16.0),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Icon(
                                Icons.arrow_forward,
                                size: textScaler.scale(14.0).clamp(10.0, 18.0),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 40, 
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                AnimatedPositioned(
                                  duration: const Duration(milliseconds: 300),
                                  left:
                                      (40 - 10) *
                                      (_currentIndex / (factors.length - 1)),
                                  child: Container(
                                    width: 10, 
                                    height: 4,
                                    decoration: BoxDecoration(
                                      color: Colors.black87,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
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
              ),
            ),
          );
        },
      ),
    );
  }
}
