import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget action;
  final bool showBack;

  const CustomAppBar({
    super.key,
    this.action = const SizedBox(),
    this.showBack = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 23, bottom: 23, left: 28, right: 42),
      child: AppBar(
        leading: showBack
            ? GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: SvgPicture.asset(
                  "assets/arrow_back.svg",
                ),
              )
            : const SizedBox(),
        actions: [action],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
