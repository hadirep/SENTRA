import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:common/constants.dart';
import 'package:sentra/data/models/art_and_province_model.dart';
import 'package:sentra/presentation/pages/details_seller_product.dart';

class ArtCard extends StatelessWidget {
  final ArtList art;

  const ArtCard({Key? key, required this.art}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailSellerProduct.routeName,
          arguments: art,
        );
      },
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: '$baseImageArt${art.image}',
          width: 80,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
      title: Text(
        art.name!,
        style: const TextStyle(
          color: Color(0xff2d4b94),
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        children: [
          const SizedBox(height: 4),
          Row(
            children: [
              const SizedBox(width: 5),
              Text(
                art.province!,
                style: const TextStyle(
                  color: Color(0xff2d4b94),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
