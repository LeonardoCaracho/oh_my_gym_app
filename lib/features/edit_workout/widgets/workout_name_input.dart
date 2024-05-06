import 'package:flutter/material.dart';

class WorkoutNameInput extends StatefulWidget {
  const WorkoutNameInput({
    super.key,
    this.value = '',
    this.onChanged,
  });

  final String value;
  final ValueChanged<String>? onChanged;

  @override
  State<WorkoutNameInput> createState() => _WorkoutNameInputState();
}

class _WorkoutNameInputState extends State<WorkoutNameInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = widget.value;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      controller: _controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: 'Workout Name',
        isDense: true,
        hintStyle: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
