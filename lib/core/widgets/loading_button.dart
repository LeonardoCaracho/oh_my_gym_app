import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    required this.text,
    required this.icon,
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.textOnLoading,
  });

  final VoidCallback? onPressed;
  final String text;
  final String? textOnLoading;
  final Icon icon;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    String getLabelText() {
      if (isLoading) {
        return textOnLoading ?? text;
      }
      return text;
    }

    return ElevatedButton.icon(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(1),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      icon: isLoading
          ? const SizedBox(
              width: 15,
              height: 15,
              child: CircularProgressIndicator(),
            )
          : icon,
      onPressed: isLoading ? null : onPressed,
      label: Text(
        getLabelText(),
      ),
    );
  }
}
