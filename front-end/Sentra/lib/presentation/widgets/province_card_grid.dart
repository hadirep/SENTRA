import 'package:flutter/material.dart';
import 'package:sentra/data/models/province_model.dart';

class ProvinceCardGrid extends StatefulWidget {
  final ProvinceDetail artProvince;
  const ProvinceCardGrid({Key? key, required this.artProvince}) : super(key: key);

  @override
  State<ProvinceCardGrid> createState() => _ProvinceCardGridState();
}

class _ProvinceCardGridState extends State<ProvinceCardGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: GridView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.3),
            ),
            children: [
              InkWell(
                onTap: () {
                  // Menuju detail page new update
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Card(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            widget.artProvince.image, height: 200, fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            widget.artProvince.province, textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xff2d4b94),
                            ),
                          ),
                        ),
                      ],
                    ),
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
