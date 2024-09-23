import 'package:rubyscore/data/model/football.dart';
import 'package:rubyscore/data/web_services/api.dart';

class FootballRepo {
  final Api api;

  FootballRepo(this.api);

  Future<List<Football>> getAllLiveMatches() async {
  final footballData = await api.getAllFootball();

  // Check if footballData is not empty before mapping
  if (footballData.isEmpty) {
    print("No live matches found.");
    return [];
  }

  final matches = footballData.map((liveMatchData) => Football.fromJson(liveMatchData)).toList();
  print(matches); // This should now print the list of Football objects
  return matches;
}
}