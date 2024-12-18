import 'package:ecommerceapp/data/data_providers/cart_provider.dart';
import 'package:ecommerceapp/presentation/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  String title;
  String imageUrl;
  var price;
  String description;
  ProductDetailsScreen(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.price,
      required this.description});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var addtoCart = Provider.of<CartProvider>(context).addToCart;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 5),
                    Column(
                      children: [
                        Image(
                          image: NetworkImage(widget.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        Text(
                          '\$ ${widget.price}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.description,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          addtoCart(
                              imageUrl: widget.imageUrl,
                              price: widget.price,
                              title: widget.title);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CartScreen()));
                        },
                        child: Text('Add to Cart'))
                  ],
                );
              })),
    );
  }
}
