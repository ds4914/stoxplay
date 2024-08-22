import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stoxplay/common/widgets/app_component_base.dart';
import 'package:stoxplay/common/widgets/fade_page_route_builder.dart';
import 'package:stoxplay/presentation/pages/login_page.dart';
import 'package:stoxplay/common/routes.dart';
import 'package:stoxplay/common/strings.dart';
import 'package:stoxplay/presentation/pages/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppComponentBase.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: Strings.stoxplay,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: (RouteSettings settings) {
          final routes = Routes.getRoutes;
          WidgetBuilder? builder = routes[settings.name];
          if (builder != null) {
            return FadePageRouteBuilder(
              builder: builder,
              settings: settings,
            );
          }
          return null;
        },
        home: SplashScreen(), // Use the SplashScreen widget here
      ),
    );
  }
}
