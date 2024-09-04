import 'package:carousel_slider/carousel_slider.dart';
import 'package:stoxplay/shared/widgets/dashboard_background.dart';
import 'package:stoxplay/shared/widgets/home_screen_appbar.dart';

import '../../../../shared/shared.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  TabController? tabController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: AppColors.gradientOne,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(80.h),
              child: HomeScreenAppbar()),
          body: Column(
            children: [
              CarouselSlider(
                  items: [
                    Image.asset('assets/images/caraousel_item1.jfif'),
                    Image.asset('assets/images/caraousel_item2.jfif'),
                  ],
                  options: CarouselOptions(
                    height: 100.h,
                    autoPlay: true,
                    pageSnapping: true,
                  )),
              SizedBox(
                height: 20.h,
              ),
              tabBar(),
              Expanded(
                child: TabBarView(children: [
                  playView(),
                  Column(
                    children: [
                      TextView(text: Strings.learn),
                    ],
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget playView() {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Stack(
          children: [
            Divider(
              color: AppColors.white,
            ).paddingTop(5.h),
            Align(
                alignment: Alignment.center,
                child: Container(
                  color: AppColors.gradientOne,
                  child: TextView(
                    text: Strings.sectorsPlay,
                    fontSize: 18.sp,
                  ).paddingSymmetric(horizontal: 20.w),
                ))
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Expanded(
          child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                    height: 10.h,
                  ),
              itemCount: StaticData.data.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [-0.5, 1.2],
                        colors: [AppColors.gradientOne, AppColors.gradientTwo]),
                    border: Border.all(color: AppColors.lightGrey),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(text: Strings.indianStockMarketChampionship)
                          .paddingTop(10.h),
                      Divider(
                        color: AppColors.lightGrey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 40.h,
                                    width: 40.w,
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                    child: Image.asset(
                                      StaticData.data[index]['image'],
                                    ).paddingSymmetric(horizontal: 5.w)),
                                TextView(
                                        fontSize: 12.sp,
                                        fontColor: AppColors.grey,
                                        text: StaticData.data[index]['title']
                                            .toString())
                                    .paddingTop(5.h),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  TextView(
                                    fontColor: AppColors.grey,
                                    text: "Time Left",
                                    fontSize: 12.sp,
                                  ),
                                  TextView(
                                    fontColor: AppColors.grey,
                                    text: StaticData.data[index]['timeLeft'],
                                    fontSize: 12.sp,
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              CommonButton(
                                  height: 20.h,
                                  width: 100.w,
                                  borderRadius: 5.r,
                                  title: Strings.play,
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RouteList.contestScreen,
                                        arguments: StaticData.data[index]);
                                  }),
                            ],
                          )
                        ],
                      ),
                      Divider(
                        color: AppColors.lightGrey,
                      ),
                      TextView(
                        text: "Max ${StaticData.data[index]['price']} Win",
                        fontColor: AppColors.grey,
                        fontSize: 12.sp,
                      ).paddingBottom(10.h),
                    ],
                  ).paddingSymmetric(horizontal: 14.w),
                );
              }),
        ),
      ],
    ).paddingSymmetric(horizontal: 20.w);
  }

  Widget tabBar() {
    return TabBar(
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
            color: AppColors.gradientOne,
            shape: BoxShape.rectangle,
            boxShadow: [BoxShadow(color: AppColors.lightGrey, blurRadius: 5.0)],
            border: Border.all(color: AppColors.lightGrey, width: 2.0),
            borderRadius: BorderRadius.circular(20.r)),
        tabs: [
          TextView(
            text: Strings.play,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ).paddingSymmetric(horizontal: 50.w, vertical: 10.h),
          TextView(
            text: Strings.learn,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ).paddingSymmetric(
            horizontal: 50.w,
            vertical: 10.h,
          )
        ]);
  }
}
