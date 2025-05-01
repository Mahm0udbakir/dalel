import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/utils/strings.dart';

class HistoricalPeriodsModel extends DataModel {

  HistoricalPeriodsModel({
    required super.name,
    required super.image,
    required super.description,
    required super.wars,
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
