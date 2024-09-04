import 'dart:async';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../shared/shared.dart';
import '../../../shared/widgets/common_background.dart';
import '../../../shared/widgets/otp_widget.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  Timer? _timer;
  int _start = 60;

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _timer!.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonBackground(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Column(
              children: [
                TextView(
                  text: Strings.verification,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
                TextView(
                  text: Strings.weHaveSentACodeToYourNumber,
                  fontSize: 13.sp,
                  fontColor: AppColors.grey,
                ),
                TextView(
                  text: Strings.dummyMobileNumber,
                  fontSize: 13.sp,
                  fontColor: AppColors.grey,
                ),
                SizedBox(
                  height: 10.h,
                ),
                GradientContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(text: Strings.code),
                          TextView(
                              text:
                                  '${Strings.resendIn}${_start.toString()} sec'),
                        ],
                      ).paddingRight(10.w),
                      OtpWidget(length: 4, onchange: (String ) {  },),
                      SizedBox(
                        height: 10.h,
                      ),
                      CommonButton(
                        title: Strings.verify,
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context,
                              RouteList.createYourProfileScreen,
                              (route) => false);
                        },
                      )
                    ],
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 10.w),
            Column(
              children: [
                TextView(
                  fontSize: 10.sp,
                  text: Strings.termsAndConditions,
                  fontColor: AppColors.grey,
                ).paddingSymmetric(horizontal: 30.w),
                TextView(
                  fontSize: 10.sp,
                  text: Strings.sambhavatTechnologies,
                  fontColor: AppColors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
