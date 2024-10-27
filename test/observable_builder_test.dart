import 'package:criando_gerenaciamento_estado/builders/observable_builder.dart';
import 'package:criando_gerenaciamento_estado/controllers/change_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Should test ObservableBuilder", () {
    testWidgets("Should test increment Widget", (widgetTests) async {
      await widgetTests.pumpWidget(const MaterialApp(home: _CounterWidget()));
      final findText = find.text("Valor do counter: 0");

      final findButton = find.byKey(const Key(incrementButtonKey));

      expect(findText, findsOneWidget);

      expect(findButton, findsOneWidget);

      await widgetTests.tap(findButton);
      await widgetTests.pump();

      final nextCounterText = find.text("Valor do counter: 1");

      expect(nextCounterText, findsOneWidget);
    });
  });
}

const incrementButtonKey = "increment_key";

class _CounterWidget extends StatefulWidget {
  const _CounterWidget({super.key});

  @override
  State<_CounterWidget> createState() => __CounterWidgetState();
}

class __CounterWidgetState extends State<_CounterWidget> {
  final _counter = _ObservableCounter();
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

class _ObservableCounter extends ChangeState {
  int count = 0;

  void increment() {
    count++;
    notifyCallback();
  }
}
