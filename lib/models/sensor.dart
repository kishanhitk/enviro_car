import 'dart:convert';

import 'package:enviro_car/models/properties.dart';

class Sensor {
  String type;
  Properties properties;
  Sensor({
    required this.type,
    required this.properties,
  });

  Sensor copyWith({
    String? type,
    Properties? properties,
  }) {
    return Sensor(
      type: type ?? this.type,
      properties: properties ?? this.properties,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'properties': properties.toMap(),
    };
  }

  factory Sensor.fromMap(Map<String, dynamic> map) {
    return Sensor(
      type: map['type'],
      properties: Properties.fromMap(map['properties']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Sensor.fromJson(String source) => Sensor.fromMap(json.decode(source));

  @override
  String toString() => 'Sensor(type: $type, properties: $properties)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Sensor &&
        other.type == type &&
        other.properties == properties;
  }

  @override
  int get hashCode => type.hashCode ^ properties.hashCode;
}
