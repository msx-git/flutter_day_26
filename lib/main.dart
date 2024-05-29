import 'package:flutter/material.dart';

import 'views/screens/categories_screen.dart';
import 'views/screens/products_screen.dart';
import 'views/screens/users_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageView(
        children: [
          ProductsScreen(),
          CategoriesScreen(),
          UsersScreen(),
        ],
      ),
    );
  }
}
