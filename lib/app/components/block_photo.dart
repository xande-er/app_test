import 'package:app_test/model/model_photo/model_photo.dart';
import 'package:app_test/ui/text/read_text.dart';
import 'package:app_test/vars/helper.dart';
import 'package:flutter/material.dart';

import '../../ui/buttons/b_transparent_scalable_button.dart';

Widget blockPhoto({required ModelPhoto modelPhoto, required Function() onPressed, required BuildContext c}) => Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: BTransparentScalableButton(
        onPressed:  onPressed,
        scale: ScaleFormat.small,
        child: Container(
          width: MediaQuery.of(c).size.width / 2 - 30,
          height: MediaQuery.of(c).size.width / 2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(color: const Color(0xff000000).withOpacity(.1), spreadRadius: 0, blurRadius: 4, offset: const Offset(0, 4)),
            ],
          ),
          child: Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(c).size.width / 2 - 60,
                  width: MediaQuery.of(c).size.width / 2 - 30,
                  child:
                      ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.network(modelPhoto.urlsSmall!, fit: BoxFit.cover))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: readText(
                    text: c.l.author + ': ' + (modelPhoto.firstName ?? '') + ' ' + (modelPhoto.lastName ?? ''), color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
