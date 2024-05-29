import 'package:flutter/material.dart';
import 'package:flutter_day_26/controllers/users_controller.dart';

class UsersScreen extends StatelessWidget {
  UsersScreen({super.key});

  final usersController = UsersController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        centerTitle: true,
        title: const Text(
          'Users Screen',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: FutureBuilder(
        future: usersController.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Couldn't find categories"));
          } else if (snapshot.hasError) {
            return const Center(child: Text("Couldn't load categories"));
          }
          final users = snapshot.data!;
          return Column(
            children: [
              Text('Result: [${users.length}]'),
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return Container(
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.network(
                            user.avatar,
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
                            user.name,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            user.email,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            user.role,
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
