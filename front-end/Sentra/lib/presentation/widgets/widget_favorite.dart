import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:common/constants.dart';
import 'package:sentra/data/models/art_and_province_model.dart';
import 'package:sentra/presentation/pages/details_seller_product.dart';
import 'package:sentra/presentation/provider/database_provider.dart';

class WidgetFavorite extends StatefulWidget{
  final ArtList artList;

  const WidgetFavorite({Key? key, required this.artList}) : super(key: key);

  @override
  State<WidgetFavorite> createState() => _WidgetFavoriteState();
}

class _WidgetFavoriteState extends State<WidgetFavorite> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<bool>(
          future: provider.isFavorited(widget.artList.id),
          builder: (context, snapshot) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                    builder: (_) => DetailSellerProduct(artList: widget.artList))
                ).then((_) {
                  context.read<DatabaseProvider>().getFavorite();
                });
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                height: 80,
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black12,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Hero(
                          tag: baseImageArt+widget.artList.image,
                          child: Image.network(baseImageArt+widget.artList.image, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.artList.name!,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 45, 74, 148),
                            fontSize: 15, fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.add_location_rounded, size: 16,
                              color: Color.fromARGB(255, 234, 132, 0),
                            ),
                            const SizedBox(width: 3),
                            Text(
                              widget.artList.province!,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 45, 74, 148),
                                fontSize: 15, fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}