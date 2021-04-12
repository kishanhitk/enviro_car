import 'dart:convert';

class Properties {
  int engineDisplacement;
  String model;
  String id;
  String fuelType;
  int constructionYear;
  String manufacturer;
  Properties({
    required this.engineDisplacement,
    required this.model,
    required this.id,
    required this.fuelType,
    required this.constructionYear,
    required this.manufacturer,
  });

  Properties copyWith({
    int? engineDisplacement,
    String? model,
    String? id,
    String? fuelType,
    int? constructionYear,
    String? manufacturer,
  }) {
    return Properties(
      engineDisplacement: engineDisplacement ?? this.engineDisplacement,
      model: model ?? this.model,
      id: id ?? this.id,
      fuelType: fuelType ?? this.fuelType,
      constructionYear: constructionYear ?? this.constructionYear,
      manufacturer: manufacturer ?? this.manufacturer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'engineDisplacement': engineDisplacement,
      'model': model,
      'id': id,
      'fuelType': fuelType,
      'constructionYear': constructionYear,
      'manufacturer': manufacturer,
    };
  }

  factory Properties.fromMap(Map<String, dynamic> map) {
    return Properties(
      engineDisplacement: map['engineDisplacement'],
      model: map['model'],
      id: map['id'],
      fuelType: map['fuelType'],
      constructionYear: map['constructionYear'],
      manufacturer: map['manufacturer'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Properties.fromJson(String source) =>
      Properties.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Properties(engineDisplacement: $engineDisplacement, model: $model, id: $id, fuelType: $fuelType, constructionYear: $constructionYear, manufacturer: $manufacturer)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Properties &&
        other.engineDisplacement == engineDisplacement &&
        other.model == model &&
        other.id == id &&
        other.fuelType == fuelType &&
        other.constructionYear == constructionYear &&
        other.manufacturer == manufacturer;
  }

  @override
  int get hashCode {
    return engineDisplacement.hashCode ^
        model.hashCode ^
        id.hashCode ^
        fuelType.hashCode ^
        constructionYear.hashCode ^
        manufacturer.hashCode;
  }
}
