import 'dart:convert';

import 'package:mce_test/models/precipitation_model.dart';

class Hour {
    Precipitation precipitation;
    DateTime time;

    Hour({
        required this.precipitation,
        required this.time,
    });

    factory Hour.fromJson(String str) => Hour.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Hour.fromMap(Map<String, dynamic> json) => Hour(
        precipitation: Precipitation.fromMap(json["precipitation"]),
        time: DateTime.parse(json["time"]),
    );

    Map<String, dynamic> toMap() => {
        "precipitation": precipitation.toMap(),
        "time": time.toIso8601String(),
    };
}