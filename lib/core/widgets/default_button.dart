import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    required this.text,
    super.key,
    this.onPressed,
    this.icon,
    this.btnColor,
    this.textColor,
    this.iconColor,
  });

  final VoidCallback? onPressed;
  final String text;
  final IconData? icon;
  final Color? btnColor;
  final Color? textColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(1),
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
            ),
            if (icon != null)
              Icon(
                icon,
                color: iconColor,
              ),
          ],
        ),
      ),
    );
  }
}
