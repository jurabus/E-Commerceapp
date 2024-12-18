import 'package:ecommerceapp/data/data_providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart!'),
      ),
      body: cartProvider.cartList.isEmpty
          ? Center(
              child: Text('Your cart is empty'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: cartProvider.cartList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  cartProvider.cartList[index]?['image'] ?? ''),
                            ),
                            title: Text(
                                cartProvider.cartList[index]?['title'] ?? ''),
                            subtitle: Text(
                                '\$ ${(cartProvider.cartList[index]?['price'] ?? '0').toString()}'),
                            trailing: InkWell(
                              onTap: () {
                                cartProvider.removeFromCart(index: index);
                              },
                              child: Icon(Icons.delete),
                            ));
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text('Total  ${cartProvider.totalPrice.toString()}'),
                )
              ],
            ),
    );
  }
}
