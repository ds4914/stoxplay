import 'package:stoxplay/shared/widgets/dashboard_background.dart';

import '../../../../shared/shared.dart';

class MonitorScreen extends StatelessWidget {
  const MonitorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardBackGround(
      child: Scaffold(
        backgroundColor:AppColors.transparentColor,
      ),
    );
  }
}
