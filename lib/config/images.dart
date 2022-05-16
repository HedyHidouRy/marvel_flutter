import 'package:flutter/material.dart';

const String _imagePath = 'assets/images';

class _Image extends AssetImage {
  const _Image(String fileName) : super('$_imagePath/$fileName');
}

class AppImages {
  static const splash = _Image('splash.jpeg');
  static const deadpool = _Image('deadpool.png');
  static const marvelLoader = _Image('marvel_loader.gif');
}
