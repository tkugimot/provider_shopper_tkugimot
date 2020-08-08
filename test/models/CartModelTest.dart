import 'package:flutter_test/flutter_test.dart';
import 'package:provider_shopper_tkugimot/models/CartModel.dart';
import 'package:provider_shopper_tkugimot/models/CatalogModel.dart';

void main() {
  test('adding item increases total cost', () {
    final cart = CartModel();
    final startingPrice = cart.totalPrice;
    cart.add(Item(1, 'Summer'));
    cart.addListener(() {
      expect(cart.totalPrice, greaterThan(startingPrice));
    });
  });
}
