import 'package:dalel/core/utils/strings.dart';

class WarsModel {
  final String? name;
  final String? image;
  final String? description;

  WarsModel({
    this.name,
    this.image,
    this.description,
  });

  factory WarsModel.fromJson(jsonData) {
    return WarsModel(
      name: jsonData[MyFireBaseStrings.name],
      image: jsonData[MyFireBaseStrings.image],
      description: jsonData[MyFireBaseStrings.description],
    );
  }
}
