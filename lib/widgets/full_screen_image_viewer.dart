import 'dart:typed_data';
import 'package:flutter/material.dart';

class FullScreenImageViewer extends StatelessWidget {
  final Uint8List imageBytes;
  final String heroTag;

  const FullScreenImageViewer({
    super.key,
    required this.imageBytes,
    this.heroTag = 'full_screen_image',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SafeArea(
        child: SizedBox.expand(
          child: InteractiveViewer(
            minScale: 1.0,
            maxScale: 5.0,
            child: Hero(
              tag: heroTag,
              child: Image.memory(
                imageBytes,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
