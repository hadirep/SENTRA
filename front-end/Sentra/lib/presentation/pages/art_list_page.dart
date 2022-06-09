import 'package:flutter/material.dart';
import 'package:sentra/data/models/art_list_model.dart';
import 'package:sentra/presentation/pages/details_seller_product.dart';

class ArtListPage extends StatefulWidget {
  final ArtList artList;
  const ArtListPage({Key? key, required this.artList}) : super(key: key);

  @override
  State<ArtListPage> createState() => _ArtListPageState();
}

class _ArtListPageState extends State<ArtListPage> {
  dynamic image = 'https://sentra.dokternak.id/public/kesenians/';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      Navigator.pushNamed(context, DetailSellerProduct.routeName,
       arguments: widget.artList.id
         );
        /*Navigator.pushNamed(
            context, UpdatePage.routeName, arguments: widget.provinceList
        );*/
      },
      // child: ClipRRect(
      //   borderRadius: BorderRadius.circular(30),
                child: Card( 
          elevation: 4.0,
          shadowColor:  Color.fromARGB(255, 234, 132, 0),
          child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            
          children: [
            Container(
              height: 120, width: MediaQuery.of(context).size.width/2.5,
              child: Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), 
                    border: Border.all(width: 2.8, color:  Color.fromARGB(196, 249, 216, 117)),
                                    image: DecorationImage(
                                      image: NetworkImage(
                    image+widget.artList.image,),fit: BoxFit.cover
                                    )
                  ),
  
                ),
              ),),
                SizedBox(height: 5,),
                Padding(padding: EdgeInsets.only(left: 5, top: 2),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.add_location_rounded, size: 15, color:   Color.fromARGB(255, 234, 132, 0),),
                          Text(" ${widget.artList.province}", style: const TextStyle(color: Color.fromARGB(255, 45, 74, 148), fontSize: 11, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(height: 2,),
                      Text(widget.artList.name,  style: const TextStyle(color: Color.fromARGB(255, 45, 74, 148), fontSize: 15, fontWeight: FontWeight.bold)),
                      
                    ],
                  ),
                )
                ,)
          ],)
          // Container(
          //       height: MediaQuery.of(context).size.height * 0.30,
          //       width: MediaQuery.of(context).size.width * 0.25,
          //       color: Colors.white,
          //       decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.black), borderRadius: BorderRadius.circular(3)),
          //       child: Stack(children: [
          //         SizedBox(height: 5,),
          //                       Container(
          //     height: MediaQuery.of(context).size.height * 0.33,
          //     width:  MediaQuery.of(context).size.height * 0.15,
          //     decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(15), 
          //     border: Border.all(width: 3, color:  Color.fromARGB(195, 255, 228, 147)),
          //     image: DecorationImage(
          //     image: NetworkImage(image+widget.provinceList.image,),
          //     fit: BoxFit.cover,
          //      ),
          //                       // boxShadow: const [
          //                       //   BoxShadow(
          //                       //     color: Colors.grey,
          //                       //     offset: Offset(1.0, 4.0),
          //                       //     blurRadius: 6.0,
          //                       //   ),
          //                       // ],
          //                     ),
          //                   ),
          //       ]),
          // ),
          // Stack(
          //   children: [
          //     Container( 
          //       height: MediaQuery.of(context).size.height * 0.30,
          //       width: MediaQuery.of(context).size.width * 0.30,
          //       color: Colors.white,
                
          //     ),
          //     SizedBox(height: 10,),
          //     Positioned.fill(
          //       child: Align(
          //         alignment: Alignment.topCenter,
          //         child: Container(
          //         height: MediaQuery.of(context).size.height * 0.10,
          //         width:  MediaQuery.of(context).size.width * 0.15,
          //         decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(15), 
          //         image: DecorationImage(
          //         image: NetworkImage(image+widget.updateList.image,),
          //         fit: BoxFit.cover,
          //          ),
          //                           boxShadow: const [
          //                             BoxShadow(
          //                               color: Colors.grey,
          //                               offset: Offset(1.0, 4.0),
          //                               blurRadius: 6.0,
          //                             ),
          //                           ],
          //                         ),
          //                       ),
          //       ),
          //     ),
          //   ],
          // ),
          // Column(
          //   children: [
          //     ClipRRect(
          //       borderRadius: BorderRadius.circular(20),
          //       child: Image.network(
          //         image+widget.updateList.image, width: 150, height: 150, fit: BoxFit.cover,
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.all(5),
          //       child: Text(
          //         widget.updateList.name,
          //         style: const TextStyle(
          //           fontSize: 15,
          //           fontWeight: FontWeight.bold,
          //           color: Color(0xff2d4b94),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ),
        // child: Card(
        //   child: Column(
        //     children: [
        //       ClipRRect(
        //         borderRadius: BorderRadius.circular(20),
        //         child: Image.network(
        //           image+widget.artList.image, width: 150, height: 150, fit: BoxFit.cover,
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(5),
        //         child: Text(
        //           widget.artList.province,
        //           style: const TextStyle(
        //             fontSize: 15,
        //             fontWeight: FontWeight.bold,
        //             color: Color(0xff2d4b94),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      // ),
    );
  }
}
