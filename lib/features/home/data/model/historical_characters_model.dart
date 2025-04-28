import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/features/home/data/model/wars_model.dart';

class HistoricalCharactersModel extends DataModel {
  List<WarsModel>? wars;

  HistoricalCharactersModel({
    required super.name,
    required super.image,
    required super.description,
    required this.wars,
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
