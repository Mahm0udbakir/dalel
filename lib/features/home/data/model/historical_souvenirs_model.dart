import 'package:dalel/core/models/data_model.dart';
import 'package:dalel/core/utils/strings.dart';

class HistoricalSouvenirsModel extends DataModel {
  HistoricalSouvenirsModel({
    required super.name,
    required super.image,
    required super.description,
  });

  factory HistoricalSouvenirsModel.fromJson(Map<String, dynamic> jsonData) {
    try {
      return HistoricalSouvenirsModel(
        name: jsonData[MyFireBaseStrings.name] ?? 'Unknown',
        image: jsonData[MyFireBaseStrings.image] ?? '',
        description: jsonData[MyFireBaseStrings.description] ?? '',
      );
    } catch (e) {
      throw Exception('Error parsing HistoricalSouvenirsModel: $e');
    }
  }
}
