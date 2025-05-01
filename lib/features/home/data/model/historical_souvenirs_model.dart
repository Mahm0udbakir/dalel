import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/utils/strings.dart';

class HistoricalSouvenirsModel extends DataModel {
  HistoricalSouvenirsModel({
    required super.name,
    required super.image,
    required super.description,
  });

  factory HistoricalSouvenirsModel.fromJson(jsonData) {
    return HistoricalSouvenirsModel(
      name: jsonData[MyFireBaseStrings.name],
      image: jsonData[MyFireBaseStrings.image],
      description: jsonData[MyFireBaseStrings.description],
    );
  }
}
