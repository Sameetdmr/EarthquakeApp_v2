import '../../../domain/Result.dart';

class EarthquakeResponse {
  bool? status;
  List<Result>? result;
  EarthquakeResponse({
    this.status,
    this.result,
  });

  factory EarthquakeResponse.fromJson(Map<String, dynamic> json) => EarthquakeResponse(
        status: json["status"],
        result: json["result"] == null ? null : List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );
}
