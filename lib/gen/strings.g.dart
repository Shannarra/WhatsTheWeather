
/*
 * Generated file. Do not edit.
 *
 * Locales: 1
 * Strings: 57 
 *
 * Built on 2022-04-11 at 16:43 UTC
 */

import 'package:flutter/widgets.dart';

const AppLocale _baseLocale = AppLocale.en;
AppLocale _currLocale = _baseLocale;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale {
	en, // 'en' (base locale, fallback)
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn _t = _currLocale.translations;
_StringsEn get t => _t;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget.translations;
	}
}

class LocaleSettings {
	LocaleSettings._(); // no constructor

	/// Uses locale of the device, fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale useDeviceLocale() {
		final locale = AppLocaleUtils.findDeviceLocale();
		return setLocale(locale);
	}

	/// Sets locale
	/// Returns the locale which has been set.
	static AppLocale setLocale(AppLocale locale) {
		_currLocale = locale;
		_t = _currLocale.translations;

		if (WidgetsBinding.instance != null) {
			// force rebuild if TranslationProvider is used
			_translationProviderKey.currentState?.setLocale(_currLocale);
		}

		return _currLocale;
	}

	/// Sets locale using string tag (e.g. en_US, de-DE, fr)
	/// Fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale setLocaleRaw(String rawLocale) {
		final locale = AppLocaleUtils.parse(rawLocale);
		return setLocale(locale);
	}

	/// Gets current locale.
	static AppLocale get currentLocale {
		return _currLocale;
	}

	/// Gets base locale.
	static AppLocale get baseLocale {
		return _baseLocale;
	}

	/// Gets supported locales in string format.
	static List<String> get supportedLocalesRaw {
		return AppLocale.values
			.map((locale) => locale.languageTag)
			.toList();
	}

	/// Gets supported locales (as Locale objects) with base locale sorted first.
	static List<Locale> get supportedLocales {
		return AppLocale.values
			.map((locale) => locale.flutterLocale)
			.toList();
	}
}

/// Provides utility functions without any side effects.
class AppLocaleUtils {
	AppLocaleUtils._(); // no constructor

	/// Returns the locale of the device as the enum type.
	/// Fallbacks to base locale.
	static AppLocale findDeviceLocale() {
		final String deviceLocale = WidgetsBinding.instance.window.locale.toLanguageTag();
		if (deviceLocale != null) {
			final typedLocale = _selectLocale(deviceLocale);
			if (typedLocale != null) {
				return typedLocale;
			}
		}
		return _baseLocale;
	}

	/// Returns the enum type of the raw locale.
	/// Fallbacks to base locale.
	static AppLocale parse(String rawLocale) {
		return _selectLocale(rawLocale) ?? _baseLocale;
	}
}

// context enums

// interfaces generated as mixins

// translation instances

late _StringsEn _translationsEn = _StringsEn.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {

	/// Gets the translation instance managed by this library.
	/// [TranslationProvider] is using this instance.
	/// The plural resolvers are set via [LocaleSettings].
	_StringsEn get translations {
		switch (this) {
			case AppLocale.en: return _translationsEn;
		}
	}

	/// Gets a new translation instance.
	/// [LocaleSettings] has no effect here.
	/// Suitable for dependency injection and unit tests.
	///
	/// Usage:
	/// final t = AppLocale.en.build(); // build
	/// String a = t.my.path; // access
	_StringsEn build() {
		switch (this) {
			case AppLocale.en: return _StringsEn.build();
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.en: return 'en';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.en: return const Locale.fromSubtags(languageCode: 'en');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'en': return AppLocale.en;
			default: return null;
		}
	}
}

// wrappers

GlobalKey<_TranslationProviderState> _translationProviderKey = GlobalKey<_TranslationProviderState>();

class TranslationProvider extends StatefulWidget {
	TranslationProvider({required this.child}) : super(key: _translationProviderKey);

	final Widget child;

	@override
	_TranslationProviderState createState() => _TranslationProviderState();

	static _InheritedLocaleData of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget;
	}
}

class _TranslationProviderState extends State<TranslationProvider> {
	AppLocale locale = _currLocale;

	void setLocale(AppLocale newLocale) {
		setState(() {
			locale = newLocale;
		});
	}

	@override
	Widget build(BuildContext context) {
		return _InheritedLocaleData(
			locale: locale,
			child: widget.child,
		);
	}
}

class _InheritedLocaleData extends InheritedWidget {
	final AppLocale locale;
	Locale get flutterLocale => locale.flutterLocale; // shortcut
	final _StringsEn translations; // store translations to avoid switch call

	_InheritedLocaleData({required this.locale, required Widget child})
		: translations = locale.translations, super(child: child);

	@override
	bool updateShouldNotify(_InheritedLocaleData oldWidget) {
		return oldWidget.locale != locale;
	}
}

// pluralization feature not used

// helpers

final _localeRegex = RegExp(r'^([a-z]{2,8})?([_-]([A-Za-z]{4}))?([_-]?([A-Z]{2}|[0-9]{3}))?$');
AppLocale? _selectLocale(String localeRaw) {
	final match = _localeRegex.firstMatch(localeRaw);
	AppLocale? selected;
	if (match != null) {
		final language = match.group(1);
		final country = match.group(5);

		// match exactly
		selected = AppLocale.values
			.cast<AppLocale?>()
			.firstWhere((supported) => supported?.languageTag == localeRaw.replaceAll('_', '-'), orElse: () => null);

		if (selected == null && language != null) {
			// match language
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.startsWith(language) == true, orElse: () => null);
		}

		if (selected == null && country != null) {
			// match country
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.contains(country) == true, orElse: () => null);
		}
	}
	return selected;
}

// translations

// Path: <root>
class _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build();

	/// Access flat map
	dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	// ignore: unused_field
	late final _StringsEn _root = this;

	// Translations
	String get name => 'Flutter Weather';
	late final _StringsSplashEn splash = _StringsSplashEn._(_root);
	late final _StringsCitySearchEn city_search = _StringsCitySearchEn._(_root);
	late final _StringsDrawerEn drawer = _StringsDrawerEn._(_root);
	late final _StringsHomeEn home = _StringsHomeEn._(_root);
	late final _StringsWeatherEn weather = _StringsWeatherEn._(_root);
	late final _StringsErrorEn error = _StringsErrorEn._(_root);
}

// Path: splash
class _StringsSplashEn {
	_StringsSplashEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get button_title => 'Begin';
}

// Path: city_search
class _StringsCitySearchEn {
	_StringsCitySearchEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get title => 'Search for city';
	String get input_hint => 'Enter city name';
	String get location_button_hint => 'Use my location';
	String get no_data => 'No cities found';
}

// Path: drawer
class _StringsDrawerEn {
	_StringsDrawerEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get cities_section_title => 'Cities';
	String get city_add_button_hint => 'Add city';
	String get about_section_title => 'About Flutter Weather';
}

// Path: home
class _StringsHomeEn {
	_StringsHomeEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get no_data => 'You have no saved cities!';
	String get no_data_button => 'Select city';
	String get tomorrow => 'Tomorrow';
	String next_days({required Object count}) => 'Next $count days';
}

// Path: weather
class _StringsWeatherEn {
	_StringsWeatherEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String today_date({required Object date}) => 'Today, $date';
	String tomorrow_date({required Object date}) => 'Tomorrow, $date';
	String get max => 'MAX';
	String get min => 'MIN';
	String get sunrise => 'Sunrise';
	String get sunset => 'Sunset';
	String get details => 'Details';
	late final _StringsWeatherDetailItemsEn detail_items = _StringsWeatherDetailItemsEn._(_root);
	late final _StringsWeatherUvNameEn uv_name = _StringsWeatherUvNameEn._(_root);
	late final _StringsWeatherStatusNameEn status_name = _StringsWeatherStatusNameEn._(_root);
	late final _StringsWeatherStatusDescriptionEn status_description = _StringsWeatherStatusDescriptionEn._(_root);
}

// Path: error
class _StringsErrorEn {
	_StringsErrorEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get title => 'An error occurred :(';
	String get button => 'Try again';
}

// Path: weather.detail_items
class _StringsWeatherDetailItemsEn {
	_StringsWeatherDetailItemsEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get pressure => 'Pressure';
	String get humidity => 'Humidity';
	String get cloudiness => 'Cloudiness';
	String get clouds => 'Clouds';
	String get wind => 'Wind';
	String get windspeed => 'Windspeed';
	String get pop => 'Pop';
	String get rain => 'Rain';
	String get snow => 'Snow';
	String get uvi => 'UV Index';
}

// Path: weather.uv_name
class _StringsWeatherUvNameEn {
	_StringsWeatherUvNameEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get low => 'Low';
	String get moderate => 'Moderate';
	String get high => 'High';
	String get very_high => 'Very High';
	String get extreme => 'Extreme';
}

// Path: weather.status_name
class _StringsWeatherStatusNameEn {
	_StringsWeatherStatusNameEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get unknown => 'Unknown';
	String get clouds => 'Clouds';
	String get dust => 'Dust';
	String get overcast => 'Overcast';
	String get rain => 'Rain';
	String get drizzle => 'Drizzle';
	String get sleet => 'Sleet';
	String get snow => 'Snow';
	String get clear => 'Clear';
	String get thunderstorm => 'Thunderstorm';
}

// Path: weather.status_description
class _StringsWeatherStatusDescriptionEn {
	_StringsWeatherStatusDescriptionEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get unknown => 'Unknown';
	String get clouds => 'Cloudy';
	String get dust => 'Dusty';
	String get overcast => 'Overcast';
	String get rain => 'Rainy';
	String get drizzle => 'Drizzle';
	String get sleet => 'Sleet';
	String get snow => 'Snowy';
	String get clear => 'Sunny';
	String get thunderstorm => 'Thunderstorm';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	Map<String, dynamic> _buildFlatMap() {
		return {
			'name': 'Flutter Weather',
			'splash.button_title': 'Begin',
			'city_search.title': 'Search for city',
			'city_search.input_hint': 'Enter city name',
			'city_search.location_button_hint': 'Use my location',
			'city_search.no_data': 'No cities found',
			'drawer.cities_section_title': 'Cities',
			'drawer.city_add_button_hint': 'Add city',
			'drawer.about_section_title': 'About Flutter Weather',
			'home.no_data': 'You have no saved cities!',
			'home.no_data_button': 'Select city',
			'home.tomorrow': 'Tomorrow',
			'home.next_days': ({required Object count}) => 'Next $count days',
			'weather.today_date': ({required Object date}) => 'Today, $date',
			'weather.tomorrow_date': ({required Object date}) => 'Tomorrow, $date',
			'weather.max': 'MAX',
			'weather.min': 'MIN',
			'weather.sunrise': 'Sunrise',
			'weather.sunset': 'Sunset',
			'weather.details': 'Details',
			'weather.detail_items.pressure': 'Pressure',
			'weather.detail_items.humidity': 'Humidity',
			'weather.detail_items.cloudiness': 'Cloudiness',
			'weather.detail_items.clouds': 'Clouds',
			'weather.detail_items.wind': 'Wind',
			'weather.detail_items.windspeed': 'Windspeed',
			'weather.detail_items.pop': 'Pop',
			'weather.detail_items.rain': 'Rain',
			'weather.detail_items.snow': 'Snow',
			'weather.detail_items.uvi': 'UV Index',
			'weather.uv_name.low': 'Low',
			'weather.uv_name.moderate': 'Moderate',
			'weather.uv_name.high': 'High',
			'weather.uv_name.very_high': 'Very High',
			'weather.uv_name.extreme': 'Extreme',
			'weather.status_name.unknown': 'Unknown',
			'weather.status_name.clouds': 'Clouds',
			'weather.status_name.dust': 'Dust',
			'weather.status_name.overcast': 'Overcast',
			'weather.status_name.rain': 'Rain',
			'weather.status_name.drizzle': 'Drizzle',
			'weather.status_name.sleet': 'Sleet',
			'weather.status_name.snow': 'Snow',
			'weather.status_name.clear': 'Clear',
			'weather.status_name.thunderstorm': 'Thunderstorm',
			'weather.status_description.unknown': 'Unknown',
			'weather.status_description.clouds': 'Cloudy',
			'weather.status_description.dust': 'Dusty',
			'weather.status_description.overcast': 'Overcast',
			'weather.status_description.rain': 'Rainy',
			'weather.status_description.drizzle': 'Drizzle',
			'weather.status_description.sleet': 'Sleet',
			'weather.status_description.snow': 'Snowy',
			'weather.status_description.clear': 'Sunny',
			'weather.status_description.thunderstorm': 'Thunderstorm',
			'error.title': 'An error occurred :(',
			'error.button': 'Try again',
		};
	}
}
