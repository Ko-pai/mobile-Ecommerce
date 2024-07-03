import 'package:flutter/material.dart';
import 'package:testp/firstApp/model/products.dart';
import 'package:testp/firstApp/provider/favourite_provider.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final provider = FavouriteProvider.of(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.grey.shade300),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerRight,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(0, 5, 10, 10),
            child: GestureDetector(
              onTap: () => provider.toggleFavourite(widget.product),
              child: Icon(
                provider.isExist(widget.product)
                    ? Icons.favorite
                    : Icons.favorite_outline,
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(
            width: 140,
            height: 140,
            child: Image.asset(
              widget.product.image,
              fit: BoxFit.fill,
              alignment: Alignment.bottomCenter,
              color: Colors.grey.shade300,
              colorBlendMode: BlendMode.multiply,
            ),
          ),
          Text(
            widget.product.itemname,
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.product.category,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 17,
            ),
          ),
          Text(
            '\$ ' '${widget.product.price}',
            style: TextStyle(
                color: Colors.blue.shade900,
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class favouriteIconClick extends StatefulWidget {
  const favouriteIconClick({super.key});

  @override
  State<favouriteIconClick> createState() => _favouriteIconClickState();
}

class _favouriteIconClickState extends State<favouriteIconClick> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            isActive = !isActive;
          });
        },
        icon: isActive
            ? const Icon(
                Icons.favorite,
                color: Colors.redAccent,
              )
            : const Icon(Icons.favorite_outline));
  }
}
