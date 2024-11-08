import 'package:criando_gerenaciamento_estado/extensions/state_observable_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Testing reactive primitives", () {
    test("Should test the reactive [int]", () {
      bool callbackExecuted = false;
      //arrange
      final observableInt = 0.obs();

      observableInt.addListener(() {
        callbackExecuted = true;
      });

      //act
      observableInt.state++;

      //assert
      expect(observableInt.state, 1);
      expect(callbackExecuted, true);
    });

    test("Should test the reactive [double]", () {
      bool callbackExecuted = false;
      //arrange
      final observableInt = 0.0.obs();

      observableInt.addListener(() {
        callbackExecuted = true;
      });

      //act
      observableInt.state += 1.25;

      //assert
      expect(observableInt.state, 1.25);
      expect(callbackExecuted, true);
    });

    test("Should test the reactive [String]", () {
      bool callbackExecuted = false;
      //arrange
      final observableInt = "Hello".obs();

      observableInt.addListener(() {
        callbackExecuted = true;
      });

      //act
      observableInt.state += " world";

      //assert
      expect(observableInt.state, "Hello world");
      expect(callbackExecuted, true);
    });

    test("Should test the reactive [Boolean]", () {
      bool callbackExecuted = false;
      //arrange
      final observableInt = false.obs();

      observableInt.addListener(() {
        callbackExecuted = true;
      });

      //act
      observableInt.state = true;

      //assert
      expect(observableInt.state, true);
      expect(callbackExecuted, true);
    });
  });
}
