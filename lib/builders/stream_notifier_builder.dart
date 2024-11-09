import 'dart:async';

import 'package:criando_gerenaciamento_estado/contracts/stream_notifier.dart';
import 'package:flutter/material.dart';

class StreamNotifierBuilder<T> extends StatefulWidget {
  final IStreamNotifier<T> streamNotifier;
  final Widget Function(BuildContext context, T state) builder;
  final bool Function(T previous, T current)? buildWhen;
  final void Function(BuildContext context, T state)? listen;

  const StreamNotifierBuilder({
    super.key,
    required this.streamNotifier,
    required this.builder,
    this.buildWhen,
    this.listen,
  });

  @override
  State<StreamNotifierBuilder<T>> createState() =>
      _StreamNotifierBuilderState<T>();
}

class _StreamNotifierBuilderState<T> extends State<StreamNotifierBuilder<T>> {
  late StreamSubscription<T>? _streamSubscription;
  late T _state;

  @override
  void initState() {
    _state = widget.streamNotifier.state;
    _streamSubscription = widget.streamNotifier.stream.listen((newData) {
      if (_shouldRebuild(_state, newData)) {
        if (mounted) {
          widget.listen?.call(context, _state);
          setState(() {});
        }
      }
      _state = newData;
    });
    super.initState();
  }

  bool _shouldRebuild(T previous, T current) {
    return widget.buildWhen?.call(previous, current) ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _state);
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    _streamSubscription = null;
    super.dispose();
  }
}
