import 'package:flutter/material.dart';
import '../screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  final int id;
  final String title;
  final String url;
  final String price;
  final String discount;

  const ProductItem(
      {super.key,
      required this.title,
      required this.url,
      required this.price,
      required this.discount,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => ProductDetailsScreen(
                      id: id,
                    )));
      },
      borderRadius: BorderRadius.circular(15),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            height: 130,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12, width: 2),
              borderRadius: BorderRadius.circular(20),
              image:
                  DecorationImage(image: NetworkImage(url), fit: BoxFit.fill),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.yellow.withOpacity(0.4),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Text(
              title.length > 22
                  ? title.replaceRange(22, title.length, '..')
                  : title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.4),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Rs. $price",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Flat $discount% off",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
