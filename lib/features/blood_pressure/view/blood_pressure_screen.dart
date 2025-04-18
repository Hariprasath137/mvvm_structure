import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvvm_structure_reference/config/app_constraints.dart';
import 'package:mvvm_structure_reference/features/blood_pressure/viewmodel/blood_pressure_viewmodel.dart';
import 'package:mvvm_structure_reference/shared/widgets/blood_pressure_widget/widget/bp_measure_card.dart';
import 'package:mvvm_structure_reference/shared/widgets/blood_pressure_widget/widget/bp_trends_history.dart';
import 'package:mvvm_structure_reference/shared/widgets/blood_pressure_widget/widget/datecard.dart';
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_widget/widget/peak_card.dart';
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_widget/widget/resting_card.dart';
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_widget/widget/close_slider_item_widget.dart'
    // ignore: library_prefixes
    as swipableCard;
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_widget/widget/daily_summary_widget.dart.dart';
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_widget/widget/factors_heart_rate.dart';
import 'package:mvvm_structure_reference/shared/widgets/blood_pressure_widget/graph/bp_chart.dart';
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_widget/widget/v02_max_analysis.dart';
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_widget/graph/vo2_chart_widget.dart';
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_widget/widget/online_doctor_consultation.dart';
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_widget/widget/swipable_card_widget.dart';
import 'package:mvvm_structure_reference/shared/widgets/heart_rate_widget/widget/talk_to_tvamev.dart';
import 'package:provider/provider.dart';

class BloodPressureScreen extends StatelessWidget {
  const BloodPressureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                child: SpinKitThreeBounce(size: 50, color: Colors.blueGrey),
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
                BloodPressureTrends(),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          backgroundColor: Colors.grey,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,
          spacing: 10,
          spaceBetweenChildren: 8,
          children: [
            SpeedDialChild(
              child: Icon(Icons.blur_on_sharp),
              label: 'Maximum BP Screen',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.maximumBp);
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.blur_off_outlined),
              label: 'Peak BP Screen',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.peakBp);
              },
            ),
          ],
        ),
      
    );
  }
}
