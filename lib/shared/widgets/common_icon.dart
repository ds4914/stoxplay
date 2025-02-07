import '../shared.dart';

class CommonIcon extends StatelessWidget {
  final IconData? icon;
  final double? iconSize;
  final Color? shadowColor;
  CommonIcon({super.key, this.icon, this.iconSize, this.shadowColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 25.h,
        width: 25.w,
        decoration: BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: shadowColor ?? AppColors.blue,
                  spreadRadius: 1.0,
                  blurRadius: 1.0)
            ],
            border: Border.all(color: AppColors.blue)),
        child: Icon(
          icon,
          color: AppColors.blue,
          size: iconSize ?? 15.sp,
        ));
  }
}
