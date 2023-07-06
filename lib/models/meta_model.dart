import 'dart:convert';
class Meta {
    int cost;
    int dailyQuota;
    String end;
    double lat;
    double lng;
    List<String> params;
    int requestCount;
    String start;

    Meta({
        required this.cost,
        required this.dailyQuota,
        required this.end,
        required this.lat,
        required this.lng,
        required this.params,
        required this.requestCount,
        required this.start,
    });

    factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        cost: json["cost"],
        dailyQuota: json["dailyQuota"],
        end: json["end"],
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
        params: List<String>.from(json["params"].map((x) => x)),
        requestCount: json["requestCount"],
        start: json["start"],
    );

    Map<String, dynamic> toMap() => {
        "cost": cost,
        "dailyQuota": dailyQuota,
        "end": end,
        "lat": lat,
        "lng": lng,
        "params": List<dynamic>.from(params.map((x) => x)),
        "requestCount": requestCount,
        "start": start,
    };
}