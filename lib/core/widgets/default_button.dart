import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

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
      onPressed: onPressed,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: UITextStyle.bodyText3.copyWith(color: textColor),
            ),
            const SizedBox(width: UISpacing.xs),
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
