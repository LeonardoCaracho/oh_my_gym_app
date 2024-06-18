import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/exercises/models/dropdown_option.dart';

class SelectDropdown<T> extends StatefulWidget {
  const SelectDropdown({
    required this.placeholder,
    required this.options,
    required this.onChanged,
    super.key,
  });

  final String placeholder;
  final List<DropdownOption<T>> options;
  final ValueChanged<DropdownOption<T>?> onChanged;

  @override
  _SelectDropdownState createState() => _SelectDropdownState<T>();
}

class _SelectDropdownState<T> extends State<SelectDropdown<T>> {
  DropdownOption<T>? _selectedValue;

  Future<void> _showSelectDialog() async {
    final selectedValue = await showDialog<DropdownOption<T>>(
      context: context,
      builder: (BuildContext context) {
        return SelectDialog(
          initialSelectedValue: _selectedValue,
          options: widget.options,
        );
      },
    );

    if (selectedValue != null) {
      widget.onChanged(selectedValue);
      setState(() {
        _selectedValue = selectedValue;
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
          onTap: _showSelectDialog,
          child: InputDecorator(
            decoration: InputDecoration(
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              contentPadding: EdgeInsets.zero,
            ),
            child: Text(
              _selectedValue == null ? widget.placeholder : _selectedValue!.title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      ],
    );
  }
}

class SelectDialog<T> extends StatelessWidget {
  const SelectDialog({
    required this.initialSelectedValue,
    required this.options,
    super.key,
  });

  final T? initialSelectedValue;
  final List<DropdownOption<T>> options;

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: AppColors.backgroundSecondary,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: ListBody(
            children: [
              ...options.map((DropdownOption<T> option) {
                return ListTile(
                  title: Text(
                    option.title,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onTap: () {
                    Navigator.of(context).pop(option);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
