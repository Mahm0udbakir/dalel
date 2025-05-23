import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/utils/strings.dart';

class HistoricalCharactersModel extends DataModel {

  HistoricalCharactersModel({
    required super.name,
    required super.image,
    required super.description,
    required super.wars,
  });

  factory HistoricalCharactersModel.fromJson(jsonData,warsList) {
    return HistoricalCharactersModel(
      name: jsonData[MyFireBaseStrings.name],
      image: jsonData[MyFireBaseStrings.image],
      description: jsonData[MyFireBaseStrings.description],
      wars: warsList,
    );
  }
}
