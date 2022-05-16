import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget photoLoad({required String url, double? height, double? width, BoxFit? fit, double? circular}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(circular ?? 10),
    child: CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          Center(child: CircularProgressIndicator(value: downloadProgress.progress, color: const Color(0xffFF7D5C))),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    ),
  );
}
