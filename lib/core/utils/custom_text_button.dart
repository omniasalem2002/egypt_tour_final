import 'package:flutter/material.dart';
import 'package:guru/core/utils/colors_app.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHight;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  final double? width;

  const AppTextButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonWidth,
    this.buttonHight,
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                borderRadius ?? 16,
              ),
            ),
          ),
          backgroundColor: MaterialStatePropertyAll(
            backgroundColor ?? ColorsApp.moreLightGrey,
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 12,
              vertical: verticalPadding?? 14,
            ),
          ),
          fixedSize: MaterialStateProperty.all(
            Size(buttonWidth ?? double.maxFinite, buttonHight ?? 50),
          ),
          // minimumSize: MaterialStateProperty.all(const Size(200.0, 48.0)),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: textStyle,
        ),
      ),
    );
  }
}
