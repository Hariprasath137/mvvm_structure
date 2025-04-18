import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mvvm_structure_reference/features/heart_rate/viewmodel/heart_rate_viewmodel.dart';
import 'package:provider/provider.dart';

class AvgRestingCard extends StatelessWidget {
  const AvgRestingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HeartRateViewModel()..loadData(),
      child: Consumer<HeartRateViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            
            return Center(
              child: SpinKitThreeBounce(size: 50, color: Colors.blueGrey),
            );
          }

          if (viewModel.error != null) {
           
            return Center(child: Text('Error: ${viewModel.error}'));
          }

          final data = viewModel.restingHr!;

          return FractionallySizedBox(
            widthFactor: 0.75,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: Card(
                color: const Color(0XFFEDEDED),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FittedBox(
                        child: Text(
                          data.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      FittedBox(
                        child: Text(
                          data.value,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
