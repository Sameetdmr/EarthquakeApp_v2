class Result {
  double? mag;
  double? lng;
  double? lat;
  double? depth;
  String? lokasyon;

  String? title;
  String? date;
  Result({
    this.mag,
    this.lng,
    this.lat,
    this.depth,
    this.lokasyon,
    this.title,
    this.date,
  });
  factory Result.fromJson(Map<String, dynamic> json) => Result(
        mag: json["mag"] == null ? null : json["mag"].toDouble(),
        lng: json["lng"] == null ? null : json["lng"].toDouble(),
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lokasyon: json["lokasyon"] == null ? null : json["lokasyon"],
        depth: json["depth"] == null ? null : json["depth"].toDouble(),
        title: json["title"] == null ? null : json["title"],
        date: json["date"] == null ? null : json["date"],
      );
}
