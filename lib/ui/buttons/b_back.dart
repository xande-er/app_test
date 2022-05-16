import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'b_transparent_scalable_button.dart';

Widget bBack({required BuildContext c, Color color = Colors.black}) => SizedBox(
      width: 50,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: BTransparentScalableButton(
          onPressed: () => Navigator.pop(c),
          scale: ScaleFormat.big,
          child: Row(
            children: [
              SvgPicture.asset('picture/components/back.svg', height: 30, color: color),
            ],
          ),
        ),
      ),
    );
