
import 'package:flutter/material.dart';

import '../shared.dart';

class CommonReverseButton extends StatelessWidget {
  final String? title;
  void Function()? onTap;
  CommonReverseButton({super.key, required this.title,required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.colorPrimary),
            borderRadius: BorderRadius.all(Radius.circular(15.r))),
        child: Center(child: TextView(text: title ?? '',fontColor: AppColors.black,)),
      ),
    );
  }
}
