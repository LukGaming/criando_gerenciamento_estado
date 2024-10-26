import 'package:criando_gerenaciamento_estado/controllers/change_state.dart';
import 'package:criando_gerenaciamento_estado/controllers/state_observable.dart';
import 'package:flutter/material.dart';

mixin ChangeStateMixin<T extends StatefulWidget> on State<T> {
  final List<ChangeState> _changeStates = [];

  void useChangeState(ChangeState changeState) {
    changeState.addListener(_callback);
    _changeStates.add(changeState);
  }

  StateObservable<T> useStateObservable<T>(T state) {
    final stateObservable = StateObservable<T>(state);
    stateObservable.addListener(_callback);
    _changeStates.add(stateObservable);
    return stateObservable;
  }

  void _callback() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    for (ChangeState changeState in _changeStates) {
      changeState.removeListener(_callback);
    }
    super.dispose();
  }
}
