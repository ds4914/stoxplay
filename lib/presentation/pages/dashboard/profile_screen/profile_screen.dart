import 'package:stoxplay/shared/widgets/common_back_button.dart';
import 'package:stoxplay/shared/widgets/dashboard_background.dart';

import '../../../../shared/shared.dart';
import '../../../../shared/widgets/home_screen_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardBackGround(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.transparentColor,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(80.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CommonBackButton(onTap: () {}),
                      SizedBox(
                        width: 20.w,
                      ),
                      TextView(
                        text: Strings.userProfile,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  Badge(
                    backgroundColor: AppColors.gradientTwo,
                    alignment: Alignment.topLeft,
                    smallSize: 10,
                    child: Icon(
                      Icons.notifications_none,
                      color: AppColors.white,
                      size: 30.sp,
                    ),
                  )
                ],
              ).paddingSymmetric(horizontal: 20.w, vertical: 10.h)),
          body: Column(
            children: [
              SizedBox(height: 20.h,),
              Container(
                height: 100.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(color: AppColors.lightGrey)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextView(
                          text: Strings.stoxplay,
                          fontSize: 18.sp,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextView(
                          text: "+91 XXXXX XXXXX",
                          fontColor: AppColors.grey,
                          fontSize: 12.sp,
                        ),
                        TextView(
                            text: "stoxplay@gmail.com",
                            fontColor: AppColors.grey,
                            fontSize: 12.sp),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                            height: 60.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.white, width: 5.0),
                                shape: BoxShape.circle),
                            child: CircleAvatar(radius: 30.r,
                                backgroundColor: AppColors.gradientOne,
                                child:
                                    Image.asset("assets/images/app_icon.png")
                                        .paddingSymmetric(vertical: 10.h,horizontal: 10.w))),
                        Positioned(
                            bottom: 0.0,
                            right: 0.0,
                            child: CircleAvatar(
                                radius: 10.r,
                                backgroundColor: AppColors.gradientTwo,
                                child: Icon(
                                  Icons.qr_code_2,
                                  size: 15.sp,
                                )))
                      ],
                    )
                  ],
                ).paddingSymmetric(horizontal: 40.w),
              )
            ],
          ).paddingSymmetric(horizontal: 20.w),
        ),
      ),
    );
  }
}
