import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Icon(
            Icons.sort,
            size: 30,
            color: Colors.red.shade900, // Merah gelap
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Lixie.Co",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B0000),
              ),
            ),
          ),
          Spacer(),
          badges.Badge(
            badgeColor: Colors.red, // Merah
            padding: EdgeInsets.all(7),
            badgeContent: Text(
              "3",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "cartPage");
              },
              child: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black, // Hitam
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.add, color: Colors.grey), // Grey
            onPressed: () {
              Navigator.pushNamed(context, "addProductPage");
            },
          ),
        ],
      ),
    );
  }
}