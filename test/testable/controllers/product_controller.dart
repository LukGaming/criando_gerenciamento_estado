import 'package:criando_gerenaciamento_estado/controllers/state_observable.dart';
import 'package:flutter/material.dart';

import '../entities/product_entity.dart';
import '../states/base_state.dart';

@visibleForTesting
class ProductController extends StateObservable<BaseState> {
  ProductController() : super(InitialState());
  @visibleForTesting
  void getProducts() {
    state = LoadingState();

    state = SuccessState(
      data: [
        Product(id: 1, name: "Primeiro produto"),
        Product(id: 1, name: "Primeiro produto"),
      ],
    );
  }

  @visibleForTesting
  void generateError() {
    state = LoadingState();

    try {
      throw Exception();
    } catch (e) {
      state = ErrorState(message: e.toString());
    }
  }
}
