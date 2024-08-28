import '../shared.dart';

class GradientContainer extends StatelessWidget {
  final Widget? child;
  final double? height;
  const GradientContainer({super.key,this.height,required this.child});

  @override
  Widget build(BuildContext context) {
    return    Container(
      height:height?? MediaQuery.of(context).size.height/2.7.h,
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: AppColors.lightGrey),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.gradientOne,
                AppColors.gradientTwo,
              ])),
      child: child!.paddingSymmetric(horizontal: 20.w),
    );
  }
}
