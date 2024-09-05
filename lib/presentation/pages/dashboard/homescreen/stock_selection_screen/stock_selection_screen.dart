import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stoxplay/presentation/pages/dashboard/homescreen/stock_selection_screen/widgets/common_stock_selection_card.dart';
import 'package:stoxplay/shared/widgets/common_back_button.dart';
import 'package:stoxplay/shared/widgets/contest_screen_appbar.dart';
import '../../../../../shared/shared.dart';
import 'blocs/stock_selection_bloc.dart';

class StockSelectionScreen extends StatelessWidget {
  StockSelectionScreen({super.key});

  int? leaderIndex;

  int? viceLeaderIndex;

  int? coLeaderIndex;

  List<int>? upSelectedStock = [];
  List<int>? downSelectedStock = [];
  List<bool>? moreButtonClicked = [];
  StockSelectionBloc leaderBloc = StockSelectionBloc();
  StockSelectionBloc coLeaderBloc = StockSelectionBloc();
  StockSelectionBloc viceLeaderBloc = StockSelectionBloc();

  StockSelectionBloc stockSelectionBloc = StockSelectionBloc()
    ..add(OnMoreClickedEvent(
      upSelectedStock: [],
      moreButtonClicked: [],
      downSelectedStock: [],
    ));
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
        backgroundColor: AppColors.gradientOne,
        body: Column(
          children: [
            ContestScreenAppbar(
                child: Column(
              children: [
                appBarRow(context),
                SizedBox(
                  height: 10.h,
                ),
                stockSelectContainerRow(),
              ],
            ).paddingSymmetric(horizontal: 20.w)),
            listView(args)
          ],
        ),
        bottomNavigationBar: Container(
          color: AppColors.gradientOne,
          child: BlocBuilder<StockSelectionBloc, StockSelectionState>(
              bloc: stockSelectionBloc,
              builder: (context, state) {
                if (state is StockSelectionLoadedState) {
                  return BlocBuilder<StockSelectionBloc, StockSelectionState>(
                    bloc: leaderBloc,
                    builder: (context, leaderState) {
                      return CommonButton(
                        title: "Next",
                        onTap: () {
                          if ((state.upSelectedStock!.length +
                                  state.downSelectedStock!.length) <=
                              10) {
                            showSnackBar(
                                context: context,
                                message: "Please select 11 stocks");
                          } else if (leaderIndex == null) {
                            showSnackBar(
                                context: context,
                                message: "Please select leader stock");
                          } else if (viceLeaderIndex == null) {
                            showSnackBar(
                                context: context,
                                message: "Please select vice leader stock");
                          } else if (coLeaderIndex == null) {
                            showSnackBar(
                                context: context,
                                message: "Please select Co leader stock");
                          } else {
                            Navigator.pushNamed(
                                context, RouteList.battleGroundScreen);
                          }
                        },
                      );
                    },
                  ).paddingSymmetric(vertical: 20.h, horizontal: 50.w);
                }
                return SizedBox.shrink();
              }),
        ));
  }

  Expanded listView(Map<String, dynamic> args) {
    return Expanded(
        child: BlocBuilder<StockSelectionBloc, StockSelectionState>(
      bloc: stockSelectionBloc,
      builder: (context, state) {
        if (state is StockSelectionLoadedState) {
          print('state...=>${state}');
          return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                    height: 5.h,
                  ),
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              itemCount: args['stocks'].length,
              itemBuilder: (context, index) {
                state.moreButtonClicked!.addAll([false]);
                return CommonStockSelectionCard(
                  index: index,
                  coLeaderBloc: coLeaderBloc,
                  viceLeaderBloc: viceLeaderBloc,
                  leaderBloc: leaderBloc,
                  downSelectedStock: state.downSelectedStock,
                  moreButtonClicked: state.moreButtonClicked,
                  upSelectedStock: state.upSelectedStock,
                  coLeaderIndex: coLeaderIndex,
                  leaderIndex: leaderIndex,
                  viceLeaderIndex: viceLeaderIndex,
                  onLClick: () {},
                  onVLClick: () {},
                  onCLClick: () {},
                  onDownButtonTap: () {
                    stockSelectionBloc.add(StockSelectionAddEvent(
                        index: index,
                        isUp: false,
                        downSelectedStock: state.downSelectedStock,
                        moreButtonClicked: state.moreButtonClicked,
                        upSelectedStock: state.upSelectedStock));
                    state.showSnackBarForStockSelection == true
                        ? showSnackBarUsingKey(
                            message:
                                "You have selected 11 stocks, please click next!")
                        : null;
                  },
                  onMoreTap: () {
                    stockSelectionBloc.add(OnMoreClickedEvent(
                        index: index,
                        downSelectedStock: state.downSelectedStock,
                        moreButtonClicked: state.moreButtonClicked,
                        upSelectedStock: state.upSelectedStock));
                    state.showSnackBarForMore == true
                        ? showSnackBarUsingKey(
                            message: "First select the stock")
                        : null;
                  },
                  onTap: () {
                    stockSelectionBloc.add(StockSelectionRemoveEvent(
                        index: index,
                        downSelectedStock: state.downSelectedStock,
                        moreButtonClicked: state.moreButtonClicked,
                        upSelectedStock: state.upSelectedStock));
                  },
                  onUpButtonTap: () {
                    stockSelectionBloc.add(StockSelectionAddEvent(
                        index: index,
                        isUp: true,
                        downSelectedStock: state.downSelectedStock,
                        moreButtonClicked: state.moreButtonClicked,
                        upSelectedStock: state.upSelectedStock));
                    state.showSnackBarForStockSelection == true
                        ? showSnackBarUsingKey(
                            message:
                                "You have selected 11 stocks, please click next!")
                        : null;
                  },
                  data: args,
                );
              });
        }
        return SizedBox.shrink();
      },
    ));
  }

  Widget stockSelectContainerRow() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextView(
              text: "Pick 11 stocks from 22",
              fontSize: 12.sp,
            ),
            TextView(
              text: "Time Left(09:10:59)",
              fontSize: 12.sp,
            ),
          ],
        ).paddingBottom(5.h),
        SizedBox(
            height: 5.h,
            child: BlocBuilder<StockSelectionBloc, StockSelectionState>(
              bloc: stockSelectionBloc,
              builder: (context, state) {
                if (state is StockSelectionLoadedState) {
                  return ListView.builder(
                      itemCount: 11,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 20.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.white, width: 0.6),
                              color: index <
                                      (state.upSelectedStock!.length +
                                          state.downSelectedStock!.length)
                                  ? AppColors.gradientOne
                                  : AppColors.white,
                              borderRadius: BorderRadius.circular(10.r)),
                        ).paddingSymmetric(horizontal: 2.w);
                      });
                }
                return SizedBox.shrink();
              },
            )),
        SizedBox(
          height: 10.h,
        )
      ],
    ).paddingSymmetric(horizontal: 20.w);
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
