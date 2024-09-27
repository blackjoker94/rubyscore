part of 'matches_date_cubit.dart';

@immutable
sealed class MatchesDateState {}

final class MatchesDateInitial extends MatchesDateState {}

class MatchesDateUpdated extends MatchesDateState {
  final String currentDay;
  final String monthName;
  final List<String> previousDaysNumList;
  final List<String> previousDaysNamesList;
  final List<String> comingDaysNumList;
  final List<String> comingDaysNamesList;

  MatchesDateUpdated({
    required this.currentDay,
    required this.monthName,
    required this.previousDaysNumList,
    required this.previousDaysNamesList,
    required this.comingDaysNumList,
    required this.comingDaysNamesList,
  });
}
class IsToday extends MatchesDateState {
  final bool isTodaystate;
  
  IsToday(this.isTodaystate);
}
