import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';

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
        style: Theme.of(context).textTheme.bodyMedium,
        readOnly: widget.isReadOnly,
        controller: _controller,
        onChanged: widget.onChanged,
        minLines: 1,
        maxLines: widget.multiLine ? 3 : 1,
        textAlign: TextAlign.center,
        keyboardType: widget.multiLine
            ? TextInputType.multiline
            : const TextInputType.numberWithOptions(
                signed: true,
                decimal: true,
              ),
        decoration: InputDecoration(
          hintText: widget.hintText ?? '',
          isDense: true,
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          border: const UnderlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
    );
  }
}
