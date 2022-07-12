import 'dart:convert';

class CityDto {
  final String name;
  final String country;
  final String? state;
  final double latitude;
  final double longitude;
  final Map<String, dynamic> localizations;

  const CityDto({
    required this.name,
    required this.country,
    this.state,
    required this.latitude,
    required this.longitude,
    required this.localizations,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'country': country,
      'state': state,
      'latitude': latitude,
      'longitude': longitude,
      'localizations': localizations,
    };
  }

  factory CityDto.fromMap(Map<String, dynamic> map) {
    return CityDto(
      name: map['name'] as String,
      country: map['country'] as String,
      state: map['state'] as String?,
      latitude: map['lat'] as double,
      longitude: map['lon'] as double,
      localizations: map['local_names'] as Map<String, dynamic>,
    );
  }

  String toJson() => json.encode(toMap());

  factory CityDto.fromJson(String source) =>
      CityDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
