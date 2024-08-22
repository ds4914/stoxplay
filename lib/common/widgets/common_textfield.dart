import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stoxplay/common/app_colors.dart';
import 'package:stoxplay/common/extensions.dart';

///[CommonTextfield] is widget which is commonly used in app for showing textfield

class CommonTextfield extends StatelessWidget {
  const CommonTextfield(
      {Key? key,
      required this.controller,
      this.icon,
      required this.hintText,
      required this.onTap,
      required this.readOnly,
      this.keyboardType,
      this.horizontalPadding,
      this.maxlines = 1,
      this.height = 50,
      this.secondIcon,
      this.onIconTap,
      this.onSecondIconTap,
      this.obscureText = false,
      this.textInputAction,
      this.onSubmitted,
      this.maxLength,
      this.focusColor,
      this.enableInteractiveSelection,
      this.onChanged,
      this.textColor,
      this.inputFormatters})
      : super(key: key);
  final TextEditingController controller;
  final dynamic icon;
  final IconData? secondIcon;
  final String hintText;
  final bool? enableInteractiveSelection;
  final double? horizontalPadding;
  final VoidCallback onTap;
  final VoidCallback? onIconTap;
  final VoidCallback? onSecondIconTap;
  final bool readOnly;
  final TextInputType? keyboardType;
  final int? maxlines;
  final double? height;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final int? maxLength;
  final Color? focusColor;
  final Color? textColor;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.all(
      //     Radius.circular(15.r),
      //   ),
      //   color: AppColors.white,
      // ),
      height: maxlines != 1 ? null : height,
      child: TextField(cursorHeight: 15.h,
        inputFormatters: inputFormatters ?? [],
        style: TextStyle(color: textColor),
        textInputAction: textInputAction,
        readOnly: readOnly,
        enableInteractiveSelection: enableInteractiveSelection ?? true,
        maxLines: maxlines,
        maxLength: maxLength,
        obscureText: obscureText ?? false,
        keyboardType: keyboardType ?? TextInputType.text,
        onTap: onTap,
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        cursorColor: AppColors.white,
        controller: controller,
        decoration: InputDecoration(
            counterText: '',
            labelText: hintText,
            contentPadding: const EdgeInsets.only(
              bottom: 20,
              right: 5,
              left: 20,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: AppColors.grey,
            ),
            alignLabelWithHint: true,
            suffixIcon: icon != null
                ? SizedBox(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap: onIconTap,
                            child: icon is IconData ? Icon(icon,color: AppColors.white,) : icon).paddingRight(10.w),
                        SizedBox(
                          width: 5.w,
                        ),
                        secondIcon != null
                            ? GestureDetector(
                                onTap: onSecondIconTap,
                                child: Icon(secondIcon),
                              ).paddingRight(5.w)
                            : const SizedBox.shrink(),
                      ],
                    ),
                  )
                : null,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: focusColor == null
                    ? const BorderSide(color: AppColors.white)
                    : BorderSide(color: focusColor!)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: AppColors.grey)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(color: AppColors.grey))),
      ),
    );
  }
}
