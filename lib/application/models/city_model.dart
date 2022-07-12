// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CityModel {
  final int? id;
  final String name;
  final String country;
  final String? state;
  final double latitude;
  final double longitude;
  final Map<String, Object> localizations;
  final bool selected;
  CityModel({
    this.id,
    required this.name,
    required this.country,
    this.state,
    required this.latitude,
    required this.longitude,
    required this.localizations,
    required this.selected,
  });

  CityModel copyWith({
    int? id,
    String? name,
    String? country,
    String? state,
    double? latitude,
    double? longitude,
    Map<String, Object>? localizations,
    bool? selected,
  }) {
    return CityModel(
      id: id ?? this.id,
      name: name ?? this.name,
      country: country ?? this.country,
      state: state ?? this.state,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      localizations: localizations ?? this.localizations,
      selected: selected ?? this.selected,
    );
  }
}
