import 'package:dalel/features/home/data/model/wars_model.dart';

class DataModel {
  final String name;
  final String image;
  final String description;
  final List<WarsModel>? wars;

  DataModel(
      {required this.name,
      required this.image,
      required this.description,
      this.wars});
}
