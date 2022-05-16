import 'package:app_test/ui/text/read_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../ui/buttons/b_transparent_scalable_button.dart';

Widget topHeader({required BuildContext c, required String header, Function()? onPressedBack}) => Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 10),
      child: SafeArea(
        bottom: false,
        child: Row(children: [
          if (onPressedBack != null) ...[
            BTransparentScalableButton(
                onPressed: onPressedBack,
                scale: ScaleFormat.big,
                child: SvgPicture.asset('picture/components/cancel.svg', width: 25, color: Colors.black))
          ],
          Expanded(
            child: Center(
                child: readText(
                    text: header, color: Colors.black, fontWeight: FontWeight.w600, size: 22, padding: const EdgeInsets.only(left: 5))),
          ),
          if (onPressedBack != null) ...[const SizedBox(width: 30)]
         ]),
      ),
    );
