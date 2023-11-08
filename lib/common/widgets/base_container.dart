import 'package:flutter/material.dart';

class BaseContainer extends StatelessWidget {
  final Widget content;
  final VoidCallback? onTap;
  const BaseContainer({
    super.key,
    required this.content,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: content,
      ),
    );
  }
}
