import '../../../../../shared/shared.dart';
import '../../../../../shared/widgets/common_back_button.dart';

class BattlegroundScreen extends StatelessWidget {
  const BattlegroundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background_home.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Column(
            children: [
              appBarRow(context),
            ],
          ).paddingSymmetric(horizontal: 20.w)
        ],
      ),
    );
  }

  Padding appBarRow(BuildContext context) {
    return Row(
      children: [
        CommonBackButton(onTap: () {
          Navigator.pop(context);
        }),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: TextView(
            text: Strings.selectStocks,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            GestureDetector(
                onTap: () {},
                child: Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: AppColors.gradientOne,
                  ),
                  child: Icon(
                    Icons.newspaper,
                    color: AppColors.white,
                    size: 20.sp,
                  ),
                )),
            SizedBox(
              width: 10.w,
            ),
            GestureDetector(
                onTap: () {},
                child: Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.gradientOne,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.white,
                            blurRadius: 0.0,
                            spreadRadius: 0.0)
                      ],
                      border: Border.all(color: AppColors.white)),
                  child: Icon(
                    Icons.question_mark,
                    color: AppColors.white,
                    size: 20.sp,
                  ),
                )),
          ],
        ),
      ],
    ).paddingTop(40.h);
  }
}
