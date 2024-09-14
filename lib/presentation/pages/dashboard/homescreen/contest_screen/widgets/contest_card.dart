import '../../../../../../shared/shared.dart';

class ContestCard extends StatelessWidget {
  Map<String, dynamic> args;
  int index;
  ContestCard({super.key,required this.index,required this.args});

  @override
  Widget build(BuildContext context) {
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                        text:
                        "₹${args['contestPriceList'][index]["prizePool"]}",
                        fontSize: 18.sp,
                        fontColor: AppColors.black),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteList.stockSelectionScreen,
                            arguments: args);
                      },
                      child: Container(
                        width: 75.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                            color: AppColors.colorE46EFF.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(8.r)),
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
                  color: AppColors.colorE46EFF.withOpacity(0.6),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ).paddingSymmetric(horizontal: 14.w, vertical: 5.h),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.colorD7D7D7,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.r),
                      bottomRight: Radius.circular(15.r))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
  }
}
