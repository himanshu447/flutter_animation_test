/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsVectorsGen {
  const $AssetsVectorsGen();

  /// File path: assets/vectors/figma.svg
  SvgGenImage get figma => const SvgGenImage('assets/vectors/figma.svg');

  /// File path: assets/vectors/hbo-max-svgrepo-com.svg
  SvgGenImage get hboMaxSvgrepoCom =>
      const SvgGenImage('assets/vectors/hbo-max-svgrepo-com.svg');

  /// File path: assets/vectors/instagram-svgrepo-com.svg
  SvgGenImage get instagramSvgrepoCom =>
      const SvgGenImage('assets/vectors/instagram-svgrepo-com.svg');

  /// File path: assets/vectors/play-station-controller-svgrepo-com.svg
  SvgGenImage get playStationControllerSvgrepoCom => const SvgGenImage(
      'assets/vectors/play-station-controller-svgrepo-com.svg');

  /// File path: assets/vectors/spotify-color-svgrepo-com.svg
  SvgGenImage get spotifyColorSvgrepoCom =>
      const SvgGenImage('assets/vectors/spotify-color-svgrepo-com.svg');

  /// File path: assets/vectors/twitter-svgrepo-com.svg
  SvgGenImage get twitterSvgrepoCom =>
      const SvgGenImage('assets/vectors/twitter-svgrepo-com.svg');

  /// File path: assets/vectors/youtube-svgrepo-com.svg
  SvgGenImage get youtubeSvgrepoCom =>
      const SvgGenImage('assets/vectors/youtube-svgrepo-com.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        figma,
        hboMaxSvgrepoCom,
        instagramSvgrepoCom,
        playStationControllerSvgrepoCom,
        spotifyColorSvgrepoCom,
        twitterSvgrepoCom,
        youtubeSvgrepoCom
      ];
}

class Assets {
  const Assets._();

  static const $AssetsVectorsGen vectors = $AssetsVectorsGen();
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
