import 'package:app_test/model/model_photo/model_photo.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../server/server.dart';
import '../../vars/model_notifier/photo_notifier/photo_notifier.dart';

Future structPhoto({required BuildContext c}) async {

  final res = await Server().viewAllPhoto(page: c.read<PhotoNotifier>().activePage, c: c);

  c.read<PhotoNotifier>().setActivePage(val: c.read<PhotoNotifier>().activePage++);
  List<ModelPhoto> modelPhoto = c.read<PhotoNotifier>().modelPhoto;

  for (var i in res) {
    ModelPhoto localModelPhoto = ModelPhoto();

    localModelPhoto.id = i['id'];
    localModelPhoto.urlsSmall = i['urls']['small'];
    localModelPhoto.urlsFull = i['urls']['full'];
    localModelPhoto.firstName = i['user']['first_name'];
    localModelPhoto.lastName = i['user']['last_name'];
    modelPhoto.add(localModelPhoto);
  }
  c.read<PhotoNotifier>().setModelPhoto(newModelPhoto: modelPhoto);
}
