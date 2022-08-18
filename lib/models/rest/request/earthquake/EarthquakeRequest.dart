class EarthquakeRequest {
  int? limit;
  EarthquakeRequest({this.limit});

  Map<String, dynamic> toJson() => {
        "limit": limit,
      };
}
