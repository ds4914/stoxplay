import '../shared.dart';

class HomeScreenAppbar extends StatelessWidget {
  const HomeScreenAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.transparentColor,
      leading: CircleAvatar(
        child: Image.asset(
          'assets/images/app_icon.png',
        ).paddingSymmetric(horizontal: 5.w),
      ).paddingTop(15.h).paddingLeft(10.w),
      actions: [
        Icon(
          Icons.notifications_active_outlined,
          color: AppColors.white,
          size: 30.sp,
        ).paddingSymmetric(horizontal: 10.w).paddingTop(20.h)
      ],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/app_icon.png',
            width: 25.w,
            height: 25.h,
          ),
          SizedBox(
            width: 10.w,
          ),
          TextView(
            text: Strings.stoxplay,
            fontSize: 20.sp,
          )
        ],
      ).paddingTop(20.h),
    );
  }
}
