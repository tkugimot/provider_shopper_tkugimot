import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopper_tkugimot/models/CartModel.dart';
import 'package:provider_shopper_tkugimot/models/CatalogModel.dart';
import 'package:provider_shopper_tkugimot/screens/CartScreen.dart';
import 'package:provider_shopper_tkugimot/screens/CatalogScreen.dart';

import 'common/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return MultiProvider(
      providers: [
        // In this sample app, CatalogModel never changes, so a simple Provider
        // is sufficient.
        Provider(create: (context) => CatalogModel()),
        // CartModel is implemented as a ChangeNotifier, which calls for the use
        // of ChangeNotifierProvider. Moreover, CartModel depends
        // on CatalogModel, so a ProxyProvider is needed.
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Test',
        theme: appTheme,
        initialRoute: '/catalog',
        routes: {
          '/catalog': (context) => MyCatalog(),
          '/cart': (context) => MyCart(),
        },
      ),
    );
  }
}