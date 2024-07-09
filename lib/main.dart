import 'package:flutter/material.dart';
import 'package:shopping/pages/add_product_page.dart';
import 'package:shopping/pages/cart_page.dart';
import 'package:shopping/pages/home_page.dart';
import 'package:shopping/pages/item_page.dart';
import 'package:shopping/pages/salespage.dart';
import 'package:shopping/pages/stockpage.dart';
import 'package:shopping/pages/checkout_page.dart'; // Import halaman checkout

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
      ),
      routes: {
        "/": (context) => HomePage(),
        "cartPage": (context) => CartPage(),
        "itemPage": (context) => ItemPage(),
        "stockPage": (context) => StockPage(),
        "salesPage": (context) => SalesPage(),
        "addProductPage": (context) => AddProductPage(),
        "checkoutPage": (context) => CheckoutPage(), // Rute untuk halaman checkout
      },
    );
  }
}