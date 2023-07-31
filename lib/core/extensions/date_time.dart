// ignore_for_file: use_setters_to_change_properties

extension DateTimeMock on DateTime {
  static DateTime? _mockedDateTime;

  static void setMock(DateTime dateTime) {
    _mockedDateTime = dateTime;
  }

  static void resetMock() {
    _mockedDateTime = null;
  }

  static DateTime get current {
    return _mockedDateTime ?? DateTime.now();
  }
}
