import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testp/firstApp/model/products.dart';
import 'package:testp/firstApp/pages/cart_page.dart';
import 'package:testp/firstApp/provider/cart_provider.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int isFocusBox = 0;
  int isFocusColor = -1;
  Color photoBackground = Colors.grey;

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "Details",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: photoBackground),
                    child: Image.asset(
                      widget.product.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),

              // This column is start form Item name

              Container(
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.product.itemname,
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w800)),
                              PriceGesture(product: widget.product)
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(
                              widget.product.description,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(fontSize: 17),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              const SizedBox(
                                child: Text(
                                  "Available Size",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              Row(
                                children: [
                                  _sizeContainerBuilder(size: "US 6", index: 1),
                                  _sizeContainerBuilder(size: "US 7", index: 2),
                                  _sizeContainerBuilder(size: "US 8", index: 3)
                                ],
                              ),
                              const SizedBox(height: 20),
                              const SizedBox(
                                child: Text(
                                  "Available Color",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              Row(
                                children: [
                                  _availableColorBuilder(
                                      dynamicColor: Colors.green, index: 0),
                                  _availableColorBuilder(
                                      dynamicColor: Colors.purple, index: 1),
                                  _availableColorBuilder(
                                      dynamicColor: Colors.red, index: 2),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Colors.blueGrey,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Text(
                        '\$ ${widget.product.price}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 32,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 9, 145, 212),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            minimumSize: const Size(180, 50)),
                        onPressed: () {
                          provider.toggleCart(widget.product);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CartPage()));
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.send,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Add To Cart',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  // available size container
  _sizeContainerBuilder({String size = "", int index = 0}) => GestureDetector(
        onTap: () {
          setState(() {
            isFocusBox = isFocusBox == index ? -1 : index;
          });
        },
        child: Container(
          width: 60,
          height: 50,
          margin: const EdgeInsets.only(right: 20, top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: isFocusBox == index
                      ? Colors.yellow
                      : Colors.yellow.shade300,
                  width: isFocusBox == index ? 4 : 2,
                  strokeAlign: BorderSide.strokeAlignInside)),
          child: Center(
              child: Text(
            size,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          )),
        ),
      );

// available color container
  _availableColorBuilder({required Color dynamicColor, required int index}) =>
      GestureDetector(
        onTap: () {
          setState(() {
            isFocusColor = isFocusColor == index ? -1 : index;
            photoBackground = isFocusColor == 0
                ? Colors.green
                : isFocusColor == 1
                    ? Colors.purple
                    : isFocusColor == 2
                        ? Colors.red
                        : Colors.grey;
          });
        },
        child: Container(
          margin: const EdgeInsets.only(right: 20, top: 15),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: dynamicColor,
              border: Border.all(
                  color: isFocusColor == index
                      ? const Color.fromARGB(255, 40, 115, 243)
                      : Colors.transparent,
                  width: 4,
                  strokeAlign: BorderSide.strokeAlignInside)),
        ),
      );
}

// Price color changer
class PriceGesture extends StatefulWidget {
  final Product product;

  const PriceGesture({super.key, required this.product});

  @override
  State<PriceGesture> createState() => _PriceGestureState();
}

class _PriceGestureState extends State<PriceGesture> {
  Color textcolor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          textcolor = textcolor == Colors.black ? Colors.purple : Colors.black;
        });
      },
      child: Text('\$' '${widget.product.price}',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: textcolor)),
    );
  }
}
