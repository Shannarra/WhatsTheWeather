import 'dart:convert';

class WeatherAlertModel {
  final int? id;
  final String name;
  final String description;
  final int unixStart;
  final int unixEnd;
  final bool isNotified;
  WeatherAlertModel({
    this.id,
    required this.name,
    required this.description,
    required this.unixStart,
    required this.unixEnd,
    required this.isNotified,
  });

  WeatherAlertModel copyWith({
    int? id,
    String? name,
    String? description,
    int? unixStart,
    int? unixEnd,
    bool? isNotified,
  }) {
    return WeatherAlertModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      unixStart: unixStart ?? this.unixStart,
      unixEnd: unixEnd ?? this.unixEnd,
      isNotified: isNotified ?? this.isNotified,
    );
  }
 
}
