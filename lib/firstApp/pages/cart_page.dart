import 'package:flutter/material.dart';
import 'package:testp/firstApp/provider/cart_provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final productList = provider.cart;

    // ignore: no_leading_underscores_for_local_identifiers
    _buildProductQuantity(IconData icon, int index) {
      return GestureDetector(
          onTap: () {
            setState(() {
              icon == Icons.add
                  ? provider.increasementQuantity(index)
                  : provider.decreasementQuantity(index);
            });
          },
          child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueGrey,
              ),
              child: Icon(
                icon,
                size: 15,
                color: Colors.white,
              )));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        title: const Text("My Cart"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return Slidable(
                  endActionPane:
                      ActionPane(motion: const ScrollMotion(), children: [
                    SlidableAction(
                      onPressed: (context) {
                        productList[index].quantity = 1;
                        productList.removeAt(index);
                        setState(() {});
                      },
                      backgroundColor: Colors.red,
                      icon: Icons.delete,
                      label: "Delete",
                    )
                  ]),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.purple,
                      backgroundImage: AssetImage(productList[index].image),
                    ),
                    title: Text(
                      productList[index].itemname,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 22),
                    ),
                    subtitle: Text(
                      productList[index].description,
                      style: const TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                    trailing: Column(
                      children: [
                        _buildProductQuantity(Icons.add, index),
                        Text(
                          productList[index].quantity.toString(),
                          style: const TextStyle(fontSize: 13),
                        ),
                        _buildProductQuantity(Icons.remove, index)
                      ],
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 90,
        decoration: const BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$ ${provider.getTotalPrice()}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150, 50),
                      backgroundColor: const Color.fromARGB(255, 9, 145, 212),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Text('Checkout',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      SizedBox(width: 30),
                      Icon(
                        Icons.send,
                        size: 30,
                        color: Colors.white,
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
