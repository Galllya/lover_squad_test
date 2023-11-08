import 'package:flutter/material.dart';
import 'package:lover_squad_test/style/app_colors.dart';

class AppScreen extends StatelessWidget {
  final Widget content;
  const AppScreen({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.startBackground,
            AppColors.endBackground,
          ],
        ),
      ),
      child: content,
    );
  }
}
