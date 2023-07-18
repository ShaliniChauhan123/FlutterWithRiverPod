import 'package:flutter/material.dart';

class RenderList {
  final int id;
  final Image image;
  final String title;

  const RenderList({
    required this.id,
    required this.image,
    required this.title,
    // @required content,
  });
}

class CustomObject {
  final String title;
  final Color iconColor;
  final Color titleColor;
  const CustomObject(
      {required this.title, required this.titleColor, required this.iconColor});
}
