import 'dart:convert';

import 'package:mce_test/models/hour_model.dart';
import 'package:mce_test/models/meta_model.dart';

class Precipitationresponse {
    List<Hour> hours;
    Meta meta;

    Precipitationresponse({
        required this.hours,
        required this.meta,
    });

    factory Precipitationresponse.fromJson(String str) => Precipitationresponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Precipitationresponse.fromMap(Map<String, dynamic> json) => Precipitationresponse(
        hours: List<Hour>.from(json["hours"].map((x) => Hour.fromMap(x))),
        meta: Meta.fromMap(json["meta"]),
    );

    Map<String, dynamic> toMap() => {
        "hours": List<dynamic>.from(hours.map((x) => x.toMap())),
        "meta": meta.toMap(),
    };
}






