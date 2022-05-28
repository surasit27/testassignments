class OPTimes {
  String day;
  String timeopen;
  String timeclose;
  OPTimes({
    required this.day,
    required this.timeopen,
    required this.timeclose,
  });

  factory OPTimes.fromJson(Map<String, dynamic> json) {
    return OPTimes(
      day: json["day"],
      timeopen: json["time_open"],
      timeclose: json["time_close"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": day,
        "time_open": timeopen,
        "time_close": timeclose,
      };
}
