import 'package:flutter/material.dart';
import 'package:add_to_cart/provider.dart';
import 'package:provider/provider.dart';

import 'card_widget.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: Text(
          'Favorites',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: Consumer<FavoriteList>(
        builder: (context, favoriteList, child) {
          if (favoriteList.favorites.isEmpty) {
            return const Center(
              child: Text(
                'You have no favorites yet - start adding some!',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: favoriteList.favorites.length,
            itemBuilder: (context, index) {
              return buildCard(
                context,
                favoriteList.favorites,
                index,
              );
            },
          );
        },
      ),
    );
  }
}
