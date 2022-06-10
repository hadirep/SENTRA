import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:sentra/common/constants.dart';
import 'package:sentra/common/style.dart';
import 'package:sentra/data/models/detail_model.dart';
import 'package:sentra/presentation/widgets/button/button_back.dart';

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
    return
     DefaultTabController(
       length: 2,
       child: Scaffold(
         appBar: AppBar(
           elevation: 0,
           backgroundColor: const Color.fromARGB(255, 255, 255, 255),
           title: const Text(
             'Art Details',
             style: TextStyle(
               color: textPrimaryColor,
               fontWeight: FontWeight.bold,
             ),
           ),
           centerTitle: true,
           leading: const ButtonBack(),
         ),
         body: SingleChildScrollView(
         child: Column(
             children: [
               Stack(
                 children: [
                   Container(
                     height: MediaQuery.of(context).size.height * 0.31,
                     width:  MediaQuery.of(context).size.height * 0.45,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(15),
                       image: DecorationImage(
                         image: NetworkImage(image+widget.provinceDetail.image),
                         fit: BoxFit.fill,
                       ),
                       boxShadow: const [
                         BoxShadow(
                           color: Colors.grey,
                           offset: Offset(1.0, 4.0),
                           blurRadius: 6.0,
                         ),
                       ],
                     ),
                   ),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       const Padding(
                         padding: EdgeInsets.only(
                             top: 17, right: 10),
                       ),
                       const SizedBox(height: 140,),
                       Container(
                         padding: const EdgeInsets.only(left: 20 ),
                         // REVISI
                         child: Text(widget.provinceDetail.province, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),),
                       ),
                       const SizedBox(height: 4,),
                       Container(
                         padding: const EdgeInsets.only(left: 20 ),
                         child: Text(widget.provinceDetail.name, style: const TextStyle(color: Colors.white, fontSize: 27, fontWeight: FontWeight.w800),),
                       ),
                       const SizedBox(height: 4,),
                       Container(
                         padding: const EdgeInsets.only(left: 20 ),
                         child: Text(widget.provinceDetail.price, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),),
                       ),
                     ],
                   ),
                 ],
               ),
               const SizedBox(height:15,),
               TabBar(
                 indicator: BoxDecoration(
                   color: const Color.fromARGB(255, 45, 74, 148),
                   borderRadius: BorderRadius.circular(10),
                 ),
                 tabs: const [
                   Tab(child:  Text('Description', style:  TextStyle(color:  Color.fromARGB(255, 221, 221, 221), fontWeight: FontWeight.bold, fontSize: 17)),),
                   Tab(child:  Text('Contacts', style:  TextStyle(color: Color.fromARGB(255, 221, 221, 221), fontWeight: FontWeight.bold, fontSize: 17)),)
                 ],
               ),
               SizedBox(
                 height: MediaQuery.of(context).size.height * 0.50,
                 child: TabBarView(
                   children: [
                     SingleChildScrollView(
                       child: Container(
                         padding: const EdgeInsets.only(left: 15, right: 15),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [ SizedBox(
                                 // color: Colors.white,
                                 child: Padding(
                                   padding: const EdgeInsets.only(right: 9, top: 15),
                                   child: ReadMoreText(widget.provinceDetail.description,
                                            style: const TextStyle(color:  Color.fromARGB(255, 190, 190, 190),fontWeight: FontWeight.w400 , fontSize: 13),
                                            // trimLines: 2,
                                            trimLength: 500,
                                            colorClickableText: const Color.fromARGB(255, 45, 74, 148),
                                            trimCollapsedText: '\nread more',
                                            trimExpandedText: 'close',
                                   ),
                                 ),
                               ),
                               const SizedBox(height: 10,),

                             
                             Container(
                               alignment: Alignment.bottomLeft,
                               child: Row(
                                 children: [
                                   const Padding(
                                     padding: EdgeInsets.only(left:0),
                                     child: Text(
                                       "Docummentations",
                                       style: TextStyle(
                                         fontWeight: FontWeight.w600,
                                         fontSize: 15,
                                         color: Color.fromARGB(255, 234, 132, 0),
                                       ),
                                     ),
                                   ),
                                   Container(
                                     padding: const EdgeInsets.only(left: 1),
                                     child: const Icon(
                                       Icons.arrow_drop_down_rounded, size: 30,
                                       color: Color.fromARGB(255, 240, 190, 65),
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                             
                                      Center(
                                        child: Column(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.only(left: 3),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context).size.height * 0.1,
                                                  width:  MediaQuery.of(context).size.width,
                                                  child: ListView.builder(
                                                    itemCount: widget.provinceDetail.documKesenians.length,
                                                    padding: EdgeInsets.zero,
                                                    scrollDirection: Axis.horizontal,
                                                    itemBuilder: (context, index) {
                                                      return Row(
                                                        children: widget.provinceDetail.documKesenians.map((doc) => Padding(
                                                          padding: const EdgeInsets.all(4.0),
                                                          child: InkWell(
                                                              onTap: () {
                                                          showDialog(builder: (BuildContext context) => AlertDialog(backgroundColor: const Color.fromARGB(0, 93, 93, 93),
                                                          insetPadding: const EdgeInsets.all(2),
                                                          
                                                          title: Container(
                                                            width: MediaQuery.of(context).size.width,
                                                            child: Hero(tag:widget.provinceDetail.documKesenians, child: CachedNetworkImage(imageUrl: '$baseImageDocArt${doc.documentation}',)),
                                                          )), context: context); 
                                                        },
                                                            child: ClipRRect( borderRadius: BorderRadius.circular(10), child:
                                                            FittedBox(
                                                              fit:
                                                              BoxFit.fill,
                                                              child: CachedNetworkImage(
                                                                imageUrl: '$baseImageDocArt${doc.documentation}',
                                                                width: 140,
                                                                placeholder: (context, url) => const Center(
                                                                  child: CircularProgressIndicator(),
                                                                ),
                                                                errorWidget: (context, url, error) => const Icon(Icons.error),
                                                              ),
                                                            ),
                                                            ),
                                                          ),
                                                        ),).toList(),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                           ],
                         ),
                       ),
                     ),
                     Container(
                       padding: const EdgeInsets.only(left: 25, right: 35, top: 15),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Container(
                             width: MediaQuery.of(context).size.width,
                             padding: const EdgeInsets.all(7),
                             height: MediaQuery.of(context).size.height * 0.07,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(13),
                               color: Colors.white, border: Border.all(
                                 color: const Color.fromARGB(255, 221, 221, 221),
                                 width: 3.7),
                             ),
                             child: Padding(
                               padding:  const EdgeInsets.only(left: 5.0),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   ClipRRect(borderRadius: BorderRadius.circular(50),
                                     child:  const Image(
                                       image:  AssetImage('images/whatsapp.png',
                                       ),
                                     ),
                                   ),
                                   // REVISI
                                   Text(widget.provinceDetail.phoneNumber,
                                     style: const TextStyle(
                                       color: Color.fromARGB(255, 234, 132, 0),
                                       fontWeight: FontWeight.w800,
                                       fontSize: 15,
                                     ),
                                   ),
                                   const CircleAvatar(
                                     radius: 24,
                                     backgroundColor: Color.fromARGB(255, 234, 132, 0),
                                     child: Icon(
                                       Icons.send, size: 20,
                                       color: Color.fromARGB(255, 255, 255, 255),
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                           const SizedBox(height: 12,),
                           Container(
                             width: MediaQuery.of(context).size.width,
                             padding: const EdgeInsets.all(7),
                             height: MediaQuery.of(context).size.height * 0.07,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(13),
                               color: Colors.white, border: Border.all(
                                 color: const Color.fromARGB(255, 221, 221, 221),
                                 width: 3.7),
                             ),
                             child: Padding(
                               padding: const EdgeInsets.only(left: 5.0),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   ClipRRect(borderRadius: BorderRadius.circular(50),
                                     child: const Image(image: AssetImage('images/instagram.png'),),
                                   ),
                                   // revisi
                                   Text(widget.provinceDetail.isInstagram,
                                     style: const TextStyle(
                                       color: Color.fromARGB(255, 234, 132, 0),
                                       fontWeight: FontWeight.w800,
                                       fontSize: 15,
                                     ),
                                   ),
                                   const CircleAvatar(
                                     radius: 24,
                                     backgroundColor: Color.fromARGB(255, 234, 132, 0),
                                     child: Icon(
                                       Icons.send, size: 20,
                                       color: Color.fromARGB(255, 255, 255, 255),
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                           const SizedBox(height: 12,),
                           Container(
                             width: MediaQuery.of(context).size.width,
                             padding: const EdgeInsets.all(7),
                             height: MediaQuery.of(context).size.height * 0.07,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(13),
                               color: Colors.white, border: Border.all(
                                 color: const Color.fromARGB(255, 221, 221, 221),
                                 width: 3.7),
                             ),
                             child: Padding(
                               padding: const EdgeInsets.only(left: 5.0),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   ClipRRect(borderRadius: BorderRadius.circular(50),
                                     child: const Image(
                                       image: AssetImage('images/facebook.jpg'),
                                     ),
                                   ),
                                   // revisi
                                   Text(widget.provinceDetail.isFacebook,
                                     style: const TextStyle(
                                       color: Color.fromARGB(255, 234, 132, 0),
                                       fontWeight: FontWeight.w800,
                                       fontSize: 13,
                                     ),
                                   ),
                                   const CircleAvatar(
                                     radius: 24,
                                     backgroundColor: Color.fromARGB(255, 234, 132, 0),
                                     child: Icon(
                                       Icons.send, size: 20,
                                       color: Color.fromARGB(255, 255, 255, 255),
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),
                   ],
                 ),
               ),
             ],
           ),
         ),
       ),
    );
  }
}
