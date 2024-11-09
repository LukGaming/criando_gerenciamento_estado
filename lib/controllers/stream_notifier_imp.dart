import 'dart:async';

import 'package:criando_gerenaciamento_estado/contracts/stream_notifier.dart';

class StreamNotifier<T> implements IStreamNotifier<T> {
  StreamNotifier(this._state);

  T _state;

  @override
  T get state => _state;

  @override
  Stream<T> get stream => _streamController.stream;

  final StreamController<T> _streamController = StreamController<T>();

  @override
  void emit(T newState) {
    if (_state == newState) return;
    _state = newState;
    _streamController.add(newState);
  }

  @override
  Future<void> dispose() async {
    await _streamController.close();
  }
}
