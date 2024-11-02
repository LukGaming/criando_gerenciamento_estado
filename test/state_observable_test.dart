import 'package:criando_gerenaciamento_estado/controllers/state_observable.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Should test StateObservable", () {
    test("Should update state correctly when we increment counter", () {
      //Arrange
      final counterState = StateObservable(0);
      //Act

      counterState.state++;

      //Assert

      expect(counterState.state, 1);
    });

    test("Should execute StateObservable callcack when we incrementCounter",
        () {
      //Arrange
      bool isCallbackExecuted = false;
      final counterState = StateObservable(0);

      //Act

      void callback() {
        isCallbackExecuted = true;
      }

      counterState.addListener(callback);

      counterState.state++;

      //Assert

      expect(counterState.state, 1);

      expect(isCallbackExecuted, true);
    });
  });

  test("Should gerenate SuccessState when we call (getProducts)", () {
    //Arrange
    final ProductController productController = ProductController();
    expect(productController.state, isA<InitialState>());

    //Act
    productController.getProducts();

    //Assert

    expect(productController.state, isA<SuccessState>());
  });
}

abstract class BaseState {}

class InitialState extends BaseState {}

class LoadingState extends BaseState {}

class SuccessState<T extends Object> extends BaseState {
  final T data;
  SuccessState({required this.data});
}

class ErrorState extends BaseState {
  final String message;

  ErrorState({required this.message});
}

class Product {
  final int id;
  final String name;

  Product({required this.id, required this.name});
}

class ProductController extends StateObservable<BaseState> {
  ProductController() : super(InitialState());

  void getProducts() {
    state = LoadingState();

    state = SuccessState(
      data: [
        Product(id: 1, name: "Primeiro produto"),
        Product(id: 1, name: "Primeiro produto"),
      ],
    );
  }
}
