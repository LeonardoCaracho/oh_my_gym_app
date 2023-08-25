import 'dart:async';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';

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
    return Container(
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
                  onPressed: () {
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
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
                              text: 'CONTINUE',
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
        ],
      ),
    );
  }
}

class TimerController {
  TimerController() {
    _myDuration = Duration.zero;
  }
  late Timer _countdown;
  late Duration _myDuration;
  ValueNotifier<Duration> countdownNotifier = ValueNotifier(Duration.zero);
  ValueNotifier<bool> isRunningNotifier = ValueNotifier(true);

  void start() {
    isRunningNotifier.value = true;
    _countdown = Timer.periodic(
      const Duration(seconds: 1),
      (_) => setCountDown(),
    );
  }

  void play() {
    isRunningNotifier.value = true;
    _countdown.cancel();
    start();
  }

  void stop() {
    isRunningNotifier.value = false;
    _countdown.cancel();
  }

  void setCountDown() {
    final seconds = _myDuration.inSeconds + 1;
    _myDuration = Duration(seconds: seconds);
    countdownNotifier.value = _myDuration;
  }
}
