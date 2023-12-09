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
        mag: json["mag"] == null ? null : json["mag"].toDouble() as double?,
        lokasyon: json["lokasyon"] == null ? null : json["lokasyon"] as String?,
        geojson: json["geojson"] != null ? Geojson.fromJson(json["geojson"] as Map<String, dynamic>) : null,
        depth: json["depth"] == null ? null : json["depth"].toDouble() as double?,
        title: json["title"] == null ? null : json["title"] as String?,
        date: json["date"] == null ? null : json["date"] as String?,
      );
}
