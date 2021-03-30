import 'package:flutter/material.dart';
import 'package:quovantis_assignment/resources/strings.dart';

import 'app_colors.dart';

// ignore: avoid_classes_with_only_static_members
class TextStyles {
  static bool isSmallScreen = false;
  static bool isBigScreen = false;
  static const smallHeightParameterInPixels = 700;

  static void setScreenSize(bool isSmall) {
    isSmallScreen = isSmall;
    isBigScreen = !isSmall;
  }
}


const tsAppBlackRegular14 = TextStyle(
    fontWeight: interRegular,
    fontSize: 14,
    color: AppColors.appBlack,
    fontFamily: font_inter,
);


const tsAppBlackSemiBold24 = TextStyle(
    fontWeight: interSemiBold,
    fontSize: 24,
    color: AppColors.appBlack,
    fontFamily: font_inter,
);

const TextStyle tsMediumHeadingDarkGrey =
TextStyle(color: AppColors.darkGrey, fontSize: 18, fontWeight: interMedium);

const TextStyle tsMediumHintDarkGrey =
TextStyle(color: AppColors.darkGreyOpacity20, fontSize: 18, fontWeight: interMedium);

// Bold styles
const tsAppBlackBold18 = TextStyle(
    fontWeight: interBold,
    fontSize: 18,
    color: AppColors.appBlack,
    fontFamily: font_inter,
);

const tsWhiteBold18 = TextStyle(
    fontWeight: interBold,
    fontSize: 18,
    color: AppColors.white,
    fontFamily: font_inter,
);