import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentra/common/constants.dart';
import 'package:sentra/common/result_state.dart';
import 'package:sentra/data/models/art_list_model.dart';
import 'package:sentra/data/models/dummy/art_list.dart';
import 'package:sentra/presentation/provider/database_provider.dart';

import 'details_seller_product.dart';

class FavoriteList extends StatelessWidget {
  static const String routeName = '/favorite-list-page';

  const FavoriteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Favorite List',
          style: TextStyle(
              color: Color.fromARGB(255, 45, 74, 148),
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.symmetric(),
          child: IconButton(
            icon: Image.asset("assets/logo/sentra.png", height: 30, width: 30),
            onPressed: () {
              //Navigator.pushNamed(context, EditPage.routeName);
            },
          ),
        ),
      ),
      body: Consumer<DatabaseProvider>(
          builder: (context, provider, child) {
            if (provider.state == ResultState.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (provider.state == ResultState.hasData) {
              return ListView.builder(
                itemCount: provider.favorites.length,
                itemBuilder: (context, index) {
                  return FavoriteArts(
                      artList: provider.favorites[index]
                  );
                },
              );
            } else if (provider.state == ResultState.noData) {
              return Center(child: Text(provider.message));
            } else {
              return Center(child: Text(provider.message));
            }
          }
      ),
    );
  }
}

class FavoriteArts extends StatelessWidget {
  final ArtList artList;

  const FavoriteArts({Key? key, required this.artList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<bool>(
          future: provider.isFavorited(artList.id),
          builder: (context, snapshot) {
            return ListTile(
              onTap: () {
                Navigator.pushNamed(
                  context, DetailSellerProduct.routeName, arguments: artList,
                );
              },
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: '$baseImageArt${artList.image}',
                  width: 80,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              title: Text(
                artList.name!,
                style: const TextStyle(
                  color: Color(0xff2d4b94),
                  fontSize: 15, fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                children: [
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      Text(artList.province!,
                        style: const TextStyle(
                          color: Color(0xff2d4b94),
                          fontSize: 12, fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            );
          },
        );
      },
    );
  }
}