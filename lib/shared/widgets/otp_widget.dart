import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stoxplay/shared/shared.dart';
/// Widget for OTP field
class OtpWidget extends StatelessWidget {
  const OtpWidget({Key? key, required this.onchange, this.otpController, this.length, this.height, this.width, this.padding})
      : super(key: key);

  final TextEditingController? otpController;
  final void Function(String) onchange;
  final int? length;
  final double? height;
  final double? width;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: length ?? 4,
      autoFocus: false,
      obscureText: true,
      hapticFeedbackTypes:
      HapticFeedbackTypes.light /*HapticFeedbackTypes.vibrate*/,
      useHapticFeedback: true,
      autovalidateMode: AutovalidateMode.disabled,
      textStyle: const TextStyle(fontSize: 20, color: AppColors.black),
      validator: (value) {
        final RegExp regExp = RegExp(r'(?<!\d)\d{6}(?!\d)');
        if (value!.isEmpty) {
          return "Please enter otp";
        } else if (!regExp.hasMatch(otpController!.text)) {
          return "OTP not verified";
        }
        return null;
      },
      errorTextSpace: 25.h,
      mainAxisAlignment: MainAxisAlignment.center,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8),
        fieldHeight: height,
        fieldOuterPadding: EdgeInsets.symmetric(horizontal: padding ?? 8.w),
        fieldWidth: width ?? 48.w,
        borderWidth: 1,
        activeColor: AppColors.color666666,
        activeFillColor: AppColors.colorDFE0E1,
        selectedFillColor: AppColors.colorDFE0E1,
        disabledColor: AppColors.white,
        errorBorderColor: AppColors.color666666,
        selectedColor: AppColors.black /*AppColors.black.withOpacity(0.5)*/,
        inactiveFillColor: AppColors.colorDFE0E1,
        inactiveColor: AppColors.colorF9F9F9,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      // backgroundColor: AppColors.bgColorMain,
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      enablePinAutofill: true,
      showCursor: false,
      controller: otpController,
      onCompleted: (v) {},
      onChanged: onchange,
      beforeTextPaste: (text) {
        return true;
      },
      appContext: context,
    );
  }
}