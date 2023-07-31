enum Status {
  inital,
  loading,
  success,
  failure,
}

extension StatusX on Status {
  bool get isInital => this == Status.inital;
  bool get isLoading => this == Status.loading;
  bool get isSuccess => this == Status.success;
  bool get isFailure => this == Status.failure;
}
