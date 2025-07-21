import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fuoday/commons/widgets/k_app_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';

class ImagePreviewScreen extends StatelessWidget {
  final String filePath;

  const ImagePreviewScreen({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: "Image Preview",
        centerTitle: true,
        leadingIcon: Icons.arrow_back,
        onLeadingIconPress: () {
          GoRouter.of(context).pop();
        },
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            showImageViewer(
              context,
              Image.file(File(filePath)).image,
              swipeDismissible: true,
              doubleTapZoomable: true,
            );
          },
          child: Hero(
            tag: "preview-image",
            child: Image.file(File(filePath), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
