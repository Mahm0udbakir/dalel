import 'package:dalel/core/utils/strings.dart';

class HistoricalPeriodsModel {
  final String? name;
  final String? image;
  final String? description;
  final Map<String, dynamic>? wars;

  HistoricalPeriodsModel({
    this.name,
    this.image,
    this.description,
    this.wars,
  });

  factory HistoricalPeriodsModel.fromJson(jsonData) {
    return HistoricalPeriodsModel(
      name: jsonData[MyFireBaseStrings.name],
      image: jsonData[MyFireBaseStrings.image],
      description: jsonData[MyFireBaseStrings.description],
      wars: jsonData[MyFireBaseStrings.wars],
    );
  }
}
