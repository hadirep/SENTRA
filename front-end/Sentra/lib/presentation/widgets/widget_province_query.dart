import 'package:flutter/material.dart';
import 'package:sentra/data/models/province_query_model.dart';
import 'package:sentra/presentation/pages/province_detail_page.dart';

class WidgetProvinceQuery extends StatefulWidget {
  final ProvinceQuery provinceQuery;
  const WidgetProvinceQuery({Key? key, required this.provinceQuery}) : super(key: key);

  @override
  State<WidgetProvinceQuery> createState() => _WidgetProvinceQueryState();
}

class _WidgetProvinceQueryState extends State<WidgetProvinceQuery> {
  dynamic image = 'https://sentra.dokternak.id/public/kesenians/';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
            context, ProvinceDetailPage.routeName, arguments: widget.provinceQuery
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Card(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  image+widget.provinceQuery.image, width: 150, height: 150, fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  widget.provinceQuery.name,
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
