import '../shared.dart';

class CommonButton extends StatelessWidget {
  final String? title;
  void Function()? onTap;
  final double? height;
  final double? width;
  final double? borderRadius;
  CommonButton({super.key,this.borderRadius,this.height,this.width, required this.title,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height?? 45.h,
        width: width?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.white),
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  AppColors.colorPrimary,
                  AppColors.colorSecondary,
                ]),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius??15.r))),
        child: Center(child: TextView(text: title ?? '')),
      ),
    );
  }
}
