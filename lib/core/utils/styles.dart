import 'package:flutter/material.dart';
import 'package:guru/core/utils/font_weight_helper.dart';
import 'package:guru/core/utils/responsive_font_size.dart';

import 'colors_app.dart';

abstract class Styles {
  static TextStyle font13GreyRegular(context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: getResponsiveFontSize(context, fontSize: 13),
    fontWeight: FontWeightHelper.regular,
    color: ColorsApp.grey,
  );

  static TextStyle font13BlueRegular(context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: getResponsiveFontSize(context, fontSize: 13),
    fontWeight: FontWeightHelper.regular,
    color: ColorsApp.primaryColor,
  );

  static TextStyle font10BlueSemiBold(context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: getResponsiveFontSize(context, fontSize: 10),
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsApp.primaryColor,
  );

  static TextStyle font13LightGreyRegular(context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: getResponsiveFontSize(context, fontSize: 13),
    fontWeight: FontWeightHelper.regular,
    color: ColorsApp.moreLightGrey,
  );

  static TextStyle font13BlueSemiBold(context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: getResponsiveFontSize(context, fontSize: 13),
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsApp.primaryColor,
  );

  static TextStyle font13GreyMedium(context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: getResponsiveFontSize(context, fontSize: 13),
    fontWeight: FontWeightHelper.medium,
    color: ColorsApp.grey,
  );

  static TextStyle font17GreyRegular(context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: getResponsiveFontSize(context, fontSize: 17),
    fontWeight: FontWeightHelper.regular,
    color: ColorsApp.blackColor,
  );

  static TextStyle font14LightGreyRegular(context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: getResponsiveFontSize(context, fontSize: 14),
    fontWeight: FontWeightHelper.regular,
    color: ColorsApp.whiteColor,
  );

  static TextStyle font14DarkBlueMedium(context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: getResponsiveFontSize(context, fontSize: 14),
    fontWeight: FontWeightHelper.medium,
    color: ColorsApp.semiPrimaryColor,
  );

  static TextStyle font14BlueSemiBold(context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: getResponsiveFontSize(context, fontSize: 14),
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsApp.darkPrimary,
  );

  static TextStyle font15DarkBlueMedium(context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: getResponsiveFontSize(context, fontSize: 15),
    fontWeight: FontWeightHelper.medium,
    color: ColorsApp.semiPrimaryColor,
  );

  static TextStyle font26LightGreyMedium(context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: getResponsiveFontSize(context, fontSize: 26),
    fontWeight: FontWeightHelper.medium,
    color: ColorsApp.blackColor,
  );

  static TextStyle font24BlackBold(context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: getResponsiveFontSize(context, fontSize: 24),
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );

  static TextStyle font24LightGreyBold(context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: getResponsiveFontSize(context, fontSize: 24),
    fontWeight: FontWeightHelper.bold,
    color: ColorsApp.grey,
  );

  static TextStyle font18LightGreyBold(context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: getResponsiveFontSize(context, fontSize: 18),
    fontWeight: FontWeightHelper.bold,
    color: ColorsApp.blackColor,
  );

  static TextStyle font24DarkBlueBold(context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: getResponsiveFontSize(context, fontSize: 24),
    fontWeight: FontWeightHelper.bold,
    color: ColorsApp.primaryColor,
  );

  static TextStyle font18DarkBlueBold(context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: getResponsiveFontSize(context, fontSize: 18),
    fontWeight: FontWeightHelper.bold,
    color: ColorsApp.primaryColor,
  );

  static TextStyle font32LightGreyBold(context) => TextStyle(
    fontFamily: 'Montserrat',
    fontSize: getResponsiveFontSize(context, fontSize: 32),
    fontWeight: FontWeightHelper.bold,
    color: ColorsApp.semiPrimaryColor,
  );
}
