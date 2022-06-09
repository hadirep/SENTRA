import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sentra/data/models/province_list_model.dart';
import 'package:sentra/presentation/pages/province_query_page.dart';

class ProvinceListPage extends StatefulWidget {
  final ProvinceList provinceList;
  const ProvinceListPage({Key? key, required this.provinceList}) : super(key: key);

  @override
  State<ProvinceListPage> createState() => _ProvinceListPageState();
}

class _ProvinceListPageState extends State<ProvinceListPage> {
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
        borderRadius: BorderRadius.circular(20),
        child: Card(
          child:  Stack(
            children: [                            
              Container(
              height: MediaQuery.of(context).size.height * 0.33,
              width:  MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), 
              border: Border.all(width: 3, color:  Color.fromARGB(207, 246, 219, 138)),
              image: DecorationImage(
              image: NetworkImage(image+widget.provinceList.image,),
              fit: BoxFit.cover,
               ),
                              ),
                            ),
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(15),
              //   child: Image.network(
              //     image+widget.provinceList.image, width: 130, height: 150, fit: BoxFit.cover,
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(5),
                
              //   child: Text(
              //     widget.provinceList.province,
              //     style: const TextStyle(
              //       fontSize: 15,
              //       fontWeight: FontWeight.bold,
              //       color: Color(0xff2d4b94),
              //     ),
              //   ),
              // ),
              const SizedBox(width: 30,),
              Positioned.fill
              (
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      const SizedBox(height: 130,),
                      
                      Container(padding: EdgeInsets.all(10),
                      child:  Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                          color:  Color.fromARGB(206, 255, 244, 211), borderRadius: BorderRadius.circular(10), border: Border.all(width: 1,color: const Color.fromARGB(255, 234, 132, 0),)), 
                        child: Center(
                          child: Text(
                          widget.provinceList.province,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            color: Color(0xff2d4b94),
                          ), textAlign: TextAlign.center
                    ),
                        ),
                      ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 140,),
            ],
          ),
        ),
      ),
    );
  }
}
