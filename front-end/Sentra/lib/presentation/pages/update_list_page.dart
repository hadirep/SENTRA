import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentra/data/models/update_list_model.dart';
import 'package:sentra/presentation/pages/details_seller_product.dart';
import 'package:sentra/presentation/provider/database_provider.dart';

class UpdateListPage extends StatefulWidget {
  final UpdateList updateList;
  const UpdateListPage({Key? key, required this.updateList}) : super(key: key);

  @override
  State<UpdateListPage> createState() => _UpdateListPageState();
}

class _UpdateListPageState extends State<UpdateListPage> {
  dynamic image = 'https://sentra.dokternak.id/public/kesenians/';

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
        builder: (context, provider, child) {
          return FutureBuilder<bool>(
            future: provider.isFavorited(widget.updateList.id),
            builder: (context, snapshot) {
              return InkWell(
                onTap: () {
              Navigator.pushNamed(context, DetailSellerProduct.routeName, arguments: widget.updateList.id);
            },
                   child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Card(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  image+widget.updateList.image, width: 150, height: 150, fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  widget.updateList.province,
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
            });
        },
    );
  }
}
