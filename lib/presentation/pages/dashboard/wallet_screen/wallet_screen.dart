import 'package:stoxplay/shared/widgets/dashboard_background.dart';

import '../../../../shared/shared.dart';
import '../../../../shared/widgets/home_screen_appbar.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardBackGround(
      child: Scaffold(
        backgroundColor: AppColors.transparentColor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.h), child: HomeScreenAppbar()),
      ),
    );
  }
}
