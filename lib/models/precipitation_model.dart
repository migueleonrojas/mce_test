import 'dart:convert';

class Precipitation {
    double noaa;
    double sg;

    Precipitation({
        required this.noaa,
        required this.sg,
    });

    factory Precipitation.fromJson(String str) => Precipitation.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Precipitation.fromMap(Map<String, dynamic> json) => Precipitation(
        noaa: json["noaa"]?.toDouble(),
        sg: json["sg"]?.toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "noaa": noaa,
        "sg": sg,
    };
}