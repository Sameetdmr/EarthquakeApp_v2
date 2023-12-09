class Geojson {
  String? type;
  List<double>? coordinates;

  Geojson({
    this.type,
    this.coordinates,
  });

  Geojson copyWith({
    String? type,
    List<double>? coordinates,
  }) {
    return Geojson(
      type: type ?? this.type,
      coordinates: coordinates ?? this.coordinates,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'coordinates': coordinates,
    };
  }

  factory Geojson.fromJson(Map<String, dynamic> json) {
    return Geojson(
      type: json['type'] as String?,
      coordinates: (json['coordinates'] as List<dynamic>?)?.map((e) => e as double).toList(),
    );
  }
}
