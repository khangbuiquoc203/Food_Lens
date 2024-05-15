import 'package:flutter/material.dart';
import '../core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillGreenA => BoxDecoration(
        color: appTheme.greenA40014,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray300,
      );
  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );

// Outline decorations

  static BoxDecoration get outlineBlackF => BoxDecoration(
          color: appTheme.gray3009b,
          boxShadow: [
            BoxShadow(
              color: appTheme.black9003f,
              spreadRadius: 2.h,
              blurRadius: 2.h,
              offset: Offset(
                0,
                4,
              ),
            )
          ],
        );

  static BoxDecoration get outlineBlueGray => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.blueGray400,
          width: 1.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.05),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          )
        ],
      );

  static BoxDecoration get outlineBlack => BoxDecoration(
        color: appTheme.gray3009b,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          )
        ],
      );
  static BoxDecoration get outlineBlack900 => BoxDecoration();
  static BoxDecoration get outlineBlack9001 => BoxDecoration();
  static BoxDecoration get outlineBlack9002 => BoxDecoration();
  static BoxDecoration get outlineBlack9003 => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              2,
            ),
          )
        ],
      );

  static BoxDecoration get outlineBlack9999 => BoxDecoration(
        color: appTheme.lightBlueA400,
        border: Border.all(
          color: appTheme.black900.withOpacity(0.5),
          width: 1.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          )
        ],
      );

  // Fill decorations
  static BoxDecoration get fillBlack => BoxDecoration(
        color: appTheme.black900,
      );
}

class BorderRadiusStyle {
  // Custom borders
  static BorderRadius get customBorderTL20 => BorderRadius.horizontal(
        left: Radius.circular(20.h),
      );
// Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.h,
      );
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );
  static BorderRadius get roundedBorder30 => BorderRadius.circular(
        30.h,
      );
  static BorderRadius get roundedBorder37 => BorderRadius.circular(
        37.h,
      );
  // Circle borders
  static BorderRadius get circleBorder15 => BorderRadius.circular(
        15.h,
      );
}
