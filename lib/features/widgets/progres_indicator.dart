import 'package:flutter/cupertino.dart';
import 'package:uic_test/app/app_colors.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(
        radius: 16,
        color: AppColors.black,
      ),
    );
  }
}
