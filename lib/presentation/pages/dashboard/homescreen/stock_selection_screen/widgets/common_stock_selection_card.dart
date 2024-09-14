import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stoxplay/presentation/pages/dashboard/homescreen/stock_selection_screen/blocs/update_index/update_index_bloc.dart';
import 'package:stoxplay/shared/widgets/common_icon_for_position.dart';

import '../../../../../../shared/shared.dart';
import '../../../../../../shared/widgets/common_icon.dart';
import '../blocs/stock_bloc/stock_selection_bloc.dart';

class CommonStockSelectionCard extends StatelessWidget {
  final int index;
  final Map<String, dynamic> data;
  int? leaderIndex;
  int? coLeaderIndex;
  int? viceLeaderIndex;
  final void Function()? onUpButtonTap;
  final void Function()? onTap;
  final void Function()? onDownButtonTap;
  final void Function()? onMoreTap;
  final List<int>? upSelectedStock;
  final List<int>? downSelectedStock;
  final List<bool>? moreButtonClicked;
  final UpdateIndexBloc updateIndexBloc;

  CommonStockSelectionCard({
    super.key,
    required this.index,
    required this.updateIndexBloc,
    required this.data,
    required this.leaderIndex,
    required this.coLeaderIndex,
    required this.viceLeaderIndex,
    required this.onUpButtonTap,
    required this.onMoreTap,
    required this.onTap,
    required this.onDownButtonTap,
    this.upSelectedStock,
    this.downSelectedStock,
    this.moreButtonClicked,
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
                  color: upSelectedStock!.contains(index)
                      ? AppColors.lightGreen
                      : downSelectedStock!.contains(index)
                          ? AppColors.lightRed
                          : AppColors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                      color: upSelectedStock!.contains(index)
                          ? AppColors.colorOnline
                          : downSelectedStock!.contains(index)
                              ? AppColors.red
                              : AppColors.color999999)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        data['stocks'][index]['image'],
                        height: 40.h,
                        width: 40.w,
                      )
                          .paddingSymmetric(horizontal: 5.w, vertical: 5.h)
                          .paddingSymmetric(horizontal: 5.w),
                      Row(
                        children: [
                          TextView(
                            text: "₹${data['stocks'][index]['stockPrice']}",
                            fontSize: 12.sp,
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
                  moreButtonClicked![index]
                      ? Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                updateIndexBloc.add(UpdateIndexClickedEvent(
                                    leaderIndex: leaderIndex,
                                    index: index,
                                    updateLeader: true,
                                    coLeaderIndex: coLeaderIndex,
                                    viceLeaderIndex: viceLeaderIndex));
                              },
                              child: BlocBuilder<UpdateIndexBloc,
                                  UpdateIndexState>(
                                bloc: updateIndexBloc,
                                builder: (context, state) {
                                  if (state is UpdateIndexLoadedState) {
                                    print('object==>${state.leaderIndex}');
                                    leaderIndex = state.leaderIndex;
                                    return Container(
                                        height: 25.h,
                                        width: 25.w,
                                        decoration: BoxDecoration(
                                            color: state.leaderIndex == index
                                                ? AppColors.gradientOne
                                                : AppColors.white,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: AppColors.blue,
                                                  spreadRadius: 1.0,
                                                  blurRadius: 1.0)
                                            ],
                                            border: Border.all(
                                                color: AppColors.blue)),
                                        child: Center(
                                          child: TextView(
                                            text: "L",
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold,
                                            fontColor:
                                                state.leaderIndex == index
                                                    ? AppColors.white
                                                    : AppColors.color666666,
                                          ),
                                        ));
                                  }
                                  return Container(
                                      height: 25.h,
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                          color: AppColors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: AppColors.blue,
                                                spreadRadius: 1.0,
                                                blurRadius: 1.0)
                                          ],
                                          border: Border.all(
                                              color: AppColors.blue)),
                                      child: Center(
                                        child: TextView(
                                          text: "L",
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold,
                                          fontColor: AppColors.color666666,
                                        ),
                                      ));
                                },
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                updateIndexBloc.add(UpdateIndexClickedEvent(
                                    leaderIndex: leaderIndex,
                                    index: index,
                                    updateViceLeader: true,
                                    coLeaderIndex: coLeaderIndex,
                                    viceLeaderIndex: viceLeaderIndex));
                              },
                              child: BlocBuilder<UpdateIndexBloc,
                                  UpdateIndexState>(
                                bloc: updateIndexBloc,
                                builder: (context, state) {
                                  if (state is UpdateIndexLoadedState) {
                                    print('object==>${state.viceLeaderIndex}');
                                    viceLeaderIndex = state.viceLeaderIndex;
                                    return Container(
                                        height: 25.h,
                                        width: 25.w,
                                        decoration: BoxDecoration(
                                            color:
                                                state.viceLeaderIndex == index
                                                    ? AppColors.gradientOne
                                                    : AppColors.white,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: AppColors.blue,
                                                  spreadRadius: 1.0,
                                                  blurRadius: 1.0)
                                            ],
                                            border: Border.all(
                                                color: AppColors.blue)),
                                        child: Center(
                                          child: TextView(
                                            text: "VL",
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold,
                                            fontColor:
                                                state.viceLeaderIndex == index
                                                    ? AppColors.white
                                                    : AppColors.color666666,
                                          ),
                                        ));
                                  }
                                  return Container(
                                      height: 25.h,
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                          color: AppColors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: AppColors.blue,
                                                spreadRadius: 1.0,
                                                blurRadius: 1.0)
                                          ],
                                          border: Border.all(
                                              color: AppColors.blue)),
                                      child: Center(
                                        child: TextView(
                                          text: "VL",
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold,
                                          fontColor: AppColors.color666666,
                                        ),
                                      ));
                                },
                              ),
                            ).paddingSymmetric(horizontal: 2.w),
                            SizedBox(
                              width: 5.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                updateIndexBloc.add(UpdateIndexClickedEvent(
                                    leaderIndex: leaderIndex,
                                    index: index,
                                    coLeaderIndex: coLeaderIndex,
                                    updateCoLeader: true,
                                    viceLeaderIndex: viceLeaderIndex));
                              },
                              child: BlocBuilder<UpdateIndexBloc,
                                  UpdateIndexState>(
                                bloc: updateIndexBloc,
                                builder: (context, state) {
                                  if (state is UpdateIndexLoadedState) {
                                    print('object==>${state.coLeaderIndex}');
                                    coLeaderIndex = state.coLeaderIndex;
                                    return Container(
                                        height: 25.h,
                                        width: 25.w,
                                        decoration: BoxDecoration(
                                            color: state.coLeaderIndex == index
                                                ? AppColors.gradientOne
                                                : AppColors.white,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: AppColors.blue,
                                                  spreadRadius: 1.0,
                                                  blurRadius: 1.0)
                                            ],
                                            border: Border.all(
                                                color: AppColors.blue)),
                                        child: Center(
                                          child: TextView(
                                            text: "CL",
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold,
                                            fontColor:
                                                state.coLeaderIndex == index
                                                    ? AppColors.white
                                                    : AppColors.color666666,
                                          ),
                                        ));
                                  }
                                  return Container(
                                      height: 25.h,
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                          color: AppColors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: AppColors.blue,
                                                spreadRadius: 1.0,
                                                blurRadius: 1.0)
                                          ],
                                          border: Border.all(
                                              color: AppColors.blue)),
                                      child: Center(
                                        child: TextView(
                                          text: "CL",
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold,
                                          fontColor: AppColors.color666666,
                                        ),
                                      ));
                                },
                              ),
                            )
                          ],
                        ).paddingSymmetric(horizontal: 5.w, vertical: 5.w)
                      : Row(
                          children: [
                            GestureDetector(
                              onTap: onUpButtonTap,
                              child: Image.asset("assets/images/up_button.png"),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            GestureDetector(
                                onTap: onMoreTap,
                                child: CommonIcon(
                                  icon: Icons.more_horiz,
                                  iconSize: 15.sp,
                                )),
                            SizedBox(
                              width: 2.w,
                            ),
                            GestureDetector(
                              onTap: onDownButtonTap,
                              child:
                                  Image.asset("assets/images/down_button.png"),
                            ),
                          ],
                        )
                ],
              ),
            ).paddingSymmetric(horizontal: 5.w, vertical: 5.w),
          ),
          Positioned(
            left: 70.w,
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
                fontSize: 14.sp,
                textAlign: TextAlign.center,
              ).paddingSymmetric(vertical: 10.h, horizontal: 10.w),
            ),
          ),
        ],
      ),
    );
  }
}
