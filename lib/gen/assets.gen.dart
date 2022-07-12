/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsI18nGen {
  const $AssetsI18nGen();

  /// File path: assets/i18n/strings.i18n.json
  String get stringsI18n => 'assets/i18n/strings.i18n.json';
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/arrow_down.png
  AssetGenImage get arrowDown =>
      const AssetGenImage('assets/icons/arrow_down.png');

  /// File path: assets/icons/arrow_up.png
  AssetGenImage get arrowUp => const AssetGenImage('assets/icons/arrow_up.png');

  /// File path: assets/icons/cloudy.png
  AssetGenImage get cloudy => const AssetGenImage('assets/icons/cloudy.png');

  /// File path: assets/icons/dust.png
  AssetGenImage get dust => const AssetGenImage('assets/icons/dust.png');

  /// File path: assets/icons/menu.png
  AssetGenImage get menu => const AssetGenImage('assets/icons/menu.png');

  /// File path: assets/icons/overcast.png
  AssetGenImage get overcast =>
      const AssetGenImage('assets/icons/overcast.png');

  /// File path: assets/icons/rain.png
  AssetGenImage get rain => const AssetGenImage('assets/icons/rain.png');

  /// File path: assets/icons/sleet.png
  AssetGenImage get sleet => const AssetGenImage('assets/icons/sleet.png');

  /// File path: assets/icons/snow.png
  AssetGenImage get snow => const AssetGenImage('assets/icons/snow.png');

  /// File path: assets/icons/sunny.png
  AssetGenImage get sunny => const AssetGenImage('assets/icons/sunny.png');

  /// File path: assets/icons/sunrise.png
  AssetGenImage get sunrise => const AssetGenImage('assets/icons/sunrise.png');

  /// File path: assets/icons/sunset.png
  AssetGenImage get sunset => const AssetGenImage('assets/icons/sunset.png');

  /// File path: assets/icons/temperature.png
  AssetGenImage get temperature =>
      const AssetGenImage('assets/icons/temperature.png');

  /// File path: assets/icons/thunderstorm.png
  AssetGenImage get thunderstorm =>
      const AssetGenImage('assets/icons/thunderstorm.png');
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bg.svg
  String get bg => 'assets/images/bg.svg';

  /// File path: assets/images/bg2.svg
  String get bg2 => 'assets/images/bg2.svg';

  /// File path: assets/images/bg3.svg
  String get bg3 => 'assets/images/bg3.svg';

  /// File path: assets/images/bg4.svg
  String get bg4 => 'assets/images/bg4.svg';

  /// File path: assets/images/bg5.svg
  String get bg5 => 'assets/images/bg5.svg';

  /// File path: assets/images/bg6.svg
  String get bg6 => 'assets/images/bg6.svg';
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/cloudy.json
  String get cloudy => 'assets/lottie/cloudy.json';

  /// File path: assets/lottie/dust.json
  String get dust => 'assets/lottie/dust.json';

  /// File path: assets/lottie/error.json
  String get error => 'assets/lottie/error.json';

  /// File path: assets/lottie/loading.json
  String get loading => 'assets/lottie/loading.json';

  /// File path: assets/lottie/no_data.json
  String get noData => 'assets/lottie/no_data.json';

  /// File path: assets/lottie/overcast.json
  String get overcast => 'assets/lottie/overcast.json';

  /// File path: assets/lottie/rain.json
  String get rain => 'assets/lottie/rain.json';

  /// File path: assets/lottie/sleet.json
  String get sleet => 'assets/lottie/sleet.json';

  /// File path: assets/lottie/snow.json
  String get snow => 'assets/lottie/snow.json';

  /// File path: assets/lottie/sunny.json
  String get sunny => 'assets/lottie/sunny.json';

  /// File path: assets/lottie/thunderstorm.json
  String get thunderstorm => 'assets/lottie/thunderstorm.json';
}

class Assets {
  Assets._();

  static const $AssetsI18nGen i18n = $AssetsI18nGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
