class TurnResult {
  final int previousTurn;
  final int newTurn;
  final String corpName;
  final List<String> logs;
  final int newMissionsGenerated;
  final int newCadetsAvailable;
  final int solarsDelta;

  const TurnResult({
    required this.previousTurn,
    required this.newTurn,
    required this.corpName,
    required this.logs,
    this.newMissionsGenerated = 5,
    this.newCadetsAvailable = 20,
    this.solarsDelta = 0,
  });
}
