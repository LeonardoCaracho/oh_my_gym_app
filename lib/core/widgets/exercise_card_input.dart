import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ExerciseCardInput extends StatefulWidget {
  const ExerciseCardInput({
    super.key,
    this.hintText,
    this.onChanged,
    this.value,
    this.isReadOnly = false,
  });

  final String? hintText;
  final String? value;
  final ValueChanged<String>? onChanged;
  final bool isReadOnly;

  @override
  State<ExerciseCardInput> createState() => _ExerciseCardInputState();
}

class _ExerciseCardInputState extends State<ExerciseCardInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    if (widget.value != null) {
      _controller.text = widget.value!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: widget.isReadOnly,
      controller: _controller,
      onChanged: widget.onChanged,
      style: UITextStyle.bodyText3,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 3,
          horizontal: 3,
        ),
        isDense: true,
        hintText: widget.hintText,
        filled: true,
        fillColor: UIColors.white.withOpacity(0.5),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
