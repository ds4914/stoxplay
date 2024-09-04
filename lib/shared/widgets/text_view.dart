import 'package:flutter/material.dart';
import 'package:stoxplay/shared/constants/app_colors.dart';

class TextView extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  const TextView({
    super.key,
    required this.text,
    this.overflow,
    this.fontWeight,
    this.textAlign,
    this.fontSize,
    this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign ?? TextAlign.left,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            overflow: overflow,
            color: fontColor ?? AppColors.white,
            fontFamily: 'Sofia Sans'));
  }
}
