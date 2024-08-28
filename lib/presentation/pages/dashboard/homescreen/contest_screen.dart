import 'package:stoxplay/shared/widgets/common_background.dart';
import 'package:stoxplay/shared/widgets/dashboard_background.dart';

import '../../../../shared/shared.dart';

class ContestScreen extends StatelessWidget {
  const ContestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return SafeArea(
      top: false,
      child: DashboardBackGround(
        child: Scaffold(
          backgroundColor: AppColors.transparentColor,
          // appBar: AppBar(
          //   backgroundColor: AppColors.gradientOne,
          //   toolbarHeight: 100.h,
          //   title: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Image.asset(
          //         'assets/images/app_icon.png',
          //         width: 25.w,
          //         height: 25.h,
          //       ),
          //       SizedBox(
          //         width: 10.w,
          //       ),
          //       TextView(
          //         text: Strings.stoxplay,
          //         fontSize: 20.sp,
          //       )
          //     ],
          //   ),
          //   centerTitle: true,
          //   leading: GestureDetector(
          //     onTap: () {
          //       Navigator.pop(context);
          //     },
          //     child: Container(
          //       decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           color: AppColors.gradientOne,
          //           boxShadow: [
          //             BoxShadow(
          //                 color: AppColors.white,
          //                 blurRadius: 3.0,
          //                 spreadRadius: 3.0)
          //           ],
          //           border: Border.all(color: AppColors.white)),
          //       child: Icon(
          //         Icons.arrow_back_ios_new,
          //         color: AppColors.white,
          //         size: 15.sp,
          //       ),
          //     ).paddingLeft(20.w),
          //   ),
          //   actions: [
          //     Container(
          //             decoration: BoxDecoration(
          //                 border: Border.all(
          //                   color: AppColors.white,
          //                 ),
          //                 boxShadow: [
          //                   BoxShadow(
          //                       color: AppColors.white,
          //                       blurRadius: 3.0,
          //                       spreadRadius: 3.0)
          //                 ],
          //                 borderRadius: BorderRadius.circular(15.r),
          //                 color: AppColors.gradientOne),
          //             child: Row(
          //               children: [
          //                 Icon(
          //                   Icons.account_balance_wallet,
          //                   color: AppColors.gradientTwo,
          //                 ),
          //                 TextView(
          //                   text: '69',
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: 18.sp,
          //                 )
          //               ],
          //             ).paddingSymmetric(horizontal: 5.w, vertical: 5.h))
          //         .paddingRight(20.w),
          //   ],
          // ),
          body: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.gradientOne,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.white,
                                blurRadius: 3.0,
                                spreadRadius: 3.0)
                          ],
                          border: Border.all(color: AppColors.white)),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColors.white,
                        size: 20.sp,
                      ),
                    ),
                  )
                ],
              ).paddingTop(50.h),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      height: 75.h,
                      width: 75.w,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10.r)),
                    ),
                    TextView(
                      text: args['title'],
                      fontSize: 25.sp,
                    ).paddingTop(10.h)
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
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
                                          fontSize: 20.sp,
                                          fontColor: AppColors.black),
                                      Container(
                                        width: 75.w,
                                        height: 25.h,
                                        decoration: BoxDecoration(
                                            color: AppColors.lightButtonColor,
                                            borderRadius:
                                                BorderRadius.circular(10.r)),
                                        child: Center(
                                          child: TextView(
                                            text:
                                                "₹${args['contestPriceList'][index]["contestPrice"]}",
                                            fontColor: AppColors.black,
                                            fontWeight: FontWeight.bold,
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
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
