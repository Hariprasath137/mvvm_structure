import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvvm_structure_reference/features/stress/view/about_stress_screen.dart';
import 'package:mvvm_structure_reference/features/stress/view/exhaustion_stage_screen.dart';
import 'package:mvvm_structure_reference/features/stress/view/resistance_stage_screen.dart';
import 'package:mvvm_structure_reference/features/stress/view/wakeup_phase_screen.dart';
import 'package:mvvm_structure_reference/features/stress/widgets/stress_score_widget.dart'
    show StressScoreWidget;
import 'package:mvvm_structure_reference/shared/widgets/close_slider_item_widget.dart'
    // ignore: library_prefixes
    as swipableCard;
import 'package:mvvm_structure_reference/shared/widgets/glucose_monitoring2.dart';
import 'package:provider/provider.dart';

import '../../../shared/widgets/date_column.dart';
import '../../../shared/widgets/date_drop_down_widget.dart';
import '../../../shared/widgets/graph/heart_rate_graph.dart';
import '../../../shared/widgets/online_doctor_consultation.dart';
import '../../../shared/widgets/talk_to_tvamev.dart';
import '../../heart_rate/viewmodel/heart_rate_viewmodel.dart';

class StressScreen extends StatelessWidget {
  const StressScreen({super.key});

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
          final heartRateData = viewModel.heartRateData!;

          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
              ),
              title: const Text(
                "Stress",
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
                  DatePickerWidget(),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: StressScoreWidget(),
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(color: Color(0xffebebeb)),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(0.0),
                          child: DateNavigationWidget(),
                        ),
                        SizedBox(
                          height: 350,
                          child: HeartRateGraph(model: heartRateData),
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                      color: Color(0xffa9aaaa),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.auto_graph_rounded),
                        SizedBox(width: 10),
                        Text(
                          'Great job! Your mental health is\nimproving since yesterday.',
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: GlucoseMonitoringContainer2(titles: ['Hello1']),
                  ),
                  SizedBox(height: 40),
                  Container(
                    decoration: BoxDecoration(color: Color(0xfff6f8f9)),
                    padding: EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Past Records',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'View all',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Icon(Icons.arrow_forward),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: OnlineDoctorConsultation(
                      doctorName: 'Dr. Kawsar Ahamed',
                      doctorDescription:
                          'Understand your stress data with expert advice.',
                      doctorField:
                          'Share your stress report & get expert advice.',
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: TalkToTvamev(),
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => WakeupPhaseScreen(),
                          ),
                        );
                      },

                      child: Text('Wake-up phase'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xffa9aaaa),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ResistanceStageScreen(),
                          ),
                        );
                      },

                      child: Text('Resistance stage'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xffa9aaaa),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ExhaustionStageScreen(),
                          ),
                        );
                      },

                      child: Text('Exhaustion stage'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xffa9aaaa),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AboutStressScreen(),
                          ),
                        );
                      },

                      child: Text('About Stress Screen'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xffa9aaaa),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
