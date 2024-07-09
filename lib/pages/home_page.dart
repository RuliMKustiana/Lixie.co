import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/pages/add_product_page.dart';
import 'package:shopping/pages/cart_page.dart';
import 'package:shopping/pages/checkout_page.dart';
import 'package:shopping/pages/item_page.dart';
import 'package:shopping/pages/salespage.dart';
import 'package:shopping/pages/stockpage.dart';
import 'package:shopping/widgets/home_appbar.dart';
import 'package:shopping/widgets/categories_widget.dart';
import 'package:shopping/widgets/items_widget.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'name': 'Produk 1',
      'description': 'Deskripsi Produk 1',
      'price': '100000',
      'image': 'https://via.placeholder.com/150'
    },
    {
      'name': 'Produk 2',
      'description': 'Deskripsi Produk 2',
      'price': '200000',
      'image': 'https://via.placeholder.com/150'
    },
    // Tambahkan produk lainnya di sini
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          HomeAppBar(),
          Container(
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search here...",
                          ),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.camera_alt,
                        size: 27,
                        color: Color(0xFF8B0000), // Merah Gelap
                      ),
                    ],
                  ),
                ),
                //Categories
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8B0000), // Merah Gelap
                    ),
                  ),
                ),
                //Categories Widget
                CategoriesWidget(),

                //Items
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    "Best Selling",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8B0000), // Merah Gelap
                    ),
                  ),
                ),

                //Items Widgets
                ItemsWidget(products),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, "cartPage");
          }
          // Add more navigation logic for other icons if needed
        },
        height: 70,
        color: Color(0xFF8B0000), // Merah Gelap
        items: [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            CupertinoIcons.cart_fill,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.list,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    routes: {
      "/": (context) => HomePage(),
      "cartPage": (context) => CartPage(),
      "itemPage": (context) => ItemPage(),
      "stockPage": (context) => StockPage(),
      "salesPage": (context) => SalesPage(),
      "addProductPage": (context) => AddProductPage(),
      "checkoutPage": (context) => CheckoutPage(), // Rute untuk halaman checkout
    },
  ));
}
