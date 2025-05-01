import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/features/home/data/model/historical_characters_model.dart';
import 'package:dalel/features/home/data/model/historical_periods_model.dart';
import 'package:dalel/features/home/data/model/historical_souvenirs_model.dart';
import 'package:dalel/features/home/data/model/wars_model.dart';
import 'package:dalel/features/home/presentation/view_model/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  List<HistoricalPeriodsModel> historicalPeriods = [];
  List<HistoricalCharactersModel> historicalCharacters = [];
  List<HistoricalSouvenirsModel> historicalSouvenirs = [];
  List<WarsModel> warsList = [];

  getHistoricalPeriods() async {
    emit(HomeLoadingState());
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection(MyFireBaseStrings.historicalPeriods)
          .get();
      for (var doc in snapshot.docs) {
        getWarsList(doc,
            collectionName: MyFireBaseStrings.historicalCharacters);
        historicalPeriods
            .add(HistoricalPeriodsModel.fromJson(doc.data(), warsList));
      }
      emit(HomeSuccessState(historicalPeriods: historicalPeriods));
    } catch (e) {
      emit(HomeErrorState(errorMessage: e.toString()));
    }
  }

  getHistoricalCharacters() async {
    emit(HomeLoadingState());
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection(MyFireBaseStrings.historicalCharacters)
          .get();
      for (var doc in snapshot.docs) {
        getWarsList(doc,
            collectionName: MyFireBaseStrings.historicalCharacters);
        historicalCharacters
            .add(HistoricalCharactersModel.fromJson(doc.data(), warsList));
      }
      emit(HomeSuccessState(historicalCharacters: historicalCharacters));
    } catch (e) {
      emit(HomeErrorState(errorMessage: e.toString()));
    }
  }

  getHistoricalSouvenirs() async {
    emit(HomeLoadingState());
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection(MyFireBaseStrings.historicalSouvenirs)
          .get();

      for (var doc in snapshot.docs) {
        historicalSouvenirs.add(HistoricalSouvenirsModel.fromJson(doc.data()));
      }
      emit(HomeSuccessState(historicalSouvenirs: historicalSouvenirs));
    } catch (e) {
      emit(HomeErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> getWarsList(QueryDocumentSnapshot<Map<String, dynamic>> doc,
      {required String collectionName}) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection(collectionName)
        .doc(doc.id)
        .collection(MyFireBaseStrings.wars)
        .get();
    for (var doc in snapshot.docs) {
      warsList.add(WarsModel.fromJson(doc.data()));
    }
  }
}
