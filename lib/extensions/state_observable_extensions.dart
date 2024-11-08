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

//int
///
/// 0.obs()
//
extension ReactiveInt on int {
  /// Create a reactive class from a primitive int
  ///
  /// Example: 0.obs()
  ///
  StateObservable<int> obs() => StateObservable(this);
}

//double
// 0.0.obs()

extension ReactiveDouble on double {
  /// Create a reactive class from a primitive double
  ///
  /// Example: 1.0.obs()
  ///
  StateObservable<double> obs() => StateObservable(this);
}

//String
//"Hello".obs()

extension ReactiveString on String {
  /// Create a reactive class from a primitive String
  ///
  /// Example: "Hello".obs()
  ///
  StateObservable<String> obs() => StateObservable(this);
}

//boolean
//false.obs()

extension ReactiveBoolean on bool {
  /// Create a reactive class from a primitive boolean
  ///
  /// Example: false.obs()
  ///
  StateObservable<bool> obs() => StateObservable(this);
}
