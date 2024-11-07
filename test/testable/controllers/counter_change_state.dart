import 'package:criando_gerenaciamento_estado/controllers/change_state.dart';
import 'package:flutter/material.dart';

@visibleForTesting
class CounterChangeState extends ChangeState {
  int counter = 0;
  @visibleForTesting
  void increment() {
    counter++;
    notifyCallback();
  }
}
