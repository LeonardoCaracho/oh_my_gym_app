import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultButtonSmall extends StatelessWidget {
  const DefaultButtonSmall({
    required this.text,
    super.key,
    this.onPressed,
    this.icon,
    this.textColor,
    this.iconColor,
    this.btnColor,
  });

  final VoidCallback? onPressed;
  final String text;
  final IconData? icon;
  final Color? textColor;
  final Color? iconColor;
  final Color? btnColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size.fromHeight(30)),
        elevation: MaterialStateProperty.all(0),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        backgroundColor:
            btnColor != null ? MaterialStateProperty.all(btnColor) : null,
      ),
      onPressed: onPressed != null
          ? () async {
              onPressed!();
              await HapticFeedback.lightImpact();
            }
          : null,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: UITextStyle.caption.copyWith(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: UISpacing.xs),
            if (icon != null)
              Icon(
                icon,
                color: iconColor,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
