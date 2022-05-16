import 'package:app_test/model/model_photo/model_photo.dart';
import 'package:app_test/vars/helper.dart';
import 'package:flutter/material.dart';

import '../components/top_header.dart';

class PhotoScreen extends StatelessWidget {
  final ModelPhoto modelPhoto;

  const PhotoScreen({Key? key, required this.modelPhoto}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          topHeader(c: c, header: c.l.infoPhoto, onPressedBack: () => Navigator.pop(c)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.network(modelPhoto.urlsFull!)),
          ),
        ],
      ),
    );
  }
}
