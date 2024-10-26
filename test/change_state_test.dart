import 'package:criando_gerenaciamento_estado/controllers/change_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Should test ChangeState", () {
    test("Should increment counter", () {
      //Arrange
      final _CounterChangeState changeState = _CounterChangeState();

      //Act
      changeState.increment();

      //Assert
      expect(changeState.counter, 1);
    });

    test("Should execute callback", () {
      //Arrange
      bool callbackExecuted = false;
      final _CounterChangeState changeState = _CounterChangeState();

      void callback() {
        callbackExecuted = true;
      }

      //Act
      changeState.addListener(callback);

      changeState.increment();

      //Assert
      expect(changeState.counter, 1);
      expect(callbackExecuted, true);
    });
  });
}

class _CounterChangeState extends ChangeState {
  int counter = 0;

  void increment() {
    counter++;
    notifyCallback();
  }
}
