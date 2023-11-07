import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';

Future<bool> exitPageDialog(
  BuildContext context,
) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'EXIT',
          textAlign: TextAlign.center,
          style: UITextStyle.headline4.copyWith(
            color: UIColors.white,
          ),
        ),
        content: const Text(
          'DO YOU REALLY WANNA LEAVE?',
          textAlign: TextAlign.center,
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: DefaultButton(
                  text: 'YES',
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: DefaultButton(
                  text: 'NO',
                  onPressed: () => Navigator.of(context).pop(false),
                ),
              ),
            ],
          )
        ],
      );
    },
  );

  return result ?? false;
}
