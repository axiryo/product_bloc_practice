import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CommonUI {
  static Widget cachedNetworkImageWithPlaceholder({
    required String imageUrl,
    BoxFit fit = BoxFit.cover,
    double? height,
    double? width,
    BorderRadius borderRadius = BorderRadius.zero,
    Color? color,
  }) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: height,
        width: width,
        fit: fit,
        maxHeightDiskCache: 900,
        maxWidthDiskCache: 675,
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
          size: 100,
          color: Colors.red,
        ),
      ),
    );
  }
}
