import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/features/blood_pressure/data/model/blood_pressure_model.dart';
import 'package:mvvm_structure_reference/features/heart_rate/data/model/heart_rate_model.dart';
import 'package:mvvm_structure_reference/features/blood_pressure/data/repository/blood_pressure_repository.dart';

class BloodPressureViewModel extends ChangeNotifier {
  final BloodPressureRepository _repository;

  BloodPressureViewModel(this._repository);

  BloodPressureModel? _bp;
  VO2Model? _vo2Model;
  List<BpChartData>? _bpChart;
  BloodPressureCardModel? _cardBp;
  bool _isLoading = true;

  BloodPressureModel? get bp => _bp;
  VO2Model? get vo2Model => _vo2Model;
  List<BpChartData>? get bpChart => _bpChart;
  BloodPressureCardModel? get cardBp => _cardBp;
  bool get isLoading => _isLoading;

  Future<void> loadData() async {
    _isLoading = true;
    notifyListeners();

    _bp = await _repository.loadSummaryData();
    _vo2Model = await _repository.loadVo2Data();
    _cardBp = await _repository.loadJsonData();
    _bpChart = (await _repository.loadChartData());

    _isLoading = false;
    notifyListeners();
  }
}
