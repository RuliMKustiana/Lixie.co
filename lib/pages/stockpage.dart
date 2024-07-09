import 'package:flutter/material.dart';

class StockPage extends StatelessWidget {
  final List<Map<String, dynamic>> stockData = [
    {"item": "Produk A", "stock": 100},
    {"item": "Produk B", "stock": 200},
    {"item": "Produk C", "stock": 150},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Produk'),
        backgroundColor: Color(0xFF8B0000), // Merah Gelap
      ),
      body: ListView.builder(
        itemCount: stockData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              stockData[index]["item"],
              style: TextStyle(
                color: Colors.black, // Hitam
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "Stock: ${stockData[index]["stock"]}",
              style: TextStyle(
                color: Colors.grey, // Abu-abu
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFFFF0000), // Merah
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "addProductPage");
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF8B0000), // Merah Gelap
      ),
    );
  }
}