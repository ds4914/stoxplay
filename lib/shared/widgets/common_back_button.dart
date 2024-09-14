import '../shared.dart';

class CommonBackButton extends StatelessWidget {
  final void Function()? onTap;
  CommonBackButton({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.gradientOne,
            border: Border.all(color: AppColors.white)),
        child: Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.white,
          size: 15.sp,
        ),
      ),
    );
  }
}
