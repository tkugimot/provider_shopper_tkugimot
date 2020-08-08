import 'package:flutter_test/flutter_test.dart';
import 'package:provider_shopper_tkugimot/models/CatalogModel.dart';

void main() {
  test('get first item from CatalogModel', () {
    final catalog = CatalogModel();
    final actual = catalog.getById(1);
    final expected = new Item(1, 'Control Flow');
    expect(actual, expected);
  });
}
