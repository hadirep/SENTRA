import 'package:flutter/material.dart';
import 'package:sentra/common/text_theme.dart';
import 'package:sentra/data/models/detail_model.dart';

class WidgetProvinceDetail extends StatefulWidget {
  final Data provinceDetail;
  const WidgetProvinceDetail({Key? key, required this.provinceDetail}) : super(key: key);

  @override
  State<WidgetProvinceDetail> createState() => _WidgetProvinceDetailState();
}

class _WidgetProvinceDetailState extends State<WidgetProvinceDetail> {
  dynamic image = 'https://sentra.dokternak.id/public/kesenians/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Image.network(
            image+widget.provinceDetail.image, scale: 1.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    widget.provinceDetail.name,
                    style: myTextTheme.headline5,
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    widget.provinceDetail.province,
                    style: myTextTheme.headline5,
                  ),
                ),
                const SizedBox(height: 8),
                const Divider(color: Colors.black),
                Center(
                  child: Text(
                    'Drinks',
                    style: myTextTheme.headline5,
                  ),
                ),
                const SizedBox(height: 8),

                const Divider(color: Colors.black),
                const SizedBox(width: 8),
                Center(
                  child: Text(
                    'Description',
                    style: myTextTheme.headline5,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.provinceDetail.description,
                  style: myTextTheme.subtitle1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
