
class DateMethods {
   String getMonthName() {
    List<String> monthNames = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    int currentMonth = DateTime.now().month;
    String currentMonthName = monthNames[currentMonth - 1];

    return currentMonthName;
  }

  String getCurrentDay() {
    return DateTime.now().day.toString();
  }

  List<String> comingDaysNum() {
    List<String> daysList = [];
    DateTime today = DateTime.now();

    for (int i = 1; i <= 5; i++) {
      String result = '';
      DateTime nextDay = today.add(Duration(days: i));
      for (int i = 8; i < 10; i++) {
        String date = nextDay.toString();
        result += date[i];
      }
      daysList.add(result);
    }
    return daysList;
  }

  List<String> previousDaysNum() {
    List<String> daysList = [];
    DateTime today = DateTime.now();

    for (int i = 1; i <= 3; i++) {
      String result = '';
      DateTime nextDay = today.subtract(Duration(days: i));
      for (int i = 8; i < 10; i++) {
        String date = nextDay.toString();
        result += date[i];
      }
      daysList.add(result);
    }
    return daysList;
  }

  bool isToday(String date) {
    if (date == DateTime.now().day.toString()) {
      return true;
    } else {
      return false;
    }
  }

  List<String> comingDaysNames () {

    List<String> weekDays = ['Mon', 'Tues', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    List<String> daysListName = [];

  int currentDay = DateTime.now().weekday;

  for (int i = 1; i <= 5; i++) {
    int previousDayIndex = (currentDay + i - 1 + 7) % 7; // Calculate the index for the previous days
    String previousDayName = weekDays[previousDayIndex];

    daysListName.add(previousDayName);
  }
  return daysListName;
  }

  List<String> previousDaysNames () {

    List<String> weekDays = ['Mon', 'Tues', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    List<String> daysListName = [];

  int currentDay = DateTime.now().weekday;

  for (int i = 1; i <= 3; i++) {
    int previousDayIndex = (currentDay - i - 1 + 7) % 7; // Calculate the index for the previous days
    String previousDayName = weekDays[previousDayIndex];

    daysListName.add(previousDayName);
  }
  return daysListName;
  }
}