class Football {
  late String tournamentName;
  late String countryName;
  late String sportName;
  late bool isLive;
  late int id;
  late String seasonName;
  late int roundInfo;
  late String half;
  late String matchStatus;
  late String homeTeamName;
  late String awayTeamName;
  late int homeTeamScore;
  late int awayTeamScore;
  late int startTime;
  late int maxTime;
  late int extraTime;
  late DateTime currentTime;

  Football.fromJson(Map<String, dynamic> json) {
    tournamentName = json['tournament']['name'] ?? 'Unknown';
    countryName = json['tournament']['category']['name'] ?? 'Unknown';
    sportName = json['tournament']['category']['sport']['name'] ?? 'Unknown';
    isLive = json['tournament']['isLive'] ?? false;
    id = json['id'] ?? -1;
    seasonName = json['season']['name'] ?? 'Unknown';
    roundInfo = (json['roundInfo'] != null && json['roundInfo']['round'] != null)
        ? json['roundInfo']['round']
        : 0;
    half = json['status']['description'] ?? 'Unknown';
    matchStatus = json['status']['type'] ?? 'Unknown';
    homeTeamName = json['homeTeam']['name'] ?? 'Unknown';
    awayTeamName = json['awayTeam']['name'] ?? 'Unknown';
    homeTeamScore = json['homeScore']['current'] ?? 'Unknown';
    awayTeamScore = json['awayScore']['current'] ?? 'Unknown';
    startTime = json['time']['initial'] ?? 0;
    maxTime = json['time']['max'] ?? 0;
    extraTime = json['time']['extra'] ?? 0;
    currentTime = DateTime.fromMillisecondsSinceEpoch(
      (json['time']['currentPeriodStartTimestamp'] ?? 0) * 1000,
      isUtc: true,
    );
  }
}