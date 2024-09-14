import '../shared.dart';

class Termsandconditionwidget extends StatelessWidget {
  const Termsandconditionwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "By continuing, you agree to our ",
                  style: TextStyle(
                    fontFamily: 'Sofia Sans',
                    fontSize: 10.sp,
                    color: AppColors.grey,
                  )),
              TextSpan(
                  text: "terms & conditions",
                  style: TextStyle(fontFamily: 'Sofia Sans', fontSize: 10.sp)),
            ])),
        RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "and ",
                  style: TextStyle(
                    fontFamily: 'Sofia Sans',
                    fontSize: 11.sp,
                    color: AppColors.grey,
                  )),
              TextSpan(
                  text: "privacy policies.",
                  style: TextStyle(fontFamily: 'Sofia Sans', fontSize: 11.sp)),
            ])),
        TextView(
          fontSize: 10.sp,
          text: Strings.sambhavatTechnologies,
          fontColor: AppColors.grey,
        ),
      ],
    ).paddingBottom(10.h);
  }
}
