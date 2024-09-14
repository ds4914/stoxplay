import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stoxplay/shared/widgets/dashboard_background.dart';
import 'package:stoxplay/shared/widgets/home_screen_appbar.dart';
import '../../../../shared/shared.dart';
import '../../../blocs/tab_bloc/tab_bloc.dart';

class MonitorScreen extends StatelessWidget {
  MonitorScreen({super.key});

  final TabBloc tabBloc = TabBloc();
  final List<String> tabs = ["Upcoming", "Live", "Completed"];

  @override
  Widget build(BuildContext context) {
    return DashboardBackGround(
      child: DefaultTabController(
        length: tabs.length,
        child: Builder(
          builder: (context) {
            final TabController tabController =
                DefaultTabController.of(context);
            tabController.addListener(() {
              tabBloc.add(ChangeTabEvent(tabController.index));
            });

            return Scaffold(
              backgroundColor: AppColors.transparentColor,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(80.0),
                child: HomeScreenAppbar(),
              ),
              body: BlocBuilder<TabBloc, TabInitial>(
                bloc: tabBloc,
                builder: (context, state) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 40.0,
                        child: ListView.builder(
                          itemCount: tabs.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                tabBloc.add(ChangeTabEvent(index));
                              },
                              child: Container(
                                height: 40.0,
                                width: 105.0,
                                decoration: BoxDecoration(
                                  color: AppColors.gradientOne,
                                  shape: BoxShape.rectangle,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2.0,
                                      spreadRadius: 2.0,
                                      color: tabBloc.state.tabIndex == index
                                          ? AppColors.white
                                          : AppColors.transparentColor,
                                    ),
                                  ],
                                  border: Border.all(
                                    color: AppColors.lightGrey,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: TextView(
                                    text: tabs[index],
                                  ),
                                ).paddingSymmetric(horizontal: 2.0),
                              ),
                            ).paddingSymmetric(horizontal: 1.w);
                          },
                        ),
                      ),
                      // TabBarView(
                      //   controller: tabController,
                      //   children: [
                      //     Center(child: Text("11")),
                      //     Center(child: Text("22")),
                      //     Center(child: Text("33")),
                      //   ],
                      // ),
                    ],
                  ).paddingSymmetric(horizontal: 20.0);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
