import 'package:flutter/material.dart';
import 'package:sentra/common/constants.dart';
import 'package:sentra/data/models/art_and_province_model.dart';
import 'package:sentra/presentation/pages/details_seller_product.dart';

class ArtListPage extends StatefulWidget {
  final ArtList artList;
  const ArtListPage({Key? key, required this.artList}) : super(key: key);

  @override
  State<ArtListPage> createState() => _ArtListPageState();
}

class _ArtListPageState extends State<ArtListPage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context, DetailSellerProduct.routeName, arguments: widget.artList,
        );
      },
      child: Card(
        elevation: 4.0,
        shadowColor: const Color.fromARGB(255, 234, 132, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120, width: MediaQuery.of(context).size.width/2.5,
              child: Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2.8, color: const Color.fromARGB(196, 249, 216, 117),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(baseImageArt+widget.artList.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 2),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.add_location_rounded, size: 15,
                          color: Color.fromARGB(255, 234, 132, 0),
                        ),
                        Text(
                          widget.artList.province!,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 45, 74, 148),
                            fontSize: 11, fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(widget.artList.name!,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 45, 74, 148),
                        fontSize: 15, fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
