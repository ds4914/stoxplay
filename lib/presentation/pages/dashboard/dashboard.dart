import 'package:stoxplay/presentation/pages/dashboard/learn_screen/learn_screen.dart';
import 'package:stoxplay/presentation/pages/dashboard/monitor_screen/monitor_screen.dart';
import 'package:stoxplay/presentation/pages/dashboard/profile_screen/profile_screen.dart';
import 'package:stoxplay/presentation/pages/dashboard/wallet_screen/wallet_screen.dart';

import '../../../shared/shared.dart';
import 'homescreen/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    MonitorScreen(),
    LearnScreen(),
    WalletScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r))),
        child: BottomNavigationBar(
          enableFeedback: false,
          elevation: 0.0,
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: AppColors.white,
          items: [
            BottomNavigationBarItem(
                backgroundColor: AppColors.gradientOne,
                icon: Icon(
                  Icons.home_outlined,
                  color: selectedIndex == 0
                      ? AppColors.gradientTwo
                      : AppColors.color666666,
                ),
                label: Strings.home),
            BottomNavigationBarItem(
                backgroundColor: AppColors.gradientOne,
                icon: Icon(
                  Icons.monitor,
                  color: selectedIndex == 1
                      ? AppColors.gradientTwo
                      : AppColors.color666666,
                ),
                label: Strings.monitor),
            BottomNavigationBarItem(
                backgroundColor: AppColors.gradientOne,
                icon: Icon(
                  Icons.bar_chart,
                  color: selectedIndex == 2
                      ? AppColors.gradientTwo
                      : AppColors.color666666,
                ),
                label: Strings.learn),
            BottomNavigationBarItem(
                backgroundColor: AppColors.gradientOne,
                icon: Icon(
                  Icons.account_balance_wallet_outlined,
                  color: selectedIndex == 3
                      ? AppColors.gradientTwo
                      : AppColors.color666666,
                ),
                label: Strings.wallet),
            BottomNavigationBarItem(
                backgroundColor: AppColors.gradientOne,
                icon: Icon(
                  Icons.person_2_outlined,
                  color: selectedIndex == 4
                      ? AppColors.gradientTwo
                      : AppColors.color666666,
                ),
                label: Strings.profile),
          ],
        ),
      ),
    );
  }
}
