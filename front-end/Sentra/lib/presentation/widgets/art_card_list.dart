import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sentra/common/constants.dart';
import 'package:sentra/domain/entities/art.dart';
import 'package:sentra/pages/details_seller_product.dart';

class ArtCard extends StatelessWidget {
  final Art art;

  // ignore: use_key_in_widget_constructors
  const ArtCard( this.art);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
       onTap: () {
          Navigator.pushNamed(context, DetailSellerProduct.routeName,
          arguments: art.id);
       },
        // onTap: () {
        //         Navigator.pushNamed(context, DetailSellerProduct.routeName,
        //         );
        //       // Menuju detail page filter
        //     },
        // onTap: () {
          
        //   // Navigator.pushNamed(
        //   //   context,
        //   //   MovieDetailPage.ROUTE_NAME,
        //   //   arguments: MovieDetailArgs(id: movie.id!, isMovie: true),
        //   // );
        // },
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Card(
              child: Container(
                margin: const EdgeInsets.only(
                  left: 16 + 80 + 16,
                  bottom: 8,
                  right: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      art.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      art.province!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 16,
                bottom: 16,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_KESENIAN_URL${art.image}',
                  width: 80,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // return ListTile(
    //   onTap: () {
    //     // Navigator.pushNamed(
    //     //   context,
    //     //   ArtDetailPage.ROUTE_NAME,
    //     //   arguments: ArtDetailArgs(id: art.idArt),
    //     // );
    //   },
    //   leading: ClipRRect(
    //     borderRadius: BorderRadius.circular(10),
    //     child: CachedNetworkImage(
    //     imageUrl: '$BASE_IMAGE_KESENIAN_URL${art.image}',
    //     width: 80,
    //     placeholder: (context, url) => const Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //     errorWidget: (context, url, error) => const Icon(Icons.error),
    //   ),
    //   ),
    //   title: Text(
    //     art.name!,
    //     style: const TextStyle(
    //       color: Color(0xff2d4b94), fontSize: 15, fontWeight: FontWeight.bold,
    //     ),
    //   ),
    //   subtitle: Column(
    //     children: [
    //       const SizedBox(height: 4),
    //       Row(
    //         children: [
    //           const SizedBox(width: 5),
    //           Text(art.province!,
    //             style: const TextStyle(
    //               color: Color(0xff2d4b94), fontSize: 12, fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //         ],
    //       ),
    //       const SizedBox(height: 4),
    //       // Row(
    //       //   children: const [
    //       //     Icon(
    //       //       Icons.stars,
    //       //       size: 15,
    //       //     ),
    //       //   ],
    //       // ),
    //     ],
    //   ),
    // );
  }
}