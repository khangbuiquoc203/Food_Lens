import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get roundedMplus1cBold {
    return copyWith(
      fontFamily: 'Rounded Mplus 1c Bold',
    );
  }

  TextStyle get roundedMplus1c {
    return copyWith(
      fontFamily: 'Rounded Mplus 1c',
    );
  }
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Headline text style
  static get headlineLargeGreen900 => theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.green900,
      );
  static get headlineSmallGray800 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.gray800,
        fontWeight: FontWeight.w600,
      );
// Label text style
  static get labelLargeCyan400 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.cyan400,
      );
  static get labelLargeCyan400_1 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.cyan400,
      );
  static get labelLargeInterWhiteA700 =>
      theme.textTheme.labelLarge!.inter.copyWith(
        color: appTheme.whiteA700,
        fontSize: 13.fSize,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeRoundedMplus1cBold =>
      theme.textTheme.labelLarge!.roundedMplus1cBold.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get labelLargeRoundedMplus1cBoldBold =>
      theme.textTheme.labelLarge!.roundedMplus1cBold.copyWith(
        fontWeight: FontWeight.w700,
      );
// Title text style
  static get titleLargeInter => theme.textTheme.titleLarge!.inter.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleSmallInterWhiteA700 =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: appTheme.whiteA700,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleLargeBlack900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w600,
      );
  // Title text style
  static get titleMediumBluegray50 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray50,
      );

  // Body text style
  static get bodyMediumGray50001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray50001,
        fontSize: 13.fSize,
      );
  static get bodyMediumErrorContainer => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static get bodyMediumPrimaryContainer => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
      );
// Label text style

// Title text style
  static get titleSmallRoundedMplus1cBlack900 =>
      theme.textTheme.titleSmall!.roundedMplus1c.copyWith(
        color: appTheme.black900,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w800,
      );
  static get titleSmallRoundedMplus1cBlack900Medium =>
      theme.textTheme.titleSmall!.roundedMplus1c.copyWith(
        color: appTheme.black900,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
      );

  static get labelLargeGray300 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray300,
      );
  static get labelLargeGray300_1 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray300,
      );
  static get labelLargeGray500 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray500,
      );
}
