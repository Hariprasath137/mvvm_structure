import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvvm_structure_reference/features/blood_pressure/data/repository/blood_pressure_repository.dart';
import 'package:mvvm_structure_reference/features/blood_pressure/viewmodel/blood_pressure_viewmodel.dart';
import 'package:mvvm_structure_reference/shared/widgets/card/bp_measure_card.dart';
import 'package:mvvm_structure_reference/shared/widgets/card/datecard.dart';
import 'package:mvvm_structure_reference/shared/widgets/card/peak_card.dart';
import 'package:mvvm_structure_reference/shared/widgets/card/resting_card.dart';
import 'package:mvvm_structure_reference/shared/widgets/close_slider_item_widget.dart'
    // ignore: library_prefixes
    as swipableCard;
import 'package:mvvm_structure_reference/shared/widgets/daily_summary_widget.dart.dart';
import 'package:mvvm_structure_reference/shared/widgets/factors_heart_rate.dart';
import 'package:mvvm_structure_reference/shared/widgets/graph/bp_chart.dart';
import 'package:mvvm_structure_reference/shared/widgets/graph/v02_max_analysis.dart';
import 'package:mvvm_structure_reference/shared/widgets/graph/vo2_chart_widget.dart';
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_trends.dart';
import 'package:mvvm_structure_reference/shared/widgets/online_doctor_consultation.dart';
import 'package:mvvm_structure_reference/shared/widgets/swipable_card_widget.dart';
import 'package:mvvm_structure_reference/shared/widgets/talk_to_tvamev.dart';
import 'package:provider/provider.dart';

class BloodPressureScreen extends StatelessWidget {
  const BloodPressureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:
          (_) => BloodPressureViewModel(BloodPressureRepository())..loadData(),
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(),
          title: const Text("Blood Pressure"),
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
        body: Consumer<BloodPressureViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return Center(
                child: SpinKitDualRing(
                  size: 80, 
                  color: Colors.blue, // Customize the color of the ring
                  lineWidth: 8, // Customize the thickness of the ring
                ),
              );
            }

            final bp = viewModel.bp!;
            final vo2 = viewModel.vo2Model!;
            final card = viewModel.cardBp!;
            final chart = viewModel.bpChart!;

            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
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
                            bp.insights
                                .map(
                                  (i) => swipableCard.InsightCard(
                                    imagePath: i.imagePath,
                                    text: i.text,
                                  ),
                                )
                                .toList(),
                      ),
                    ],
                  ),
                ),
                BloodPressureCard(bloodPressureData: card),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: DateSelector(),
                ),
                SizedBox(height: 8),
                BpChart(chartData: chart),

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
                            RestingCard(bpm: bp.restingBpmBp.toString()),
                            const SizedBox(width: 10),
                            PeakCard(bpm: bp.peakBpm.toString()),
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
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
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
                Vo2MaxChartSection(vo2Model: vo2),
                Vo2MaxAnalysis(),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: FactorsHeartRate(),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: OnlineDoctorConsultation(
                    doctorName: bp.doctor.name,
                    doctorField: bp.doctor.field,
                    doctorDescription: bp.doctor.description,
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: TalkToTvamev(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
