import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stoxplay/common/extensions.dart';
import 'package:stoxplay/common/text_view.dart';
import 'package:stoxplay/common/widgets/common_textfield.dart';
import 'package:stoxplay/main.dart';

import '../../common/app_colors.dart';
import '../../common/strings.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Stack(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/background.png',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
                Image.asset(
                  'assets/bars.png',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ).paddingTop(30.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/app_icon.png',
                          height: 50.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        TextView(
                            text: Strings.stoxplay,
                            fontColor: AppColors.white,
                            fontSize: 25.sp)
                      ],
                    ),
                    SizedBox(
                      height: 80.h,
                    ),
                    TextView(
                      text: Strings.login,
                      fontColor: AppColors.white,
                      fontSize: 20.sp,
                    ),
                    TextView(
                        text: Strings.pleaseSignInToExistingAccount,
                        fontSize: 12.sp,
                        fontColor: AppColors.grey),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 300.h,
              right: 0.w,
              left: 0.w,
              child: Stack(
                children: [
                  Image.asset('assets/bottomsheet_bg.png'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CommonTextfield(
                          controller: emailController,
                          hintText: Strings.email,
                          onTap: () {},
                          readOnly: false),
                      SizedBox(
                        height: 20.h,
                      ),
                      CommonTextfield(
                          controller: passwordController,
                          hintText: Strings.password,icon: Icons.remove_red_eye,
                          onTap: () {},
                          readOnly: false),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (value) {},
                                side: BorderSide(color: AppColors.white),
                              ),
                              TextView(
                                text: Strings.rememberMe,
                                fontColor: AppColors.white,
                                fontSize: 12.sp,
                              )
                            ],
                          ),
                          TextView(
                            text: Strings.forgotPassword,
                            fontColor: AppColors.white,
                            fontSize: 12.sp,
                          )
                        ],
                      ),
                      Container(
                        height: 40.h,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              AppColors.colorPrimary,
                              AppColors.colorSecondary,
                              // AppColors.white
                            ]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r))),
                        child: Center(
                          child: TextView(
                            text: Strings.login,
                            fontColor: AppColors.white,
                          ),
                        ),
                      ).paddingTop(10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(
                            text: Strings.dontHaveAnAccount,
                            fontColor: AppColors.white,
                            fontSize: 12.sp,
                          ),
                          TextView(
                            text: Strings.signUp,
                            fontColor: AppColors.white,
                            fontSize: 12.sp,
                          )
                        ],
                      ).paddingTop(20.h),
                    ],
                  ).paddingSymmetric(horizontal: 20.w, vertical: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
