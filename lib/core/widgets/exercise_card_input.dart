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
    return TextFormField(
      style: Theme.of(context).textTheme.bodyMedium,
      readOnly: widget.isReadOnly,
      controller: _controller,
      onChanged: widget.onChanged,
      minLines: 1,
      maxLines: widget.multiLine ? 3 : 1,
      textCapitalization: TextCapitalization.sentences,
      keyboardType: widget.multiLine ? TextInputType.multiline : TextInputType.text,
      decoration: InputDecoration(
        hintText: widget.hintText ?? '',
        isDense: true,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
