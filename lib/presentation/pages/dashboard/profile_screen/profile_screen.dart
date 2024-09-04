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
                        text: "User Profile",
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
        ),
      ),
    );
  }
}
