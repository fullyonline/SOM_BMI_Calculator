import 'package:bmi_calculator/utils/BMICategories.dart';

class BmiDto {
  int _height;
  int _weight;
  late double _bmi;
  late BMICategories _bmiCategory;

  BmiDto(this._height, this._weight){
    _bmi = _weight / ((_height / 100) * (_height / 100));
    _bmiCategory = BMICategories.getBmiCategorie(_bmi);
  }

  String get bmiForForm => _bmi.toStringAsFixed(2);
}