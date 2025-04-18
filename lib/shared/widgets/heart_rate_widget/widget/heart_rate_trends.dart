import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mvvm_structure_reference/features/heart_rate/viewmodel/heart_rate_viewmodel.dart';
import 'package:provider/provider.dart'; // Make sure to import this
import 'package:mvvm_structure_reference/features/heart_rate/view/details_screen.dart';
import 'package:mvvm_structure_reference/features/heart_rate/view/heart_rate_trends_full.dart';
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_widget/widget/bpm_value_card.dart';

class HeartRateTrends extends StatelessWidget {
  const HeartRateTrends({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return ChangeNotifierProvider(
      create: (_) => HeartRateViewModel()..loadData(),
      child: Consumer<HeartRateViewModel>(
        builder: (context, viewModel, _) {
          final heartRateEntries = viewModel.heartRateEntry ?? [];

          if (viewModel.isLoading) {
            return const Center(
              child: SpinKitPumpingHeart(size: 50, color: Colors.blueGrey),
            );
          }

          if (viewModel.error != null) {
            return Center(child: Text("Error: ${viewModel.error}"));
          }

          return Container(
            color: const Color(0XFFF6F8F9),
            child: Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.05,
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
                bottom: screenHeight * 0.01,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "Heart Rate Trends",
                          style: TextStyle(
                            fontSize: screenWidth * 0.06,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins",
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => AllHeartRateTrends(
                                    heartRateEntries: heartRateEntries,
                                  ),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              "View all",
                              style: TextStyle(
                                color: const Color(0XFF193238),
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.04,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: const Color(0XFF193238),
                              size: screenWidth * 0.06,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  ...List.generate(
                    heartRateEntries.length < 2 ? heartRateEntries.length : 2,
                    (index) {
                      final entry = heartRateEntries[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(entry: entry),
                            ),
                          );
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BPMValue(bpm: entry.bpm),
                            SizedBox(width: screenWidth * 0.02),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Chip(
                                        label: Text(
                                          entry.status,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        backgroundColor: const Color(
                                          0XFFA9AAAA,
                                        ),
                                      ),
                                      SizedBox(width: screenWidth * 0.02),
                                      Flexible(
                                        child: Text(
                                          entry.activity,
                                          style: TextStyle(
                                            color: const Color(0XFF193238),
                                            fontSize: screenWidth * 0.04,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: screenWidth * 0.02,
                                    ),
                                    child: Text(
                                      entry.timestamp,
                                      style: TextStyle(
                                        color: const Color(0XFF193238),
                                        fontSize: screenWidth * 0.035,
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Colors.grey[300],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.03,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              DetailsScreen(entry: entry),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  size: screenWidth * 0.06,
                                  color: const Color(0XFF193238),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
