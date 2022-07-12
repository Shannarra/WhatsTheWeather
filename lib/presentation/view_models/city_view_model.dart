import 'dart:ui';

class CityViewModel {
  final String name;
  final String country;
  final String? state;
  final double latitude;
  final double longitude;
  final Map<String, Object> localizations;
  final bool selected;

  const CityViewModel({
    required this.name,
    required this.country,
    this.state,
    required this.latitude,
    required this.longitude,
    required this.localizations,
    required this.selected,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CityViewModel &&
          runtimeType == other.runtimeType &&
          latitude == other.latitude &&
          longitude == other.longitude &&
          selected == other.selected;

  @override
  int get hashCode =>
      latitude.hashCode ^ longitude.hashCode ^ selected.hashCode;

  String localizedName(Locale locale) =>
      localizations[locale.languageCode]?.toString() ?? name;

  String get description =>
      state?.isEmpty ?? true ? country : '$country, $state';
}
