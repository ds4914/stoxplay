import 'package:stoxplay/shared/widgets/common_back_button.dart';
import 'package:stoxplay/shared/widgets/common_background.dart';
import 'package:stoxplay/shared/widgets/contest_screen_appbar.dart';
import 'package:stoxplay/shared/widgets/dashboard_background.dart';
import 'package:stoxplay/shared/widgets/wallet_container.dart';

import '../../../../shared/shared.dart';

class ContestScreen extends StatelessWidget {
  const ContestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    Widget listView(){
      return  Expanded(
        child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context,index)=>SizedBox(height: 20.h,),
            itemCount: args['contestPriceList'].length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3.0,
                color: AppColors.white,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(color: AppColors.color999999)),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(
                                text: 'Prize Pool',
                                fontSize: 14.sp,
                                fontColor: AppColors.black,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                      'assets/images/exchange_icon.png'),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  TextView(
                                    text: 'Flexible',
                                    fontColor: AppColors.color666666,
                                    fontSize: 12.sp,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(
                                  text:
                                  "₹${args['contestPriceList'][index]["prizePool"]}",
                                  fontSize: 18.sp,
                                  fontColor: AppColors.black),
                              GestureDetector(onTap: (){
                                Navigator.pushNamed(context, RouteList.stockSelectionScreen,arguments: args);
                              },
                                child: Container(
                                  width: 75.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.lightButtonColor,
                                      borderRadius:
                                      BorderRadius.circular(8.r)),
                                  child: Center(
                                    child: TextView(
                                      text:
                                      "₹${args['contestPriceList'][index]["contestPrice"]}",
                                      fontColor: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Divider(
                            thickness: 5.0,
                            color: AppColors.lightButtonColor,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(
                                text: "10,000 spots left",
                                fontColor: AppColors.black,
                                fontSize: 10.sp,
                              ),
                              TextView(
                                text:
                                "${args['contestPriceList'][index]['spots']} spots",
                                fontColor: AppColors.black,
                                fontSize: 10.sp,
                              )
                            ],
                          ),
                        ],
                      ).paddingSymmetric(
                          horizontal: 14.w, vertical: 5.h),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.colorD7D7D7,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15.r),
                                bottomRight: Radius.circular(15.r))),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/medal_icon.png',
                                      color: AppColors.color666666,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    TextView(
                                      text: "50k",
                                      fontColor: AppColors.color666666,
                                      fontSize: 12.sp,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/cup_icon.png',
                                      color: AppColors.color666666,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    TextView(
                                      text: "55%",
                                      fontColor: AppColors.color666666,
                                      fontSize: 12.sp,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/m_icon.png',
                                      color: AppColors.color666666,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    TextView(
                                      text: "10",
                                      fontColor: AppColors.color666666,
                                      fontSize: 12.sp,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            TextView(
                              text: "Start @9:00am",
                              fontColor: AppColors.color666666,
                              fontSize: 12.sp,
                            )
                          ],
                        ).paddingSymmetric(horizontal: 14.w),
                      )
                    ],
                  ),
                ).paddingSymmetric(horizontal: 5.w, vertical: 5.h),
              ).paddingSymmetric(horizontal: 14.w);
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
                  SizedBox(width: 10.w,),
                  Expanded(
                    child: TextView(
                      text: Strings.indianStockMarketChampionship,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  WalletContainer(),
                ],
              ).paddingTop(40.h).paddingBottom(20.h).paddingSymmetric(horizontal: 20.w),
            ),
            Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Image.asset(args['image']),
                TextView(
                  text: args['title'],
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
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
