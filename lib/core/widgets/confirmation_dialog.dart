import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';

Future<bool> confirmationDialog(
  BuildContext context, {
  String title = '',
  String content = '',
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        buttonPadding: const EdgeInsets.all(8),
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        backgroundColor: AppColors.backgroundSecondary,
        elevation: 0,
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
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
                  btnColor: Colors.transparent,
                  text: 'NO',
                  onPressed: () => Navigator.of(context).pop(false),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: DefaultButtonSmall(
                  text: 'YES',
                  btnColor: Colors.transparent,
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
