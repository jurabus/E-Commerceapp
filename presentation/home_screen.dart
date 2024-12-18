import 'package:ecommerceapp/data/data_providers/products_provider.dart';
import 'package:ecommerceapp/presentation/cart_screen.dart';
import 'package:ecommerceapp/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<ProductsProvider>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    var productsProvider = Provider.of<ProductsProvider>(context);
    return Scaffold(
      appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartScreen()));
                },
                child: Icon(Icons.shopping_bag),
              ),
            )
          ],
          title: Text(
            'Shop anywhere, anytime!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true),
      body: productsProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: productsProvider.productsList.length,
              itemBuilder: (context, index) {
                return ProductCard(
                    title: productsProvider.productsList[index]['title'],
                    imageUrl: productsProvider.productsList[index]['image'],
                    price: productsProvider.productsList[index]['price'],
                    description: productsProvider.productsList[index]
                        ['description']);
              }),
    );
  }
}
