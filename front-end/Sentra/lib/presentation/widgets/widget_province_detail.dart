import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:sentra/common/text_theme.dart';
import 'package:sentra/data/api/api_service.dart';
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
    return
     DefaultTabController(
       length: 2,
       child: Scaffold(
        appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Container (child: Text('Art Details', style: TextStyle(color: Color.fromARGB(255, 45, 74, 148),fontWeight: FontWeight.bold, fontSize: 20), ), 
        ),
        centerTitle: true,
        leading: 
        Padding(padding: const EdgeInsets.all(12.0),
        child: Container(child: Image.asset("images/logos.jpeg")
        ),  
        ), 
      ),
      body:
        SingleChildScrollView(
        child: Column(children: [
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
                      blurRadius: 6.0
                
                    )
                  ]
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Padding(
                    padding: const EdgeInsets.only(
                    top: 17, right: 10),
                    // child: StarButton(),
                    // child: ElevatedButton(
                    //   onPressed: ()  async 
                    //   {
                    //      if(!getFavoriteStatus) {
                    //       Provider.of<DetailNotifier>(context,
                    //       listen: false).addWatchlist(art);
                    //     } else {
                    //       Provider.of<DetailNotifier>(context, listen: false).removeFromWatchlist(art);
                    //     }

                    //     final message =
                    //                 Provider.of<DetailNotifier>(context,
                    //                         listen: false)
                    //                     .favoritemessage;

                    //             if (message ==
                    //                     DetailNotifier
                    //                         .addedFavorite ||
                    //                 message ==
                    //                     DetailNotifier
                    //                         .removedFavorite) {
                    //               ScaffoldMessenger.of(context).showSnackBar(
                    //                   SnackBar(content: Text(message)));
                    //             } else {
                    //               showDialog(
                    //                   context: context,
                    //                   builder: (context) {
                    //                     return AlertDialog(
                    //                       content: Text(message),
                    //                     );
                    //                   });
                    //             }
                    //   },
                    //   // {
                    //   //   if(!getFavoriteStatus) {
                    //   //     BlocProvider.of<DetailBloc>(context,
                    //   //     listen: false).add(OnAddFavorite(art));
                    //   //   } else {
                    //   //     BlocProvider.of<DetailBloc>(context, listen: false).add(OnRemoveFavorite(art));
                    //   //   }
                    //   // },
                    //   child : Row(
                    //     mainAxisSize: MainAxisSize.min,
                    //     children: [
                    //       getFavoriteStatus ? const Icon (Icons.star_border, color: Color.fromARGB(255, 240, 190, 65),)
                    //       : const Icon(Icons.star_border_outlined,  color: Color.fromARGB(255, 240, 190, 65))
                    //     ],
                    //   )
                    // ),
                  ),
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
              )
            
            ],
          ),
          const SizedBox(height:15,), 
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(15),
          //   ),
            
            // padding: const EdgeInsets.all(20),
            // child: 
            TabBar(
              // padding: EdgeInsets.all(10),
              indicator: BoxDecoration(
                color: const Color.fromARGB(255, 45, 74, 148),
                borderRadius: BorderRadius.circular(10),
              ),
              tabs: const [
                 Tab(child:  Text('Description', style:  TextStyle(color:  Color.fromARGB(255, 221, 221, 221), fontWeight: FontWeight.bold, fontSize: 17)),),
                 Tab(child:  Text('Contacts', style:  TextStyle(color: Color.fromARGB(255, 221, 221, 221), fontWeight: FontWeight.bold, fontSize: 17)),)
              ],
            // ),
          ),
          
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.50,            
            child: TabBarView(
              children: [
              SingleChildScrollView(child: Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SizedBox(
                        // color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 9, top: 15),
                          child: ReadMoreText(widget.provinceDetail.description,
                          style: const TextStyle(color:  Color.fromARGB(255, 190, 190, 190),fontWeight: FontWeight.w400 , fontSize: 13),
                          trimLines: 7,
                          colorClickableText: Color.fromARGB(255, 209, 0, 0),
                          trimCollapsedText: 'read more',
                          trimExpandedText: 'close',
                           )
                          
                          
                        ),
                        ),
                    ),
                    Container(
                        child: Row(
                          children: [
                            const Padding(
                            padding: EdgeInsets.only(left:0),
                            child: Text(
                              "Docummentations", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: const Color.fromARGB(255, 234, 132, 0),),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 1),
                            child: const Icon(
                        Icons.arrow_drop_down_rounded, size: 30,
                        color: const Color.fromARGB(255, 240, 190, 65),
                      ),
                          )
                          ],
                        ),
                        alignment: Alignment.bottomLeft,
                      ),
                    Container(
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(height: 7,),
                            Row(
                              children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: 0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.11,
                    width:  MediaQuery.of(context).size.height * 0.14,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(image: const AssetImage('images/tariseblang_d.jpg'),
                        fit: BoxFit.fill,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1.0, 5.0),
                            blurRadius: 6.0
                          )
                        ]
                    ),
                  ),
              ),
              const SizedBox(width: 12,),
              Container(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.11,
                    width:  MediaQuery.of(context).size.height * 0.14,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(image: const AssetImage('images/tariseblang_dd.jpeg'),
                        fit: BoxFit.fill,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1.0, 5.0),
                            blurRadius: 6.0
                          )
                        ]
                    ),
                  ),
              ),
              const SizedBox(width: 12,),
              Container(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.11,
                    width:  MediaQuery.of(context).size.height * 0.14,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(image: const AssetImage('images/tariseblang_ddd.jpg'),
                        fit: BoxFit.fill,
                        ),
                        boxShadow: [
                          const BoxShadow(
                            color: Colors.grey,
                            offset: const Offset(1.0, 5.0),
                            blurRadius: 6.0
                          )
                        ]
                    ),
                  ),
              ),

                              ],
                            ),
                          ],
                        ),
                      )
                    ),
                  ],
                ),
              ),),
              Container(
                child: Container(
                padding: const EdgeInsets.only(left: 25, right: 35, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(7),
                      height: MediaQuery.of(context).size.height * 0.07,
                          child: Padding(
                        padding:  const EdgeInsets.only(left: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                        child: ClipRRect(borderRadius: BorderRadius.circular(50),
                        child:  const Image(image:  AssetImage('images/whatsapp.png',),),
                        ),
                            ),
                            // REVISI
                            Container(child: Text(widget.provinceDetail.phoneNumber,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 234, 132, 0),
                              fontWeight: FontWeight.w800,
                              fontSize: 15
                            ),),
                            ),
                            Container(
                              child: const CircleAvatar(
                      radius: 24,
                      backgroundColor: Color.fromARGB(255, 234, 132, 0),
                      child: Icon(
                        Icons.send, size: 20,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                            )
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.white, border: Border.all(
                          color: const Color.fromARGB(255, 221, 221, 221),
                          width: 3.7)
                      ),
                      ),
                      const SizedBox(height: 12,),
                      Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(7),
                      height: MediaQuery.of(context).size.height * 0.07,
                          child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                        child: ClipRRect(borderRadius: BorderRadius.circular(50),
                        child: const Image(image: const AssetImage('images/instagram.png'),),
                        ),
                            ),
                            // revisi
                            Container(child: Text(widget.provinceDetail.isInstagram,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 234, 132, 0),
                              fontWeight: FontWeight.w800,
                              fontSize: 15
                            ),
                            ),),
                            Container(
                              child: const CircleAvatar(
                      radius: 24,
                      backgroundColor: Color.fromARGB(255, 234, 132, 0),
                      child: Icon(
                        Icons.send, size: 20,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                            )
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.white, border: Border.all(
                          color: const Color.fromARGB(255, 221, 221, 221),
                          width: 3.7)
                      ),
                      ),
                      const SizedBox(height: 12,),
                      Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(7),
                      height: MediaQuery.of(context).size.height * 0.07,
                          child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                        child: ClipRRect(borderRadius: BorderRadius.circular(50),
                        child: const Image(image: const AssetImage('images/facebook.jpg'),),
                        ),
                            ),
                            // revisi
                            Container(child: Text(widget.provinceDetail.isFacebook,
                            style: const TextStyle(
                              color: const Color.fromARGB(255, 234, 132, 0),
                              fontWeight: FontWeight.w800,
                              fontSize: 15
                            ),
                            ),),
                            Container(
                              child: const CircleAvatar(
                      radius: 24,
                      backgroundColor: Color.fromARGB(255, 234, 132, 0),
                      child: Icon(
                        Icons.send, size: 20,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                            )
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.white, border: Border.all(
                         color: const Color.fromARGB(255, 221, 221, 221),
                          width: 3.7)
                      ),
                      ),
                  ],
                ),
              ),
          )]),
          ),
        ]),
      ))
      // ListView(
      //   children: <Widget>[
      //     Image.network(
      //       image+widget.provinceDetail.image, scale: 1.0,
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: <Widget>[
      //           Center(
      //             child: Text(
      //               widget.provinceDetail.name,
      //               style: myTextTheme.headline5,
      //             ),
      //           ),
      //           const SizedBox(height: 10),
      //           Center(
      //             child: Text(
      //               widget.provinceDetail.province,
      //               style: myTextTheme.headline5,
      //             ),
      //           ),
      //           const SizedBox(height: 8),
      //           const Divider(color: Colors.black),
      //           Center(
      //             child: Text(
      //               'Drinks',
      //               style: myTextTheme.headline5,
      //             ),
      //           ),
      //           const SizedBox(height: 8),

      //           const Divider(color: Colors.black),
      //           const SizedBox(width: 8),
      //           Center(
      //             child: Text(
      //               'Description',
      //               style: myTextTheme.headline5,
      //             ),
      //           ),
      //           const SizedBox(height: 8),
      //           Text(
      //             widget.provinceDetail.description,
      //             style: myTextTheme.subtitle1,
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
