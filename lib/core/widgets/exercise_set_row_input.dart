import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class ExerciseSetRowInput extends StatefulWidget {
  const ExerciseSetRowInput({
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
  State<ExerciseSetRowInput> createState() => _ExerciseSetRowInputState();
}

class _ExerciseSetRowInputState extends State<ExerciseSetRowInput> {
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
    return Container(
      margin: const EdgeInsets.only(
        right: 6,
        bottom: 6,
      ),
      width: 20,
      child: TextField(
        readOnly: widget.isReadOnly,
        controller: _controller,
        onChanged: widget.onChanged,
        style: UITextStyle.bodyText3,
        minLines: 1,
        maxLines: widget.multiLine ? 3 : 1,
        textAlign: TextAlign.center,
        cursorColor: UIColors.white,
        keyboardType:
            widget.multiLine ? TextInputType.multiline : TextInputType.number,
        decoration: InputDecoration(
          filled: true,
          fillColor: UIColors.backgroundDark.withOpacity(0.5),
          hintText: widget.hintText ?? '',
          isDense: true,
          hintStyle: const TextStyle(
            color: UIColors.white,
          ),
          border: const UnderlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
    );
  }
}
