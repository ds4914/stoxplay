import 'package:carousel_slider/carousel_slider.dart';
import 'package:stoxplay/shared/widgets/home_screen_appbar.dart';
import '../../../../shared/shared.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: DefaultTabController(
        length: 2,
        child: Builder(builder: (context) {
          return Scaffold(
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
          );
        }),
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
              color: AppColors.color999999,
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
                    color: AppColors.gradientOne,
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
                          Row(
                            children: [
                              Image.asset(
                                StaticData.data[index]['image'],
                                height: 50.h,
                                width: 50.w,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              TextView(
                                  fontSize: 15.sp,
                                  fontColor: AppColors.grey,
                                  fontWeight: FontWeight.bold,
                                  text: StaticData.data[index]['title']
                                      .toString()),
                            ],
                          ),
                          CommonButton(
                              height: 25.h,
                              width: 70.w,
                              borderRadius: 5.r,
                              title: Strings.join,
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteList.contestScreen,
                                    arguments: StaticData.data[index]);
                              }),
                        ],
                      ),
                      Divider(
                        color: AppColors.lightGrey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(
                            text: "Max ${StaticData.data[index]['price']} Win",
                            fontColor: AppColors.grey,
                            fontSize: 10.sp,
                          ),
                          Row(
                            children: [
                              TextView(
                                fontColor: AppColors.grey,
                                text: Strings.timeLeft,
                                fontSize: 10.sp,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              TextView(
                                fontColor: AppColors.grey,
                                text: StaticData.data[index]['timeLeft'],
                                fontSize: 10.sp,
                              ),
                            ],
                          )
                        ],
                      ).paddingBottom(5.h),
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
        indicator: BoxDecoration(borderRadius: BorderRadius.circular(15.r),boxShadow: [
          BoxShadow(color: AppColors.gradientTwo, blurRadius: 1.0, spreadRadius: 1.0)
        ],),
        tabs: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.gradientOne,
                shape: BoxShape.rectangle,
                border: Border.all(color: AppColors.lightGrey, width: 2.0),
                borderRadius: BorderRadius.circular(15.r)),
            child: TextView(
              text: Strings.play,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ).paddingSymmetric(horizontal: 50.w, vertical: 10.h),
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.gradientOne,
                shape: BoxShape.rectangle,
                border: Border.all(color: AppColors.lightGrey, width: 2.0),
                borderRadius: BorderRadius.circular(15.r)),
            child: TextView(
              text: Strings.learn,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ).paddingSymmetric(horizontal: 50.w, vertical: 10.h),
          ),
        ]);
  }
}
