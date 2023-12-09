import 'package:depremapp/models/domain/Result.dart';

class EarthquakeResponse {
  bool? status;

  List<Result>? result;

  EarthquakeResponse({
    this.status,
    this.result,
  });

  EarthquakeResponse copyWith({
    bool? status,
    List<Result>? result,
  }) {
    return EarthquakeResponse(
      status: status ?? this.status,
      result: result ?? this.result,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'result': result,
    };
  }

  factory EarthquakeResponse.fromJson(Map<String, dynamic> json) {
    return EarthquakeResponse(
      status: json['status'] as bool?,
      result: (json['result'] as List<dynamic>?)?.map((e) => Result.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}
