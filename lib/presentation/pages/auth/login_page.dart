import 'package:stoxplay/shared/widgets/common_background.dart';
import '../../../shared/shared.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController mobileNumberController = TextEditingController();
  bool checkValue = false;
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100.h,
                ),
                TextView(
                  text: Strings.login,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
                TextView(
                  text: Strings.weWillSendYouOTP,
                  fontSize: 13.sp,
                  fontColor: AppColors.grey,
                ),
                SizedBox(
                  height: 10.h,
                ),
                GradientContainer(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      CommonTextfield(
                        controller: mobileNumberController,
                        title: Strings.mobileNumber,
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                      ),
                      CheckboxListTile(
                        visualDensity:
                            VisualDensity(horizontal: -4.0, vertical: -4.0),
                        value: checkValue,
                        onChanged: (value) {
                          setState(() {
                            checkValue = !checkValue;
                          });
                        },
                        contentPadding: EdgeInsets.zero,
                        fillColor: MaterialStateColor.resolveWith(
                          (states) {
                            if (states.contains(MaterialState.selected)) {
                              return AppColors
                                  .colorPrimary; // the color when checkbox is selected;
                            }
                            return AppColors
                                .white; //the color when checkbox is unselected;
                          },
                        ),
                        title: Align(
                          alignment: Alignment.centerLeft,
                          child: TextView(
                            text: Strings.iCertifyThatIAmAbove18Years,
                            fontSize: 10.sp,
                          ),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CommonButton(
                        title: Strings.verify,
                        onTap: () {
                          checkValue
                              ? Navigator.pushNamedAndRemoveUntil(context,
                                  RouteList.otpScreen, (route) => false)
                              : showSnackBar(
                                  context: context,
                                  message:
                                      Strings.pleaseCheckTermsAndConditions);
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextView(
                  text: Strings.haveAnInviteCode,
                  fontColor: AppColors.grey,
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
            Column(
              children: [
                TextView(
                  fontSize: 10.sp,
                  text: Strings.termsAndConditions,
                  fontColor: AppColors.grey,textAlign: TextAlign.center,
                ),
                TextView(
                  fontSize: 10.sp,
                  text: Strings.sambhavatTechnologies,
                  fontColor: AppColors.grey,
                ),
              ],
            ).paddingSymmetric(horizontal: 50.w),
          ],
        ).paddingSymmetric(horizontal: 20.w),
      ),
    );
  }
}
