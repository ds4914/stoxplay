import 'package:stoxplay/presentation/pages/dashboard/homescreen/contest_screen/widgets/contest_card.dart';
import 'package:stoxplay/shared/widgets/common_back_button.dart';
import 'package:stoxplay/shared/widgets/common_background.dart';
import 'package:stoxplay/shared/widgets/contest_screen_appbar.dart';
import 'package:stoxplay/shared/widgets/dashboard_background.dart';
import 'package:stoxplay/shared/widgets/wallet_container.dart';

import '../../../../../shared/shared.dart';

class ContestScreen extends StatelessWidget {
  const ContestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    Widget listView() {
      return Expanded(
        child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => SizedBox(
                  height: 10.h,
                ),
            itemCount: args['contestPriceList'].length,
            itemBuilder: (context, index) {
              return ContestCard(index: index, args: args);
            }).paddingBottom(20.h),
      );
    }

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColors.gradientOne,
        body: Column(
          children: [
            ContestScreenAppbar(
              child: Row(
                children: [
                  CommonBackButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: TextView(
                      text: Strings.indianStockMarketChampionship,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  WalletContainer(),
                ],
              )
                  .paddingTop(40.h)
                  .paddingBottom(20.h)
                  .paddingSymmetric(horizontal: 20.w),
            ),
            Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Image.asset(
                  args['image'],
                  height: 120.h,
                  width: 120.w,
                ),
                TextView(
                  text: args['title'],
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  fontColor: AppColors.colorE3E5E6,
                )
              ],
            ),
            listView()
          ],
        ),
      ),
    );
  }
}
