import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvm_structure_reference/features/heart_rate/viewmodel/heart_rate_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:mvvm_structure_reference/config/app_constraints.dart';
import 'package:mvvm_structure_reference/shared/widgets/card/peak_card.dart';
import 'package:mvvm_structure_reference/shared/widgets/card/resting_card.dart';
import 'package:mvvm_structure_reference/shared/widgets/close_slider_item_widget.dart'
    // ignore: library_prefixes
    as swipableCard;
import 'package:mvvm_structure_reference/shared/widgets/daily_summary_widget.dart.dart';
import 'package:mvvm_structure_reference/shared/widgets/date_drop_down_widget.dart';
import 'package:mvvm_structure_reference/shared/widgets/ecg_animation_widget.dart';
import 'package:mvvm_structure_reference/shared/widgets/factors_heart_rate.dart';
import 'package:mvvm_structure_reference/shared/widgets/graph/heart_rate_graph.dart';
import 'package:mvvm_structure_reference/shared/widgets/graph/vo2_chart_widget.dart';
import 'package:mvvm_structure_reference/shared/widgets/graph/v02_max_analysis.dart';
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_trends.dart';
import 'package:mvvm_structure_reference/shared/widgets/online_doctor_consultation.dart';
import 'package:mvvm_structure_reference/shared/widgets/swipable_card_widget.dart';
import 'package:mvvm_structure_reference/shared/widgets/talk_to_tvamev.dart';

class HeartRateScreen extends StatelessWidget {
  const HeartRateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HeartRateViewModel()..loadData(),
      child: Consumer<HeartRateViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (viewModel.error != null) {
            return Scaffold(
              body: Center(child: Text('Error: ${viewModel.error}')),
            );
          }

          final summary = viewModel.summary!;
          final vo2Model = viewModel.vo2Model!;
          final heartRateData = viewModel.heartRateData!;

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
              ),
              title: const Text(
                "Heart Rate",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/share_icon.svg'),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/download_icon.svg'),
                ),
              ],
            ),
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Insights for you",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(height: 20),
                        swipableCard.HorizontalCardWidget(
                          cards:
                              summary.insights.map((i) {
                                return swipableCard.InsightCard(
                                  imagePath: i.imagePath,
                                  text: i.text,
                                );
                              }).toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(height: 550, child: ECGMonitor()),
                  const SizedBox(height: 30),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: DateNavigationWidget(),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 350,
                    child: HeartRateGraph(model: heartRateData),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Daily Summary",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              RestingCard(bpm: summary.restingBpm.toString()),
                              const SizedBox(width: 10),
                              PeakCard(bpm: summary.peakBpm.toString()),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        DailySummaryWidget(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  HeartRateTrends(),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 24),
                          child: Text(
                            "Quick Tips",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        SizedBox(height: 0),
                        SwipeableCardWidget(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Vo2MaxChartSection(vo2Model: vo2Model),
                  Vo2MaxAnalysis(),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: FactorsHeartRate(),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: OnlineDoctorConsultation(
                      doctorName: summary.doctor.name,
                      doctorField: summary.doctor.field,
                      doctorDescription: summary.doctor.description,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: TalkToTvamev(),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.bp);
              },
              tooltip: 'Go to BP Screen',
              backgroundColor: Colors.blueGrey,
              child: const Icon(Icons.bloodtype),
            ),
          );
        },
      ),
    );
  }
}
