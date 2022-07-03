import 'package:flutter/material.dart';
import 'package:common/constants.dart';
import 'package:sentra/data/models/art_and_province_model.dart';
import 'package:sentra/presentation/pages/province_query_page.dart';

class ProvinceListPage extends StatefulWidget {
  final ArtList provinceList;
  const ProvinceListPage({Key? key, required this.provinceList})
      : super(key: key);

  @override
  State<ProvinceListPage> createState() => _ProvinceListPageState();
}

class _ProvinceListPageState extends State<ProvinceListPage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProvinceQueryPage.routeName,
          arguments: widget.provinceList,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Card(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.33,
                width: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 3,
                    color: const Color.fromARGB(207, 246, 219, 138),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      baseImageArt + widget.provinceList.image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 30),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      const SizedBox(height: 130),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(206, 255, 244, 211),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(255, 234, 132, 0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              widget.provinceList.province!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                color: Color(0xff2d4b94),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 140),
            ],
          ),
        ),
      ),
    );
  }
}
