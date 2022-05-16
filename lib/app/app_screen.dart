import 'package:app_test/app/components/block_photo.dart';
import 'package:app_test/app/photo/photo_screen.dart';
import 'package:app_test/model/model_photo/model_photo.dart';
import 'package:app_test/vars/helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../model/model_photo/struct_photo.dart';
import '../ui/buttons/b_load.dart';
import '../ui/navigator/navigator.dart';
import '../vars/model_notifier/photo_notifier/photo_notifier.dart';
import 'components/top_header.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  final ScrollController controllerScroll = ScrollController();
  final RefreshController controllerLoading = RefreshController();

  @override
  void initState() {
    structPhoto(c: context);
    super.initState();
  }

  @override
  void dispose() {
    controllerScroll.dispose();
    controllerLoading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext c) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          topHeader(c: c, header: c.l.photo),
          Expanded(
              child: c.watch<PhotoNotifier>().modelPhoto.isNotEmpty
                  ? SmartRefresher(
                      controller: controllerLoading,
                      onLoading: () async {
                        await structPhoto(c: context);
                        controllerLoading.loadComplete();
                      },
                      enablePullUp: true,
                      enablePullDown: false,
                      header: const WaterDropHeader(
                        waterDropColor: Color(0xffFF7D5C),
                      ),
                      child: ListView.separated(
                          physics: const ClampingScrollPhysics(),
                          itemCount: 1,
                          controller: controllerScroll,
                          separatorBuilder: (c, i) {
                            return Container();
                          },
                          itemBuilder: (_, e) => Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Wrap(
                                  spacing: 15.0,
                                  runSpacing: 15.0,
                                  alignment: WrapAlignment.start,
                                  children: <Widget>[
                                    for (ModelPhoto i in c.watch<PhotoNotifier>().modelPhoto) ...[
                                      blockPhoto(
                                          modelPhoto: i,
                                          onPressed: () => Navigator.push(
                                              context, MaterialPageRoute(builder: (BuildContext c) => PhotoScreen(modelPhoto: i))),
                                          c: c)
                                    ]
                                  ],
                                ),
                              )))
                  : Center(
                      child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: bLoad(radius: 15),
                    )))
        ],
      ),
    );
  }
}
