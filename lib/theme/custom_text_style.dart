import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyMediumInterBlack900 =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: appTheme.black900.withOpacity(0.5),
        fontSize: 14.fSize,
      );
  static get bodyMediumInterBlack90014 =>
      theme.textTheme.bodyMedium!.inter.copyWith(
        color: appTheme.black900.withOpacity(0.7),
        fontSize: 14.fSize,
      );
  static get bodyMediumff757575 => theme.textTheme.bodyMedium!.copyWith(
        color: Color(0XFF757575),
      );
  // Label text style
  static get labelLargeff757575 => theme.textTheme.labelLarge!.copyWith(
        color: Color(0XFF757575),
      );
  // Title text style
  static get titleLargeRalewayBlack900 =>
      theme.textTheme.titleLarge!.raleway.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w600,
      );
  static get titleLargeWhiteA700 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 22.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumRalewayBlueA700 =>
      theme.textTheme.titleMedium!.raleway.copyWith(
        color: appTheme.blueA700,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumSFProTextBlack900 =>
      theme.textTheme.titleMedium!.sFProText.copyWith(
        color: appTheme.black900,
        fontSize: 17.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get sFProText {
    return copyWith(
      fontFamily: 'SF Pro Text',
    );
  }

  TextStyle get raleway {
    return copyWith(
      fontFamily: 'Raleway',
    );
  }
}
