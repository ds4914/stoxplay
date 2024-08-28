import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stoxplay/shared/shared.dart';
import 'package:stoxplay/shared/utils/routes.dart';
import 'package:stoxplay/shared/widgets/app_component_base.dart';
import 'package:stoxplay/shared/widgets/fade_page_route_builder.dart';
import 'package:stoxplay/presentation/pages/auth/login_page.dart';
import 'package:stoxplay/shared/constants/strings.dart';
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
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.colorPrimary),
          useMaterial3: true,datePickerTheme: DatePickerThemeData(headerBackgroundColor: AppColors.gradientTwo)
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
        routes: Routes.getRoutes,
        home: SplashScreen(), // Use the SplashScreen widget here
      ),
    );
  }
}
