import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {"name": "T-Shirt", "image": "1.png"},
    {"name": "Sneakers", "image": "2.png"},
    {"name": "Varsity", "image": "3.png"},
    {"name": "Hats", "image": "4.png"},
    {"name": "Hoodie", "image": "5.png"},
    {"name": "Shirt", "image": "6.png"},
    {"name": "Slippers", "image": "7.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.transparent, // Grey
                  spreadRadius: 1,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'images/${category['image']}',
                  width: 40,
                  height: 40,
                ),
                SizedBox(width: 8), // Space between image and text
                Text(
                  category['name']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.red.shade900, // Merah gelap
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}