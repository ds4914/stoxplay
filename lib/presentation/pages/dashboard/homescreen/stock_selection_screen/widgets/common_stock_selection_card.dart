import 'package:stoxplay/shared/widgets/common_icon_for_position.dart';

import '../../../../../../shared/shared.dart';
import '../../../../../../shared/widgets/common_icon.dart';
import '../blocs/stock_selection_bloc.dart';

class CommonStockSelectionCard extends StatelessWidget {
  final int index;
  final Map<String, dynamic> data;
  final int? leaderIndex;
  final int? coLeaderIndex;
  final int? viceLeaderIndex;
  final void Function()? onUpButtonTap;
  final void Function()? onTap;
  final void Function()? onDownButtonTap;
  final void Function()? onMoreTap;
  final void Function()? onLClick;
  final void Function()? onVLClick;
  final void Function()? onCLClick;
  List<int> upSelectedStock = [];
  List<bool> roleRowShow;
  List<int> downSelectedStock = [];
  CommonStockSelectionCard({
    super.key,
    required this.index,
    required this.data,
    required this.onLClick,
    required this.leaderIndex,
    required this.coLeaderIndex,
    required this.viceLeaderIndex,
    required this.onVLClick,
    required this.onCLClick,
    required this.onUpButtonTap,
    required this.roleRowShow,
    required this.onMoreTap,
    required this.onTap,
    required this.upSelectedStock,
    required this.downSelectedStock,
    required this.onDownButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Card(
            elevation: 3.0,
            child: Container(
              decoration: BoxDecoration(
                  color: upSelectedStock.contains(index)
                      ? AppColors.lightGreen
                      : downSelectedStock.contains(index)
                          ? AppColors.lightRed
                          : AppColors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                      color: upSelectedStock.contains(index)
                          ? AppColors.colorOnline
                          : downSelectedStock.contains(index)
                              ? AppColors.red
                              : AppColors.color999999)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Card(
                              elevation: 3.0,
                              child: Image.asset(
                                'assets/images/app_icon.png',
                                height: 40.h,
                                width: 40.w,
                              ).paddingSymmetric(
                                  horizontal: 5.w, vertical: 5.h))
                          .paddingSymmetric(horizontal: 10.w),
                      Row(
                        children: [
                          TextView(
                            text: "₹${data['stocks'][index]['stockPrice']}",
                            fontSize: 14.sp,
                            fontColor: AppColors.black,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          TextView(
                            text: "[${data['stocks'][index]['percentage']}]",
                            fontSize: 12.sp,
                            fontColor: AppColors.black,
                          ),
                        ],
                      ).paddingTop(30.h),
                    ],
                  ),
                  roleRowShow[index]
                      ? Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                  height: 30.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColors.blue,
                                            spreadRadius: 1.0,
                                            blurRadius: 1.0)
                                      ],
                                      border:
                                          Border.all(color: AppColors.blue)),
                                  child: Center(
                                    child: TextView(
                                      text: "L",
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      fontColor: AppColors.color666666,
                                    ),
                                  )),
                            ),
                            SizedBox(width: 2.w,),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                  height: 30.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColors.blue,
                                            spreadRadius: 1.0,
                                            blurRadius: 1.0)
                                      ],
                                      border:
                                          Border.all(color: AppColors.blue)),
                                  child: Center(
                                    child: TextView(
                                      text: "VL",
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      fontColor: AppColors.color666666,
                                    ),
                                  )),
                            ).paddingSymmetric(horizontal: 2.w),
                            SizedBox(width: 2.w,),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                  height: 30.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColors.blue,
                                            spreadRadius: 1.0,
                                            blurRadius: 1.0)
                                      ],
                                      border:
                                          Border.all(color: AppColors.blue)),
                                  child: Center(
                                    child: TextView(
                                      text: "CL",
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      fontColor: AppColors.color666666,
                                    ),
                                  )),
                            )
                          ],
                        ).paddingSymmetric(horizontal: 5.w, vertical: 5.w)
                      : Row(
                          children: [
                            GestureDetector(
                              onTap: onUpButtonTap,
                              child: Icon(
                                Icons.arrow_circle_up_outlined,
                                color: AppColors.priceButtonColor,
                                size: 35.sp,
                              ),
                            ),
                            SizedBox(width: 2.w,),
                            GestureDetector(
                                onTap: onMoreTap,
                                child: CommonIcon(
                                  icon: Icons.more_horiz,
                                )),
                            SizedBox(width: 2.w,),
                            GestureDetector(
                              onTap: onDownButtonTap,
                              child: Icon(
                                Icons.arrow_circle_down,
                                color: AppColors.downButtonColor,
                                size: 35.sp,
                              ),
                            ),
                          ],
                        )
                ],
              ),
            ).paddingSymmetric(horizontal: 5.w, vertical: 5.w),
          ),
          Positioned(
            left: 90.w,
            top: 3.h,
            child: Container(
              constraints: BoxConstraints(minWidth: 50.w, maxWidth: 120.w),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.lightRed,
                        blurRadius: 1.0,
                        spreadRadius: 1.0)
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r))),
              child: TextView(
                text: data['stocks'][index]['stockName'],
                fontColor: AppColors.black,
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis,
                fontSize: 15.sp,
                textAlign: TextAlign.center,
              ).paddingSymmetric(vertical: 10.h, horizontal: 10.w),
            ),
          ),
        ],
      ),
    );
  }
}
