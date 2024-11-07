import 'package:criando_gerenaciamento_estado/controllers/change_state.dart';
import 'package:flutter/material.dart';

@visibleForTesting
class ObservableCounter extends ChangeState {
  int count = 0;
  @visibleForTesting
  void increment() {
    count++;
    notifyCallback();
  }
}
