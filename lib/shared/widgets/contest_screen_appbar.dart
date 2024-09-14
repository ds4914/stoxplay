import '../shared.dart';

class ContestScreenAppbar extends StatelessWidget {
  final Widget child;
  ContestScreenAppbar({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gradientOne,
        // gradient: LinearGradient(colors: [
        //   AppColors.gradientTwo,
        //   AppColors.gradientOne,
        // ]),
        border: Border.all(color: AppColors.color666666),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.r),
            bottomRight: Radius.circular(30.r)),
      ),
      child: child,
    );
  }
}
