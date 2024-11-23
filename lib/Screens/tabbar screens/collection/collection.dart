import 'package:coin_identification/Provider/favorite_coin_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Widgets/custom_listtile.dart';
import '../coin detail/coins_detail_screen.dart';

class Collection extends StatelessWidget {
  const Collection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Consumer<FavoriteCoinsProvider>(
        builder: (context, favorite, child) {
          final favoriteCoins = favorite.getFavorite();
          if (favoriteCoins.isEmpty) {
            return const Center(
              child: Text("No Collection Exists"),
            );
          }
          return ListView.builder(
            itemCount: favoriteCoins.length,
            itemBuilder: (context, index) {
              final coin = favoriteCoins[index];
              return CustomListTile(
                title: coin.title,
                description: coin.description ?? 'No Descripton',
                image:
                    'https://awamisolution.com/coins/picture/${coin.picture}',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CoinsDetailScreen(coin: coin),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
