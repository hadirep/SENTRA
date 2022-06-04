import 'package:flutter/material.dart';
import 'package:sentra/models/art_provience.dart';
import 'package:sentra/presentation/pages/province_page.dart';

class ProvinceListPage extends StatelessWidget {
  const ProvinceListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: dataArtProvince.length,
      itemBuilder: (context, index) {
        final artList = dataArtProvince[index];
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context, ProvincePage.routeName, arguments: dataArtProvince,
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Card(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      artList.image, width: 150, height: 150, fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      artList.province,
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
      },
    );
  }
}
