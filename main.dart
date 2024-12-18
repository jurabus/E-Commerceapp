import 'package:ecommerceapp/data/data_providers/cart_provider.dart';
import 'package:ecommerceapp/data/data_providers/products_provider.dart';
import 'package:ecommerceapp/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ProductsProvider()),
          ChangeNotifierProvider(
            create: (context) => CartProvider(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData.dark(useMaterial3: true),
          title: 'E-Commerce APP',
          home: HomeScreen(),
        ));
  }
}
