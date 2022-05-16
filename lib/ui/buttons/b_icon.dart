import 'package:app_test/ui/buttons/b_transparent_scalable_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget bIcon(
        {required String icon,
        required Color colorFount,
        Color colorIcon = Colors.black,
        double circular = 10,
        double size = 50,
        required Function() onPressed,
        EdgeInsetsGeometry padding = const EdgeInsets.all(10.0)}) =>
    BTransparentScalableButton(
      onPressed: onPressed,
      scale: ScaleFormat.big,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(circular), color: colorFount),
        child: Padding(
          padding: padding,
          child: SvgPicture.asset(
            icon,
            color: colorIcon,
          ),
        ),
      ),
    );
