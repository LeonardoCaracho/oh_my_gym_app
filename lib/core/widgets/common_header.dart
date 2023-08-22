import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CommonHeader extends StatelessWidget {
  const CommonHeader({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: UITextStyle.headline3,
    );
  }
}
