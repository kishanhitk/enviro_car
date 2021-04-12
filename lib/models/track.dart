import 'dart:convert';

import 'package:enviro_car/models/sensor.dart';

class Track {
  String id;
  double length;
  DateTime begin;
  DateTime end;
  Sensor sensor;
  Track({
    required this.id,
    required this.length,
    required this.begin,
    required this.end,
    required this.sensor,
  });

  Track copyWith({
    String? id,
    double? length,
    DateTime? begin,
    DateTime? end,
    Sensor? sensor,
  }) {
    return Track(
      id: id ?? this.id,
      length: length ?? this.length,
      begin: begin ?? this.begin,
      end: end ?? this.end,
      sensor: sensor ?? this.sensor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'length': length,
      'begin': begin.millisecondsSinceEpoch,
      'end': end.millisecondsSinceEpoch,
      'sensor': sensor.toMap(),
    };
  }

  factory Track.fromMap(Map<String, dynamic> map) {
    return Track(
      id: map['id'],
      length: map['length'],
      begin: DateTime.parse(map['begin']),
      end: DateTime.parse(map['end']),
      sensor: Sensor.fromMap(map['sensor']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Track.fromJson(String source) => Track.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Track(id: $id, length: $length, begin: $begin, end: $end, sensor: $sensor)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Track &&
        other.id == id &&
        other.length == length &&
        other.begin == begin &&
        other.end == end &&
        other.sensor == sensor;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        length.hashCode ^
        begin.hashCode ^
        end.hashCode ^
        sensor.hashCode;
  }
}
