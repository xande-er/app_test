import 'package:app_test/ui/text/read_text.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'b_transparent_scalable_button.dart';

Widget bStyle(
        {required String text,
        required double size,
        required BuildContext c,
        double? vertical,
        double? horizontal,
        double? circular,
        required Function() onPressed,
        bool active = true,
        bool shadow = false,
        String getFont = 'Raleway',
        String? icon,
        FontWeight fontWeight = FontWeight.w600,
        Color? colorButt,
        Color? colorText,
        double? width,
        UniqueKey? key,
        String? leftIcon,
        Color? colorIcon,
        String? rightIcon,
        double? widthIcon,
        Border? border}) =>
    BTransparentScalableButton(
      key: key,
      onPressed: !active ? () {} : onPressed,
      scale: active ? ScaleFormat.small : ScaleFormat.none,
      child: Neumorphic(
        style: NeumorphicStyle(
            shape: NeumorphicShape.concave,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(circular ?? 12)),
            depth: shadow ? 10 : 0,
            lightSource: LightSource.topRight,
            shadowDarkColor: shadow ? Colors.black87 : Colors.transparent,
            color: const Color(0xffD4E7FE)),
        child: Container(
            width: width ?? MediaQuery.of(c).size.width,
            decoration: BoxDecoration(
                color: colorButt ?? const Color(0xffFF7D5C), borderRadius: BorderRadius.circular(circular ?? 12), border: border
                // ),
                ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: vertical ?? 13),
              child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                if (leftIcon != null) ...[
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(leftIcon, width: 25, color: colorIcon),
                  )
                ],
                readText(
                    text: text,
                    color: colorText ?? const Color(0xffffffff),
                    size: size,
                    fontWeight: fontWeight,
                    getFont: getFont,
                    align: TextAlign.center),
                if (rightIcon != null) ...[
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SvgPicture.asset(rightIcon, width: widthIcon ?? 25, color: colorIcon),
                  )
                ]
              ]),
            )),
      ),
    );
