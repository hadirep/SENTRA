import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sentra/domain/entities/art.dart';
import 'package:sentra/common/constants.dart';


class AllArtsCard extends StatelessWidget{
  final Art art;

  const AllArtsCard(this.art, {Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Card(
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: '$BASE_IMAGE_KESENIAN_URL${art.image}',
                    height: 200,
                    fit: BoxFit.cover,
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      art.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Icon(Icons.star_border_outlined)
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text(
                  art.province ?? '_',
                  style: TextStyle(
                      fontSize: 15
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
    // return Container(
    //   margin: const EdgeInsets.symmetric(vertical: 4),
    //   child: InkWell(
    //     onTap: () {
    //       // Navigator.pushNamed(context, routeName)
    //       // argument
    //     },
    //     child: Stack(
    //       alignment: Alignment.bottomLeft,
    //       children: [
    //
    //         Card(
    //           child: Container(
    //             margin: const EdgeInsets.only(
    //               left: 16 + 80 + 16,
    //               bottom: 8,
    //               right: 8,
    //             ),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 art.name,
    //               ),
    //               Text(
    //                 art.province ?? '_'
    //               ),
    //             ],
    //           ),
    //         )
    //       ),
    //         Container(
    //           margin: const EdgeInsets.only(
    //           left: 16,
    //           bottom: 16),
    //           child: ClipRRect(
    //             child: CachedNetworkImage(imageUrl: '$BASE_IMAGE_KESENIAN_URL${art.image}',
    //                 width: 80,
    //                 placeholder: (context, url) => const Center(
    //                   child: CircularProgressIndicator(),
    //                 ),
    //                 errorWidget: (context, url, error) => const Icon(Icons.error)),
    //           ),
    //         ),],
    //
    //     ),
    //   ),
    // );
  }
}