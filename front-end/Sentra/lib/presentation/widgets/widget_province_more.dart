import 'package:flutter/material.dart';
import 'package:sentra/data/models/province_list_model.dart';
import 'package:sentra/presentation/pages/province_query_page.dart';

class WidgetProvinceMore extends StatefulWidget {
  final ProvinceList provinceList;
  const WidgetProvinceMore({Key? key, required this.provinceList}) : super(key: key);

  @override
  State<WidgetProvinceMore> createState() => _WidgetProvinceMoreState();
}

class _WidgetProvinceMoreState extends State<WidgetProvinceMore> {
  dynamic image = 'https://sentra.dokternak.id/public/kesenians/';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
            context, ProvinceQueryPage.routeName, arguments: widget.provinceList
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
                  image+widget.provinceList.image, width: 150, height: 150, fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  widget.provinceList.province, textAlign: TextAlign.center,
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
  }
}
