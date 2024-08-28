import 'package:stoxplay/shared/shared.dart';

class CommonTextfield extends StatelessWidget {
  const CommonTextfield(
      {Key? key,
        required this.controller,
        this.icon,
        required this.title,
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
        this.hintText,
        this.focusColor,
        this.enableInteractiveSelection,
        this.onChanged,
        this.prefixText,
        this.textColor,
        this.readOnly,
        this.onTap,
        this.inputFormatters})
      : super(key: key);

  final TextEditingController controller;
  final dynamic icon;
  final IconData? secondIcon;
  final String title;
  final String? hintText;
  final String? prefixText;
  final bool? enableInteractiveSelection;
  final double? horizontalPadding;
  final VoidCallback? onIconTap;
  final void Function()? onTap;
  final VoidCallback? onSecondIconTap;
  final TextInputType? keyboardType;
  final int? maxlines;
  final double? height;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final int? maxLength;
  final bool? readOnly ;
  final Color? focusColor;
  final Color? textColor;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: title,
          fontColor: AppColors.white,
        ),
        SizedBox(height: 5.h),
        Container(
          height: 45.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            color: AppColors.white,
          ),
          child: TextField(
            onTap: onTap,
            cursorColor: AppColors.colorPrimary,
            controller: controller,
            readOnly: readOnly??false,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: keyboardType,
            cursorHeight: 15.h,
            maxLength: maxLength,
            decoration: InputDecoration(
              counterText: '',
              contentPadding: EdgeInsets.only(left: 20.w, right: 30.w, top: 40.h, bottom: 13.h),
              hintText: hintText ?? title,
              prefixText: prefixText,
              alignLabelWithHint: true,
              prefixStyle: TextStyle(color: AppColors.black, fontSize: 16.sp),
              suffixIcon: Icon(secondIcon, color: AppColors.lightTextColor),
              hintStyle: TextStyle(color: AppColors.lightTextColor),
              border: InputBorder.none
            ),
          ),
        ),
      ],
    );
  }
}
