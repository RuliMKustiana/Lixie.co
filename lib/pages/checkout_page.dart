import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Color(0xFF8B0000), // Merah Gelap
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rincian Pembelian',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B0000), // Merah Gelap
              ),
            ),
            // Tambahkan rincian produk yang dibeli di sini
            Expanded(
              child: ListView(
                children: [
                  // Produk yang dibeli
                  ListTile(
                    leading: Icon(Icons.shopping_bag),
                    title: Text('Nama Produk'),
                    subtitle: Text('Deskripsi Produk'),
                    trailing: Text('Harga Produk'),
                  ),
                  // Tambahkan produk lainnya di sini
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Rp. Total Harga',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logika untuk menyelesaikan pembelian
                Navigator.pop(context);
              },
              child: Text('Selesaikan Pembelian'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, 
                backgroundColor: Color(0xFF8B0000),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
