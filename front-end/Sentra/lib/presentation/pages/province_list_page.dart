import 'package:flutter/material.dart';
import 'package:sentra/domain/entities/art.dart';
import 'package:sentra/common/constants.dart';

class ProvinceListPage extends StatelessWidget {
  final List<Art> listProvince;

  const ProvinceListPage(this.listProvince, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var province = listProvince[index];
          return InkWell(
            onTap: () {
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
                        '$BASE_IMAGE_KESENIAN_URL${province.image}', width: 150, height: 200, fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(province.name!,
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
        itemCount: listProvince.length,
      ),
    );
  }
}