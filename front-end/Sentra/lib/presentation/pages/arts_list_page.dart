import 'package:flutter/material.dart';
import 'package:sentra/domain/entities/art.dart';
import 'package:sentra/common/constants.dart';
import 'package:sentra/pages/details_seller_product.dart';

class ArtsListPage extends StatelessWidget {
  final List<Art> listArts;

  const ArtsListPage(this.listArts, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var arts = listArts[index];
          return InkWell(
            onTap: () {
                Navigator.pushNamed(context, DetailSellerProduct.routeName,
                arguments: arts.id,
                );
              // Menuju detail page filter
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Card(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        '$BASE_IMAGE_KESENIAN_URL${arts.image}', width: 150, height: 200, fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(arts.name,
                        style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xff2d4b94),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: listArts.length,
      ),
    );
  }
}