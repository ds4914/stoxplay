import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? fontColor;
  const TextView({super.key,required this.text,this.fontSize,this.fontColor,});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontSize: fontSize,color: fontColor,fontFamily: 'Sofia Sans'),);
  }
}
