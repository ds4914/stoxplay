import 'package:stoxplay/presentation/pages/dashboard/homescreen/stock_selection_screen/widgets/common_stock_selection_card.dart';
import 'package:stoxplay/shared/widgets/common_back_button.dart';
import 'package:stoxplay/shared/widgets/contest_screen_appbar.dart';
import '../../../../../shared/shared.dart';

class StockSelectionScreen extends StatefulWidget {
  StockSelectionScreen({super.key});

  @override
  State<StockSelectionScreen> createState() => _StockSelectionScreenState();
}

class _StockSelectionScreenState extends State<StockSelectionScreen> {
  List<int> upSelectedStock = [];
  List<int> downSelectedStock = [];
  List<bool>? moreButtonClicked = [];

  int? leaderIndex;
  int? viceLeaderIndex;
  int? coLeaderIndex;
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
        child: CommonButton(
            title: "Next",
            onTap: () {
              if ((upSelectedStock.length + downSelectedStock.length) <= 10) {
                showSnackBar(
                    context: context, message: "Please select 11 stocks");
              } else {
                Navigator.pushNamed(context, RouteList.battleGroundScreen);
              }
            }).paddingSymmetric(vertical: 20.h, horizontal: 50.w),
      ),
    );
  }

  Expanded listView(Map<String, dynamic> args) {
    return Expanded(
        child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
                  height: 5.h,
                ),
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
            itemCount: args['stocks'].length,
            itemBuilder: (context, index) {
              moreButtonClicked!.addAll([false]);
              return CommonStockSelectionCard(
                index: index,
                downSelectedStock: downSelectedStock,
                upSelectedStock: upSelectedStock,
                roleRowShow: moreButtonClicked!,
                coLeaderIndex: coLeaderIndex,
                leaderIndex: leaderIndex,
                viceLeaderIndex: viceLeaderIndex,
                onLClick: () {
                  setState(() {
                    if (viceLeaderIndex != index && coLeaderIndex != index) {
                      leaderIndex = index;
                    }
                  });
                },
                onVLClick: () {
                  setState(() {
                    if (leaderIndex != index && coLeaderIndex != index) {
                      viceLeaderIndex = index;
                    }
                  });
                },
                onCLClick: () {
                  setState(() {
                    if (leaderIndex != index && coLeaderIndex != index) {
                      coLeaderIndex = index;
                    }
                  });
                },
                onDownButtonTap: () {
                  setState(() {
                    if (upSelectedStock.length + downSelectedStock.length <=
                        10) {
                      if (upSelectedStock.contains(index)) {
                        upSelectedStock.remove(index);
                      }
                      if (!downSelectedStock.contains(index)) {
                        downSelectedStock.add(index);
                      }
                    } else {
                      showSnackBar(
                          context: context,
                          message:
                              "You have selected 11 stocks please click next!!");
                    }
                  });
                },
                onMoreTap: () {
                  setState(() {
                    if (downSelectedStock.contains(index) ||
                        upSelectedStock.contains(index)) {
                      moreButtonClicked![index] = !moreButtonClicked![index];
                    } else {
                      showSnackBar(
                          context: context, message: "First select the stock");
                    }
                  });
                },
                onTap: () {
                  setState(() {
                    if (downSelectedStock.contains(index)) {
                      downSelectedStock.remove(index);
                    }
                    if (upSelectedStock.contains(index)) {
                      upSelectedStock.remove(index);
                    }
                    if (moreButtonClicked![index] == true) {
                      moreButtonClicked![index] = false;
                    }
                  });
                },
                onUpButtonTap: () {
                  setState(() {
                    if (upSelectedStock.length + downSelectedStock.length <=
                        10) {
                      if (downSelectedStock.contains(index)) {
                        downSelectedStock.remove(index);
                      }
                      if (!upSelectedStock.contains(index)) {
                        upSelectedStock.add(index);
                      }
                    } else {
                      showSnackBar(
                          context: context,
                          message:
                              "You have selected 11 stocks please click next!!");
                    }
                  });
                },
                data: args,
              );
            }));
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
            child: ListView.builder(
                itemCount: 11,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 20.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.white, width: 0.6),
                        color: index <
                                (upSelectedStock.length +
                                    downSelectedStock.length)
                            ? AppColors.gradientOne
                            : AppColors.white,
                        borderRadius: BorderRadius.circular(10.r)),
                  ).paddingSymmetric(horizontal: 2.w);
                })),
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
