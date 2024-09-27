import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rubyscore/business_logic/date_methods.dart';

part 'matches_date_state.dart';

class MatchesDateCubit extends Cubit<MatchesDateState> {
  MatchesDateCubit() : super(MatchesDateInitial()) {
    dateMethods = DateMethods();
  }

  late DateMethods dateMethods;

  void fetchDates() {
    String currentDay = dateMethods.getCurrentDay();
    String monthName = dateMethods.getMonthName();
    
    List<String> previousDaysNum = dateMethods.previousDaysNum();
    List<String> previousDaysNames = dateMethods.previousDaysNames();
    
    List<String> comingDaysNum = dateMethods.comingDaysNum();
    List<String> comingDaysNames = dateMethods.comingDaysNames();
    
    emit(MatchesDateUpdated(
      currentDay: currentDay,
      monthName: monthName,
      previousDaysNumList: previousDaysNum,
      previousDaysNamesList: previousDaysNames,
      comingDaysNumList: comingDaysNum,
      comingDaysNamesList: comingDaysNames,
    ));
  }

  void isToday(String date) {
    bool isToday = dateMethods.isToday(date);
    emit(IsToday(isToday));
  }
}