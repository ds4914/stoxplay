import '../shared.dart';

class WalletContainer extends StatelessWidget {
  final String? title;
  WalletContainer({super.key,this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.white,
            ),
            boxShadow: [
              BoxShadow(
                  color: AppColors.white,
                  blurRadius: 3.0,
                  spreadRadius: 3.0)
            ],
            borderRadius: BorderRadius.circular(15.r),
            color: AppColors.gradientOne),
        child: Row(
          children: [
            Icon(
              Icons.account_balance_wallet,
              color: AppColors.gradientTwo,
            ),
            TextView(
              text: title?? '69',
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            )
          ],
        ).paddingSymmetric(horizontal: 5.w, vertical: 5.h));
  }
}
