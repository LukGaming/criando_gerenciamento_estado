import 'package:criando_gerenaciamento_estado/builders/observable_builder.dart';
import 'package:flutter/material.dart';

import '../controllers/observable_counter.dart';
import '../../observable_builder_test.dart';

@visibleForTesting
class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  final _counter = ObservableCounter();
  @visibleForTesting
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ObservableBuilder(
          observable: _counter,
          builder: (context, child) {
            return Text("Valor do counter: ${_counter.count}");
          },
        ),
        ElevatedButton(
          key: const Key(incrementButtonKey),
          onPressed: () {
            _counter.increment();
          },
          child: const Text("Increment"),
        )
      ],
    );
  }
}
