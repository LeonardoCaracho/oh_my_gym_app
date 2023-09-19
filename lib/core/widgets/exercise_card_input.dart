import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ExerciseCardInput extends StatefulWidget {
  const ExerciseCardInput({
    super.key,
    this.hintText,
    this.onChanged,
    this.value,
    this.isReadOnly = false,
    this.multiLine = false,
  });

  final String? hintText;
  final String? value;
  final ValueChanged<String>? onChanged;
  final bool isReadOnly;
  final bool multiLine;

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
      minLines: 1,
      maxLines: widget.multiLine ? 3 : 1,
      keyboardType:
          widget.multiLine ? TextInputType.multiline : TextInputType.number,
      decoration: InputDecoration(
        hintText: widget.hintText ?? '',
        isDense: true,
        hintStyle: const TextStyle(
          color: UIColors.white,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: UIColors.white),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: UIColors.white),
        ),
      ),
    );
  }
}
