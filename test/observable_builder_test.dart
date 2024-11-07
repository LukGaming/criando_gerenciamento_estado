import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'testable/widgets/counter_widget.dart';

void main() {
  group("Should test ObservableBuilder", () {
    testWidgets("Should test increment Widget", (widgetTests) async {
      await widgetTests.pumpWidget(const MaterialApp(home: CounterWidget()));
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
