part of 'matches_date_cubit.dart';

@immutable
sealed class MatchesDateState {}

final class MatchesDateInitial extends MatchesDateState {}

class CurrentMonthName extends MatchesDateState {
  final String monthName;
  
  CurrentMonthName(this.monthName);
}

class PreviousDaysNum extends MatchesDateState {
  final List<String> previousDaysNumList;
  
  PreviousDaysNum(this.previousDaysNumList);
}

class PreviousDaysNames extends MatchesDateState {
  final List<String> previousDaysNamesList;
  
  PreviousDaysNames(this.previousDaysNamesList);
}

class CurrentDay extends MatchesDateState {
  final String currentDay;
  
  CurrentDay(this.currentDay);
}

class CommingDaysNum extends MatchesDateState {
  final List<String> currentDaysNumList;
  
  CommingDaysNum(this.currentDaysNumList);
}

class CommingDaysNames extends MatchesDateState {
  final List<String> currentDaysNamesList;
  
  CommingDaysNames(this.currentDaysNamesList);
}

class IsToday extends MatchesDateState {
  final bool isTodaystate;
  
  IsToday(this.isTodaystate);
}
