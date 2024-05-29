import 'package:flutter/material.dart';
import 'package:flutter_day_26/controllers/categories_controller.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final categoriesController = CategoriesController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: const Text(
          'Categories Screen',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: FutureBuilder(
        future: categoriesController.getCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Couldn't find categories"));
          } else if (snapshot.hasError) {
            return const Center(child: Text("Couldn't load categories"));
          }
          final categories = snapshot.data!;
          return Column(
            children: [
              Text("Result: [${categories.length}]"),
              Expanded(
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return Container(
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.network(
                            category.image,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return const Center(
                                  child: CircularProgressIndicator());
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return const Text(
                                'Image not available',
                                style: TextStyle(color: Colors.redAccent),
                              );
                            },
                          ),
                          Text(
                            category.name,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
