import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stoxplay/presentation/pages/auth/login_page.dart';
import 'package:stoxplay/shared/constants/route_list.dart';

import '../../shared/widgets/fade_page_route_builder.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  void _navigateToLogin() async {
    await Future.delayed(Duration(seconds: 3)); // Duration for splash screen
    Navigator.of(context).pushNamed(
      RouteList.loginPage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/splash_screen.png');
  }
}
