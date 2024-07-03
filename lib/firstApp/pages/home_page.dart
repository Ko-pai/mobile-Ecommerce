// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:testp/firstApp/model/all_product_page.dart';
import 'package:testp/firstApp/pages/product_detail_page.dart';
import 'package:testp/firstApp/widget/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Our Product",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _categoryButtons(name: "All Products", index: 0),
              _categoryButtons(name: "Jackets", index: 1),
              _categoryButtons(name: "Shoes", index: 2),
            ],
          ),
          Expanded(
              child: isSelected == 0
                  ? _buildProductContainer()
                  : isSelected == 1
                      ? _jacketContainerBuilder(
                          item: AllProduct.jacketProduct, size: (100 / 200))
                      : _jacketContainerBuilder(
                          item: AllProduct.shoesProduct, size: (100 / 180)))
        ],
      ),
    ));
  }

  _categoryButtons({int index = 0, String name = ""}) => GestureDetector(
        onTap: () {
          setState(() {
            isSelected = index;
          });
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected == index
                ? Colors.redAccent
                : Colors.redAccent.shade100,
          ),
          padding: const EdgeInsets.all(12),
          child: Text(
            name,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      );

  _buildProductContainer() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (100 / 200),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12),
        scrollDirection: Axis.vertical,
        itemCount: AllProduct.allProducts.length,
        itemBuilder: (context, index) {
          final allproducts = AllProduct.allProducts[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailPage(product: allproducts)));
            },
            child: ProductCard(product: allproducts),
          );
        },
      );

  _jacketContainerBuilder({List item = const [], double size = 0}) =>
      GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (size),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12),
        itemCount: item.length,
        itemBuilder: (context, index) {
          final jackets = item[index];
          return ProductCard(product: jackets);
        },
      );

  // _shoesContainerBuilder() => GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 , crossAxisSpacing: 12 , childAspectRatio: ), itemBuilder: itemBuilder)
}
