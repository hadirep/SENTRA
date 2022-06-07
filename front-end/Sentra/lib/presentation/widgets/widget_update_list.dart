import 'package:flutter/material.dart';
import 'package:sentra/data/models/update_list_model.dart';

class WidgetUpdateList extends StatefulWidget {
  final UpdateList updateList;
  const WidgetUpdateList({Key? key, required this.updateList}) : super(key: key);

  @override
  State<WidgetUpdateList> createState() => _WidgetUpdateListState();
}

class _WidgetUpdateListState extends State<WidgetUpdateList> {
  dynamic image = 'https://sentra.dokternak.id/public/kesenians/';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
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
  }
}
