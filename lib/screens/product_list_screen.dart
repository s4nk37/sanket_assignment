import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/product_item.dart';
import '../providers/products.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    productsData.fetchAndSetProducts();
    Size size = MediaQuery.of(context).size;
    print(size.width);

    return Scaffold(
      appBar: AppBar(
        title: const Text("eCommerce App"),
        actions: [
          //Filter Button
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list),
          )
        ],
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(15.0),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent:
                size.width < 450 ? size.width / 2 : size.width / 3,
            crossAxisSpacing:
                size.width < 450 ? size.width / 30 : size.width / 40,
            childAspectRatio: size.width < 450 ? 1 : 1.2,
          ),
          itemCount: productsData.items.length,
          itemBuilder: (ctx, index) {
            return ProductItem(
              title: productsData.items[index].name,
              url: productsData.items[index].images.isEmpty
                  ? "https://placehold.co/600x400.jpg?text=No+Image+Found"
                  : productsData.items[index].images[0]['photo'],
              price: productsData.items[index].price,
              discount: productsData.items[index].discount.toString(),
              id: productsData.items[index].product_number,
            );
          },
        ),
      ),
    );
  }
}
