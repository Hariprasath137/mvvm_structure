import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/features/heart_rate/data/model/heart_rate_model.dart';
import 'package:mvvm_structure_reference/features/heart_rate/data/repository/heart_rate_repository.dart';

class HeartRateViewModel extends ChangeNotifier {
  HeartRateSummary? summary;
  VO2Model? vo2Model;
  HeartRateData? heartRateData;

  bool isLoading = true;
  String? error;

  Future<void> loadData() async {
    try {
      isLoading = true;
      notifyListeners();

      summary = await HeartRateRepository.loadSummaryData();
      vo2Model = await HeartRateRepository.loadVo2Data();
      heartRateData = await HeartRateRepository.loadHeartRateData();

      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }
}
