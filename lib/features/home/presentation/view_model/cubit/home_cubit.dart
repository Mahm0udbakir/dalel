import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/features/home/data/model/historical_periods_model.dart';
import 'package:dalel/features/home/presentation/view_model/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  List<HistoricalPeriodsModel> historicalPeriods = [];

  getHistoricalPeriods() async {
    emit(HistoricalPeriodLoadingState());
    try {
      await FirebaseFirestore.instance
          .collection(MyFireBaseStrings.historicalPeriods)
          .get()
          .then(
        (value) {
          for (var doc in value.docs) {
            historicalPeriods
                .add(HistoricalPeriodsModel.fromJson(doc.data()));
          }
        },
      );
      emit(HistoricalPeriodSuccessState(historicalPeriods: historicalPeriods));
    } catch (e) {
      emit(HistoricalPeriodErrorState(errorMessage: e.toString()));
    }
  }
}
