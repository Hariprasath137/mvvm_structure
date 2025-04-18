import 'package:mvvm_structure_reference/features/heart_rate/viewmodel/heart_rate_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:mvvm_structure_reference/features/blood_pressure/viewmodel/blood_pressure_viewmodel.dart';
import 'package:mvvm_structure_reference/features/blood_pressure/data/repository/blood_pressure_repository.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider(
    create:
        (_) => BloodPressureViewModel(BloodPressureRepository())..loadData(),
  ),
  ChangeNotifierProvider(create: (_) => HeartRateViewModel()..loadData()),
];
