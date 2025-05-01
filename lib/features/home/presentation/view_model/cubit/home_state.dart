import 'package:dalel/core/global_states/global_states.dart';
import 'package:dalel/core/utils/strings.dart';
import 'package:dalel/features/home/data/model/historical_characters_model.dart';
import 'package:dalel/features/home/data/model/historical_periods_model.dart';
import 'package:dalel/features/home/data/model/historical_souvenirs_model.dart';

abstract class HomeStates extends GlobalState {}

class HomeInitial extends HomeStates {}

class HomeLoadingState extends HomeStates implements GlobalLoadingState {
  @override
  final String? loadingMessage;
  HomeLoadingState({this.loadingMessage});
}

class HomeSuccessState extends HomeStates implements GlobalSuccessState {
  final List<HistoricalPeriodsModel>? historicalPeriods;
  final List<HistoricalCharactersModel>? historicalCharacters;
  final List<HistoricalSouvenirsModel>? historicalSouvenirs;
  @override
  final String? successMessage;

  HomeSuccessState({
 this.historicalPeriods,
 this.historicalCharacters,
 this.historicalSouvenirs,
    this.successMessage,
  });


  @override
  dynamic get data => {
        MyFireBaseStrings.historicalPeriods: historicalPeriods,
        MyFireBaseStrings.historicalCharacters: historicalCharacters,
        MyFireBaseStrings.historicalSouvenirs: historicalSouvenirs,
      };

  @override
  String? get message => successMessage;
}

class HomeErrorState extends HomeStates implements GlobalErrorState {
  @override
  final String? errorMessage;
  HomeErrorState({this.errorMessage});

  @override
  String? get message => errorMessage;
}

//! Historical Periods States
class HistoricalPeriodSuccessState extends HomeStates
    implements GlobalSuccessState {
  @override
  final String? successMessage;
  final List<HistoricalPeriodsModel> historicalPeriods;
  HistoricalPeriodSuccessState(
      {this.successMessage, required this.historicalPeriods});
  @override
  dynamic get data => historicalPeriods;
  @override
  String? get message => successMessage;
}

class HistoricalPeriodLoadingState extends HomeStates
    implements GlobalLoadingState {
  @override
  final String? loadingMessage;
  HistoricalPeriodLoadingState({this.loadingMessage});
}

class HistoricalPeriodErrorState extends HomeStates
    implements GlobalErrorState {
  @override
  final String? errorMessage;
  HistoricalPeriodErrorState({this.errorMessage});
  @override
  String? get message => errorMessage;
}

//! Historical Characters States
class HistoricalCharactersSuccessState extends HomeStates
    implements GlobalSuccessState {
  @override
  final String? successMessage;
  final List<HistoricalCharactersModel> historicalCharacters;
  HistoricalCharactersSuccessState(
      {this.successMessage, required this.historicalCharacters});
  @override
  dynamic get data => historicalCharacters;
  @override
  String? get message => successMessage;
}

class HistoricalCharactersLoadingState extends HomeStates
    implements GlobalLoadingState {
  @override
  final String? loadingMessage;
  HistoricalCharactersLoadingState({this.loadingMessage});
}

class HistoricalCharactersErrorState extends HomeStates
    implements GlobalErrorState {
  @override
  final String? errorMessage;
  HistoricalCharactersErrorState({this.errorMessage});
  @override
  String? get message => errorMessage;
}
