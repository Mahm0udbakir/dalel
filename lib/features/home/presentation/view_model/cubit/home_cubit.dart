import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/features/home/data/model/historical_characters_model.dart';
import 'package:dalel/features/home/data/model/historical_periods_model.dart';
import 'package:dalel/features/home/data/model/wars_model.dart';
import 'package:dalel/features/home/presentation/view_model/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  List<HistoricalPeriodsModel> historicalPeriods = [];
  List<HistoricalCharactersModel> historicalCharacters = [];
  List<WarsModel> warsList = [];

  getHistoricalPeriods() async {
    emit(HistoricalPeriodLoadingState());
    try {
      await FirebaseFirestore.instance
          .collection(MyFireBaseStrings.historicalPeriods)
          .get()
          .then(
        (value) async {
          for (var doc in value.docs) {
            await getWarsList(doc);
            historicalPeriods
                .add(HistoricalPeriodsModel.fromJson(doc.data(), warsList));
          }
        },
      );
      emit(HistoricalPeriodSuccessState(historicalPeriods: historicalPeriods));
    } catch (e) {
      emit(HistoricalPeriodErrorState(errorMessage: e.toString()));
    }
  }

  getHistoricalCharacters() async {
    emit(HistoricalCharactersLoadingState());
    try {
      await FirebaseFirestore.instance
          .collection(MyFireBaseStrings.historicalCharacters)
          .get()
          .then((onValue) {
        for (var element in onValue.docs) {
          getWarsList(element);
          historicalCharacters
              .add(HistoricalCharactersModel.fromJson(element.data()));
        }
      });
      emit(HistoricalCharactersSuccessState(
          historicalCharacters: historicalCharacters));
    } catch (e) {
      emit(HistoricalCharactersErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> getWarsList(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) async {
    await FirebaseFirestore.instance
        .collection(MyFireBaseStrings.historicalPeriods)
        .doc(doc.id)
        .collection(MyFireBaseStrings.wars)
        .get()
        .then((value) {
      for (var doc in value.docs) {
        warsList.add(WarsModel.fromJson(doc.data()));
      }
    });
  }
}
