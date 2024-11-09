abstract class IStreamNotifier<T> {
  T get state;

  Stream<T> get stream;

  void emit(T newState);

  Future<void> dispose();
}
