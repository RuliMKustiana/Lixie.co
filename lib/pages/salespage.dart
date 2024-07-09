import 'package:flutter/material.dart';

class SalesPage extends StatelessWidget {
  final List<Map<String, dynamic>> salesData = [
    {"item": "Produk A", "sales": 300},
    {"item": "Produk B", "sales": 150},
    {"item": "Produk C", "sales": 250},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales'),
        backgroundColor: Color(0xFF8B0000), // Merah Gelap
      ),
      body: ListView.builder(
        itemCount: salesData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              salesData[index]["item"],
              style: TextStyle(
                color: Colors.black, // Hitam
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "Sales: ${salesData[index]["sales"]}",
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
    );
  }
}
