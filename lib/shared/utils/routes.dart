import 'package:flutter/cupertino.dart';
import 'package:stoxplay/presentation/pages/auth/create_your_profile_screen.dart';
import 'package:stoxplay/presentation/pages/auth/login_page.dart';
import 'package:stoxplay/presentation/pages/auth/otp_screen.dart';
import 'package:stoxplay/presentation/pages/dashboard/dashboard.dart';
import 'package:stoxplay/presentation/pages/dashboard/homescreen/battleground_screen/battleground_screen.dart';
import 'package:stoxplay/presentation/pages/dashboard/homescreen/contest_screen/contest_screen.dart';
import 'package:stoxplay/presentation/pages/dashboard/homescreen/home_screen.dart';
import 'package:stoxplay/presentation/pages/dashboard/homescreen/stock_selection_screen/stock_selection_screen.dart';

import '../constants/route_list.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes = {
    RouteList.loginPage: (context) => LoginPage(),
    RouteList.otpScreen: (context) => OtpScreen(),
    RouteList.createYourProfileScreen: (context) => CreateYourProfileScreen(),
    RouteList.homeScreen: (context) => HomeScreen(),
    RouteList.dashboardScreen: (context) => DashboardScreen(),
    RouteList.contestScreen: (context) => ContestScreen(),
    RouteList.stockSelectionScreen: (context) => StockSelectionScreen(),
    RouteList.battleGroundScreen: (context) => BattlegroundScreen(),
  };
}
