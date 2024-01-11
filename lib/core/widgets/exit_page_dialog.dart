import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';

Future<bool> exitPageDialog(
  BuildContext context, {
  String title = '',
  String content = '',
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: UIColors.backgroundDark,
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: UITextStyle.headline4.copyWith(
            color: UIColors.white,
          ),
        ),
        content: Text(
          content,
          textAlign: TextAlign.center,
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: DefaultButtonSmall(
                  btnColor: UIColors.lightDark,
                  textColor: UIColors.white,
                  text: 'CANCEL',
                  onPressed: () => Navigator.of(context).pop(false),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: DefaultButtonSmall(
                  text: 'REVERT',
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ),
            ],
          ),
        ],
      );
    },
  );

  return result ?? false;
}
