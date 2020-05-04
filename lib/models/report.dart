class Report {
  final int temp;
  final String wax;
  final String line;
  final String timestamp;

  Report({this.line, this.temp, this.timestamp, this.wax});

  Report.fromJson(Map<String, dynamic> parsedJson)
      : temp = parsedJson['temp'],
        wax = parsedJson['wax'],
        timestamp = parsedJson['timestamp'],
        line = parsedJson['line'];
}
