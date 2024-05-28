// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:workout_repository/workout_repository.dart';

class MultiSelectDropdown extends StatefulWidget {
  const MultiSelectDropdown({
    required this.hint,
    required this.onChanged,
    super.key,
  });

  final String hint;
  final ValueChanged<List<Muscle>?> onChanged;

  @override
  _MultiSelectDropdownState createState() => _MultiSelectDropdownState();
}

class _MultiSelectDropdownState extends State<MultiSelectDropdown> {
  List<Muscle> _selectedValues = [];

  Future<void> _showMultiSelectDialog() async {
    final selectedValues = await showDialog<List<Muscle>>(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectDialog(
          initialSelectedValues: _selectedValues,
        );
      },
    );

    if (selectedValues != null) {
      widget.onChanged(selectedValues);
      setState(() {
        _selectedValues = selectedValues;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        const Icon(Icons.arrow_drop_down),
        GestureDetector(
          onTap: _showMultiSelectDialog,
          child: InputDecorator(
            decoration: InputDecoration(
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              contentPadding: EdgeInsets.zero,
            ),
            child: Text(
              _selectedValues.isEmpty
                  ? widget.hint
                  : _selectedValues
                      .map(
                        (e) => e.displayName(),
                      )
                      .join(', '),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      ],
    );
  }
}

class MultiSelectDialog extends StatefulWidget {
  final List<Muscle> initialSelectedValues;

  MultiSelectDialog({required this.initialSelectedValues});

  @override
  _MultiSelectDialogState createState() => _MultiSelectDialogState();
}

class _MultiSelectDialogState extends State<MultiSelectDialog> {
  List<Muscle> _selectedValues = [];

  @override
  void initState() {
    super.initState();
    _selectedValues = widget.initialSelectedValues;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: AppColors.backgroundSecondary,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: ListBody(
                children: [
                  ...Muscle.values.map((Muscle type) {
                    return CheckboxListTile(
                      title: Text(
                        type.displayName(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      value: _selectedValues.contains(type),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                            _selectedValues.add(type);
                          } else {
                            _selectedValues.remove(type);
                          }
                        });
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ColoredBox(
              color: AppColors.backgroundSecondary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop(_selectedValues);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
