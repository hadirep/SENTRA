import 'package:flutter/material.dart';
import 'package:sentra/data/models/art_list_model.dart';
import 'package:sentra/presentation/pages/details_seller_product.dart';

class WidgetArtList extends StatefulWidget {
  final ArtList artList;
  const WidgetArtList({Key? key, required this.artList}) : super(key: key);

  @override
  State<WidgetArtList> createState() => _WidgetArtListState();
}

class _WidgetArtListState extends State<WidgetArtList> {
  dynamic image = 'https://sentra.dokternak.id/public/kesenians/';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      Navigator.pushNamed(context, DetailSellerProduct.routeName,
       arguments: widget.artList.id
         );
        /*Navigator.pushNamed(
            context, UpdatePage.routeName, arguments: widget.provinceList
        );*/
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Card(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  image+widget.artList.image, width: 150, height: 150, fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  widget.artList.province,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2d4b94),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
