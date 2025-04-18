import 'package:flutter/material.dart';
import 'package:mvvm_structure_reference/features/blood_pressure/data/model/blood_pressure_model.dart';
import 'package:mvvm_structure_reference/features/heart_rate/data/model/heart_rate_model.dart';
import 'package:mvvm_structure_reference/features/blood_pressure/data/repository/blood_pressure_repository.dart';

class BloodPressureViewModel extends ChangeNotifier {
  final BloodPressureRepository _repository;

  BloodPressureViewModel(this._repository);

  BloodPressureModel? _bp;
  String? error;
  VO2Model? _vo2Model;
  List<BpChartData>? _bpChart;
  BloodPressureCardModel? _cardBp;
  BpTableModel? _bpTable;
  MinimumBp? _minbp;
  PeakBp? _peakBp;
  List<BpTrendsModel>? _bptrends;
  bool _isLoading = true;

  BloodPressureModel? get bp => _bp;
  VO2Model? get vo2Model => _vo2Model;
  List<BpChartData>? get bpChart => _bpChart;
  BloodPressureCardModel? get cardBp => _cardBp;
  BpTableModel? get bpTable => _bpTable;
  MinimumBp? get minbp => _minbp;
  PeakBp? get peakBp => _peakBp;
  List<BpTrendsModel>? get bptrends => _bptrends;
  bool get isLoading => _isLoading;

  Future<void> loadData() async {
    _isLoading = true;
    notifyListeners();

    _bp = await _repository.loadSummaryData();
    _vo2Model = await _repository.loadVo2Data();
    _cardBp = await _repository.loadJsonData();
    _bpChart = (await BloodPressureRepository.loadChartData());
    _bpTable = await BloodPressureRepository.loadBpTable();
    _minbp = await BloodPressureRepository.loadMinimum();
    _peakBp = await BloodPressureRepository.loadPeak();
    _bptrends = await BloodPressureRepository.loadBpEntries();

    _isLoading = false;
    notifyListeners();
  }
}
