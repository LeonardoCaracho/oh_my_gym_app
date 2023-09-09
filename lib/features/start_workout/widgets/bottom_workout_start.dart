import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:oh_my_gym_app/features/start_workout/start_workout.dart';

class BottomWorkoutStart extends StatefulWidget {
  const BottomWorkoutStart({
    super.key,
  });

  @override
  State<BottomWorkoutStart> createState() => _BottomWorkoutStartState();
}

class _BottomWorkoutStartState extends State<BottomWorkoutStart> {
  late TimerController timerController;

  @override
  void initState() {
    timerController = TimerController();
    timerController.start();
    super.initState();
  }

  @override
  void dispose() {
    timerController.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StartWorkoutCubit, StartWorkoutState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          Navigator.of(context).pop();
        }
      },
      child: Container(
        width: double.infinity,
        color: UIColors.lightPurple,
        child: Column(
          children: [
            const SizedBox(height: 8),
            Text(
              'The timer is running baby!',
              style: UITextStyle.headline4,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ValueListenableBuilder<Duration>(
                valueListenable: timerController.countdownNotifier,
                builder: (context, duration, child) {
                  return Text(
                    duration.getFormattedCountdown(),
                    style: UITextStyle.headline3,
                  );
                },
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 20),
                ValueListenableBuilder<bool>(
                  valueListenable: timerController.isRunningNotifier,
                  builder: (context, isRunning, child) {
                    return Expanded(
                      child: isRunning
                          ? DefaultButton(
                              text: 'PAUSE',
                              onPressed: timerController.stop,
                            )
                          : DefaultButton(
                              text: 'PLAY',
                              onPressed: timerController.play,
                            ),
                    );
                  },
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: DefaultButton(
                    text: 'FINISH',
                    onPressed: () => finishWorkoutDialog(context),
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void finishWorkoutDialog(BuildContext context) {
    final startWorkoutCubit = context.read<StartWorkoutCubit>();

    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: startWorkoutCubit,
          child: Builder(
            builder: (context) {
              return AlertDialog(
                backgroundColor: UIColors.liver,
                title: const Text('FINISH WORKOUT'),
                content: const Text('Are you really finished?'),
                actions: [
                  DefaultButton(
                    text: 'CANCEL',
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  DefaultButton(
                    text: 'YES',
                    onPressed: () {
                      context.read<StartWorkoutCubit>().finishWorkout();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
