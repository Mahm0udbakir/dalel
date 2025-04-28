import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/features/home/data/model/wars_model.dart';

class HistoricalPeriodsModel extends DataModel {
  final List<WarsModel> wars;

  HistoricalPeriodsModel({
    required super.name,
    required super.image,
    required super.description,
    required this.wars,
  });

  factory HistoricalPeriodsModel.fromJson(jsonData, warsList) {
    return HistoricalPeriodsModel(
      name: jsonData[MyFireBaseStrings.name],
      image: jsonData[MyFireBaseStrings.image],
      description: jsonData[MyFireBaseStrings.description],
      wars: warsList,
    );
  }
}
