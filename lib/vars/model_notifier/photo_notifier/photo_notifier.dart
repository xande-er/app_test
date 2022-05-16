import 'package:flutter/material.dart';

import '../../../model/model_photo/model_photo.dart';

class PhotoNotifier extends ChangeNotifier {
  int activePage = 1;

  List<ModelPhoto> modelPhoto = [];

  setActivePage({required int val, bool upd = true}) {
    activePage = val;
    if (upd) notifyListeners();
  }

  setModelPhoto({required List<ModelPhoto> newModelPhoto, bool upd = true}) {
    modelPhoto = newModelPhoto;
    if (upd) notifyListeners();
  }
}
