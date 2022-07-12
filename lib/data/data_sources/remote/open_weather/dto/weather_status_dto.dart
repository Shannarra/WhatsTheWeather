import 'dart:convert';

class WeatherStatusDto {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherStatusDto({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  WeatherStatusDto copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) {
    return WeatherStatusDto(
      id: id ?? this.id,
      main: main ?? this.main,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }

  factory WeatherStatusDto.fromMap(Map<String, dynamic> map) {
    return WeatherStatusDto(
      id: map['id'] as int,
      main: map['main'] as String,
      description: map['description'] as String,
      icon: map['icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherStatusDto.fromJson(String source) =>
      WeatherStatusDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherStatusDto(id: $id, main: $main, description: $description, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherStatusDto &&
        other.id == id &&
        other.main == main &&
        other.description == description &&
        other.icon == icon;
  }

  @override
  int get hashCode {
    return id.hashCode ^ main.hashCode ^ description.hashCode ^ icon.hashCode;
  }
}
