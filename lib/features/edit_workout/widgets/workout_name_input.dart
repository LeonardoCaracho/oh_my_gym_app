import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class WorkoutNameInput extends StatefulWidget {
  const WorkoutNameInput({
    super.key,
    this.value,
    this.onChanged,
  });

  final String? value;
  final ValueChanged<String>? onChanged;

  @override
  State<WorkoutNameInput> createState() => _WorkoutNameInputState();
}

class _WorkoutNameInputState extends State<WorkoutNameInput> {
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
      controller: _controller,
      cursorColor: UIColors.lightDark,
      style: const TextStyle(
        color: UIColors.white,
      ),
      onChanged: widget.onChanged,
      decoration: const InputDecoration(
        hintText: 'Workout Name',
        isDense: true,
        hintStyle: TextStyle(
          color: UIColors.white,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: UIColors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: UIColors.white),
        ),
      ),
    );
  }
}
