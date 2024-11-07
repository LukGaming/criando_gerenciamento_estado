import 'dart:async';

import 'package:criando_gerenaciamento_estado/controllers/state_observable.dart';
import 'package:flutter/material.dart';

@visibleForTesting
extension ObservableStream<T> on StateObservable<T> {
  @visibleForTesting
  Stream<T> asStream() {
    StreamController<T> streamController = StreamController<T>();

    streamController.add(state); //InitialState

    void callback() {
      streamController.add(state); //Loading -> SuccessState
    }

    addListener(callback);

    return streamController.stream;
  }
}

@visibleForTesting
extension ObservableValueNotifier<T> on ValueNotifier<T> {
  @visibleForTesting
  Stream<T> asStream() {
    StreamController<T> streamController = StreamController<T>();

    streamController.add(value);

    void callback() {
      streamController.add(value);
    }

    addListener(callback);

    return streamController.stream;
  }
}
