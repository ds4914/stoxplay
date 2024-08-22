import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stoxplay/presentation/pages/login_page.dart';

import '../../common/widgets/fade_page_route_builder.dart';

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
    Navigator.of(context).pushReplacement(
      FadePageRouteBuilder(
        builder: (context) => LoginPage(),
        settings: RouteSettings(name: '/loginPage'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/splash_screen.jpg'),
      ),
    );
  }
}
