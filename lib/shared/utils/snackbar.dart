import 'package:stoxplay/shared/shared.dart';

void showSnackBar({
  required BuildContext context,
  required String message,
  Color backgroundColor = AppColors.colorSecondary, // Default background color
  int durationInSeconds = 3, // Default duration
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Align(
        alignment: Alignment.centerLeft,
        child: TextView(
          text: message,
        ),
      ),
      backgroundColor: backgroundColor,
      duration: Duration(seconds: durationInSeconds),
    ),
  );
}
