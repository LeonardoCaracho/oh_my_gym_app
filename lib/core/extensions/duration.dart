extension DurationX on Duration {
  String getFormattedCountdown() {
    String strDigits(int n) => n.toString().padLeft(2, '0');

    final hours = strDigits(inHours.remainder(24));
    final minutes = strDigits(inMinutes.remainder(60));
    final seconds = strDigits(inSeconds.remainder(60));

    return '$hours:$minutes:$seconds';
  }
}
