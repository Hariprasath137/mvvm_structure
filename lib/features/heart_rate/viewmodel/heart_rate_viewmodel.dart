import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/features/heart_rate/data/model/heart_rate_model.dart';
import 'package:mvvm_structure_reference/features/heart_rate/data/repository/heart_rate_repository.dart';

class HeartRateViewModel extends ChangeNotifier {
  HeartRateSummary? summary;

  VO2Model? vo2Model;
  HeartRateData? heartRateData;
  List<HeartRateEntry>? heartRateEntry;
  HeartRateEcg? _heartRateEcg;
  HeartTableModel? _heartTableModel;
  HeartTableModel? get heartTableModel => _heartTableModel;

  RestingHr? _restingHr;
  bool _isTesting = false;

  bool isLoading = false;
  String? error;
  HeartRateEcg? get heartRateEcg => _heartRateEcg;
  RestingHr? get restingHr => _restingHr;

  bool get isTesting => _isTesting;

  bool _isDisposed = false;

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  void safeNotifyListeners() {
    if (!_isDisposed) {
      notifyListeners();
    }
  }

  Future<void> fetchEcgData() async {
    _heartRateEcg = await HeartRateRepository.loadHeartRateEcg();
    notifyListeners();
  }

  void toggleTest() {
    _isTesting = !_isTesting;
    notifyListeners();

    if (_isTesting) {
      fetchEcgData();
    }
  }

  Future<void> loadData() async {
    try {
      isLoading = true;
      safeNotifyListeners();

      summary = await HeartRateRepository.loadSummaryData();
      vo2Model = await HeartRateRepository.loadVo2Data();
      heartRateData = await HeartRateRepository.loadHeartRateData();
      heartRateEntry = await HeartRateRepository.loadHeartRateEntries();
      _heartRateEcg = await HeartRateRepository.loadHeartRateEcg();
      _restingHr = await HeartRateRepository.loadRestingHeartRate();
      _heartTableModel = await HeartRateRepository.loadTableData();

      isLoading = false;
      safeNotifyListeners();
    } catch (e) {
      error = e.toString();
      isLoading = false;
      safeNotifyListeners();
    }
  }
}
