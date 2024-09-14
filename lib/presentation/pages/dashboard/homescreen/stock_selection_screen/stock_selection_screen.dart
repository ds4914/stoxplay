import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stoxplay/presentation/pages/dashboard/homescreen/stock_selection_screen/blocs/update_index/update_index_bloc.dart';
import 'package:stoxplay/presentation/pages/dashboard/homescreen/stock_selection_screen/widgets/common_stock_selection_card.dart';
import 'package:stoxplay/shared/widgets/common_back_button.dart';
import 'package:stoxplay/shared/widgets/contest_screen_appbar.dart';
import '../../../../../shared/shared.dart';
import 'blocs/stock_bloc/stock_selection_bloc.dart';

class StockSelectionScreen extends StatelessWidget {
  StockSelectionScreen({super.key});

  int? leaderIndex;
  int? viceLeaderIndex;
  int? coLeaderIndex;

  UpdateIndexBloc updateIndexBloc = UpdateIndexBloc();

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
                  return BlocBuilder<UpdateIndexBloc, UpdateIndexState>(
                    bloc: updateIndexBloc,
                    builder: (context, indexState) {
                      if (indexState is UpdateIndexLoadedState) {
                        return CommonButton(
                          title: Strings.next,
                          onTap: () {
                            if ((state.upSelectedStock!.length +
                                    state.downSelectedStock!.length) <=
                                10) {
                              showSnackBar(
                                  context: context,
                                  message: Strings.pleaseSelect11Stocks);
                            } else if (indexState.leaderIndex == null) {
                              showSnackBar(
                                  context: context,
                                  message: Strings.pleaseSelectLeaderStock);
                            } else if (indexState.viceLeaderIndex == null) {
                              showSnackBar(
                                  context: context,
                                  message: Strings.pleaseSelectViceLeaderStock);
                            } else if (indexState.coLeaderIndex == null) {
                              showSnackBar(
                                  context: context,
                                  message: Strings.pleaseSelectCoLeaderStock);
                            } else {
                              Navigator.pushNamed(
                                  context, RouteList.battleGroundScreen);
                            }
                          },
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ).paddingSymmetric(vertical: 20.h, horizontal: 40.w);
                }
                return SizedBox.shrink();
              }),
        ));
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
                  height: 25.h,
                  width: 25.w,
                  child: Image.asset("assets/images/news_icon.png"),
                )),
            SizedBox(
              width: 10.w,
            ),
            GestureDetector(
                onTap: () {},
                child: Container(
                  height: 30.h,
                  width: 30.w,
                  child:
                      Image.asset("assets/images/question_mark_icon.png"),
                )),
          ],
        ),
      ],
    ).paddingTop(40.h);
  }

  Widget listView(Map<String, dynamic> args) {
    return Expanded(
        child: BlocBuilder<StockSelectionBloc, StockSelectionState>(
      bloc: stockSelectionBloc,
      builder: (context, state) {
        if (state is StockSelectionLoadedState) {
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
                  updateIndexBloc: updateIndexBloc,
                  downSelectedStock: state.downSelectedStock,
                  moreButtonClicked: state.moreButtonClicked,
                  upSelectedStock: state.upSelectedStock,
                  coLeaderIndex: coLeaderIndex,
                  leaderIndex: leaderIndex,
                  viceLeaderIndex: viceLeaderIndex,
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
                                Strings.youHaveSelected11StockPleaseClickNext)
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
                            message: Strings.firstSelectTheStock)
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
                                Strings.youHaveSelected11StockPleaseClickNext)
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
              text: Strings.pick11StocksFrom22,
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
}
