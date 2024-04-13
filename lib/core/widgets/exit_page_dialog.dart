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
        title: Text(
          title,
          textAlign: TextAlign.center,
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
