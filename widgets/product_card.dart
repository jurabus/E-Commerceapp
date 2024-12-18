import 'package:ecommerceapp/data/data_providers/products_provider.dart';
import 'package:ecommerceapp/presentation/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  String title;
  var price;
  String imageUrl;
  String description;

  ProductCard(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.price,
      required this.description});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    Provider.of<ProductsProvider>(context).productsList;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          SizedBox(height: 8),
          SizedBox(
              height: 100,
              width: 100,
              child: Image(image: NetworkImage(widget.imageUrl))),
          Text(' \$ ${widget.price.toString()}'),
          Text(widget.description),
          SizedBox(height: 8),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDetailsScreen(
                            title: widget.title,
                            description: widget.description,
                            imageUrl: widget.imageUrl,
                            price: widget.price,
                          )));
            },
            child: Text(
              'View details',
              style: TextStyle(color: Colors.amber),
            ),
          )
        ],
      ),
    );
  }
}
