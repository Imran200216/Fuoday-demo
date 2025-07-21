import 'package:flutter/material.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';

class AppImageViewer {
  static void show({
    required BuildContext context,
    required String imageUrl,
    bool swipeDismissible = true,
    bool doubleTapZoomable = true,
    BoxFit fit = BoxFit.contain,
  }) {
    showImageViewer(
      context,
      Image.network(imageUrl, fit: fit).image,
      swipeDismissible: swipeDismissible,
      doubleTapZoomable: doubleTapZoomable,
    );
  }
}
