import 'dart:async';

import 'package:flutter/material.dart';

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
