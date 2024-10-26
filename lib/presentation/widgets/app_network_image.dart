import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

class AppNetworkImage extends StatelessWidget {
  final double? size;
  final double? width;
  final double? height;
  final BoxFit? boxFit;
  final String url;

  const AppNetworkImage({
    required this.url,
    this.boxFit,
    this.size,
    this.width,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width ?? size,
      height: height ?? size,
      fit: boxFit,
      imageUrl: url,
    );
  }
}

