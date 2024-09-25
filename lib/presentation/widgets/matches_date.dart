class MatchesDate {


String getDate() {
  String result = '';

  String date = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).toString();

  for (int i = 0; i < 10; i++) {
    result += date[i];
  }

  return result;
}
String getMonthName() {
List<String> monthNames = [
  'January', 'February', 'March', 'April', 'May', 'June',
  'July', 'August', 'September', 'October', 'November', 'December'
];

// Accessing the current month name
int currentMonth = DateTime.now().month;
String currentMonthName = monthNames[currentMonth - 1]; // Subtract 1 because list is zero-indexed

return currentMonthName;
}
}