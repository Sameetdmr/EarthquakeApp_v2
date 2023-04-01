import 'GeoJson.dart';

class Result {
  double? mag;
  double? depth;
  Geojson? geojson;
  String? lokasyon;
  String? title;
  String? date;
  Result({
    this.mag,
    this.geojson,
    this.depth,
    this.lokasyon,
    this.title,
    this.date,
  });
  factory Result.fromJson(Map<String, dynamic> json) => Result(
        mag: json["mag"] == null ? null : json["mag"].toDouble(),
        lokasyon: json["lokasyon"] == null ? null : json["lokasyon"],
        geojson: json["geojson"] != null ? Geojson.fromJson(json["geojson"]) : null,
        depth: json["depth"] == null ? null : json["depth"].toDouble(),
        title: json["title"] == null ? null : json["title"],
        date: json["date"] == null ? null : json["date"],
      );
}
