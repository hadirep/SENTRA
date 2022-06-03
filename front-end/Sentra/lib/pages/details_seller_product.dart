import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentra/common/constants.dart';
import 'package:sentra/common/state_enum.dart';
import 'package:sentra/domain/entities/art_detail.dart';
import 'package:sentra/models/art_list.dart';
import 'package:sentra/presentation/bloc/detail/detail_bloc.dart';

import 'list.dart';

class DetailSellerProduct extends StatefulWidget {
  static const routeName = '/detail_product';
  // final ArtList place;
  final String id;
  DetailSellerProduct({required this.id});

  @override
  State<DetailSellerProduct> createState() => _DetailSellerProductState();
}

class _DetailSellerProductState extends State<DetailSellerProduct> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      BlocProvider.of<DetailBloc>(context, listen: false)
          .add(OnDetailChanged(widget.id));
        BlocProvider.of<DetailBloc>(context, listen: false).add(OnLoadFavoriteStatus(widget.id));
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      BlocConsumer<DetailBloc, DetailState>(
        listener:  (context, state) async {
          if(state.favoritemessage == DetailBloc.addedFavorite ||
          state.favoritemessage == DetailBloc.removedFavorite) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.favoritemessage)));
          } else {
            showDialog(context: context, 
            builder: (context) {
              return AlertDialog(content: Text(state.favoritemessage));
            });
          }
        },
        listenWhen: (previousState, currentState) =>
          previousState.favoritemessage != currentState.favoritemessage &&
          currentState.favoritemessage != '',
          builder: (context, state){
            if(state.detailArtState == RequestState.Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.detailArtState == RequestState.Loaded) {
              final art = state.detailArt;
              return SafeArea(
                child: DetailContent(
                  art!,
                  state.getFavoriteStatus,
                ),
              );
            } else if (state.detailArtState == RequestState.Error) {
              return Text(state.message);
            } else {
              return Container(child: Text(''));
            }
          },
        ),
    );
  }


  // Widget build(BuildContext context) {
  //   return DefaultTabController(
  //     length: 2,
  //     child: Scaffold(
  //     appBar: AppBar(
  //       elevation: 0,
  //       toolbarHeight: 70,
  //       backgroundColor: const Color.fromARGB(255, 255, 255, 255),
  //       title: Container (child: const Text('Art Details', style: const TextStyle(color: Color.fromARGB(255, 45, 74, 148),fontWeight: FontWeight.bold, fontSize: 20), ),
  //       ),
  //       centerTitle: true,
  //       leading: 
  //       Padding(padding: const EdgeInsets.all(12.0),
  //       child: Container(child: Image.asset("images/logos.jpeg")
  //       ),  
  //       ), 
  //     ),
  //     body: SingleChildScrollView(
  //       child: Column(children: [
  //         Stack(
  //           children: [
  //             Container(
  //                 child: Container(
                    
  //                   height: MediaQuery.of(context).size.height * 0.36,
  //                   width:  MediaQuery.of(context).size.height * 0.45,
  //                   decoration: BoxDecoration(
                      
  //                     borderRadius: BorderRadius.circular(15),
  //                     image: DecorationImage(
  //                       image: AssetImage(widget.place.image),
  //                       // image: AssetImage('images/tariseblang.jpg'),
  //                     fit: BoxFit.fill,
  //                     ),
  //                     boxShadow: [
  //                       const BoxShadow(
  //                         color: Colors.grey,
  //                         offset: Offset(1.0, 4.0),
  //                         blurRadius: 6.0
                    
  //                       )
  //                     ]
  //                   ),
  //                 ),
  //             ),
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: <Widget>[
  //                 const SizedBox(height: 200,),

  //                 Container(
  //                   padding: const EdgeInsets.only(left: 20 ),
  //                   child: Text(widget.place.provience, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),),
  //                 ),
  //                 const SizedBox(height: 4,),
  //                 Container(
  //                    padding: const EdgeInsets.only(left: 20 ),
  //                   child: Text(widget.place.name, style: const TextStyle(color: Colors.white, fontSize: 27, fontWeight: FontWeight.w800),),
  //                 ),
  //                 const SizedBox(height: 4,),
  //                 Container(
  //                    padding: const EdgeInsets.only(left: 20 ),
  //                   child: Text(widget.place.price.toString(), style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),),
  //                 ),
  //               ],
  //             )
            
  //           ],
  //         ),
  //         const SizedBox(height:5,), Container(
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(15),
  //           ),
            
  //           padding: const EdgeInsets.all(20),
  //           child: TabBar(
  //             // padding: EdgeInsets.all(10),
  //             indicator: BoxDecoration(
  //               color: const Color.fromARGB(255, 45, 74, 148),
  //               borderRadius: BorderRadius.circular(10),
  //             ),
  //             tabs: const [
  //                Tab(child:  Text('Description', style:  TextStyle(color:  Color.fromARGB(255, 221, 221, 221), fontWeight: FontWeight.bold, fontSize: 17)),),
  //                Tab(child:  Text('Contacts', style:  TextStyle(color: Color.fromARGB(255, 221, 221, 221), fontWeight: FontWeight.bold, fontSize: 17)),)
  //             ],
  //           ),
  //         ),
          
  //         SizedBox(
  //           height: MediaQuery.of(context).size.height * 0.50,            
  //           child: TabBarView(
  //             children: [
  //             SingleChildScrollView(child: Container(
  //               padding: const EdgeInsets.only(left: 15, right: 15),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   SingleChildScrollView(
  //                     scrollDirection: Axis.vertical,
  //                     child: SizedBox(
  //                       width: MediaQuery.of(context).size.width,
  //                       // padding: EdgeInsets.all(5),
  //                       height: 250,
  //                       // color: Colors.white,
  //                       child: Padding(
  //                         padding: const EdgeInsets.only(left: 8.0, right: 9),
  //                         child: Text(widget.place.description,
  //                         style: const TextStyle(color:  Color.fromARGB(255, 190, 190, 190),fontWeight: FontWeight.w400 , fontSize: 13),),
                          
  //                       ),
  //                       ),
  //                   ),
  //                   Container(
  //                       child: Row(
  //                         children: [
  //                           const Padding(
  //                           padding: EdgeInsets.only(left:5.0),
  //                           child: Text(
  //                             "Docummentations", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: const Color.fromARGB(255, 234, 132, 0),),
  //                           ),
  //                         ),
  //                         Container(
  //                           padding: const EdgeInsets.only(left: 1),
  //                           child: const Icon(
  //                       Icons.arrow_drop_down_rounded, size: 30,
  //                       color: const Color.fromARGB(255, 240, 190, 65),
  //                     ),
  //                         )
  //                         ],
  //                       ),
  //                       alignment: Alignment.bottomLeft,
  //                     ),
  //                   Container(
  //                     child: Center(
  //                       child: Column(
  //                         children: [
  //                           const SizedBox(height: 7,),
  //                           Row(
  //                             children: [
  //                                 Container(
  //                                   padding: const EdgeInsets.only(left: 3),
  //                 child: Container(
  //                   height: MediaQuery.of(context).size.height * 0.11,
  //                   width:  MediaQuery.of(context).size.height * 0.14,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(10),
  //                       image: const DecorationImage(image: const AssetImage('images/tariseblang_d.jpg'),
  //                       fit: BoxFit.fill,
  //                       ),
  //                       boxShadow: [
  //                         const BoxShadow(
  //                           color: Colors.grey,
  //                           offset: const Offset(1.0, 5.0),
  //                           blurRadius: 6.0
  //                         )
  //                       ]
  //                   ),
  //                 ),
  //             ),
  //             const SizedBox(width: 12,),
  //             Container(
  //                 child: Container(
  //                   height: MediaQuery.of(context).size.height * 0.11,
  //                   width:  MediaQuery.of(context).size.height * 0.14,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(10),
  //                       image: const DecorationImage(image: const AssetImage('images/tariseblang_dd.jpeg'),
  //                       fit: BoxFit.fill,
  //                       ),
  //                       boxShadow: [
  //                         const BoxShadow(
  //                           color: Colors.grey,
  //                           offset: Offset(1.0, 5.0),
  //                           blurRadius: 6.0
  //                         )
  //                       ]
  //                   ),
  //                 ),
  //             ),
  //             const SizedBox(width: 12,),
  //             Container(
  //                 child: Container(
  //                   height: MediaQuery.of(context).size.height * 0.11,
  //                   width:  MediaQuery.of(context).size.height * 0.14,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(10),
  //                       image: const DecorationImage(image: const AssetImage('images/tariseblang_ddd.jpg'),
  //                       fit: BoxFit.fill,
  //                       ),
  //                       boxShadow: [
  //                         const BoxShadow(
  //                           color: Colors.grey,
  //                           offset: const Offset(1.0, 5.0),
  //                           blurRadius: 6.0
  //                         )
  //                       ]
  //                   ),
  //                 ),
  //             ),

  //                             ],
  //                           ),
  //                         ],
  //                       ),
  //                     )
  //                   ),
  //                 ],
  //               ),
  //             ),),
  //             Container(
  //               child: Container(
  //               padding: const EdgeInsets.only(left: 35, right: 35),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                     Container(
  //                     width: MediaQuery.of(context).size.width,
  //                     padding: const EdgeInsets.all(7),
  //                     height: MediaQuery.of(context).size.height * 0.07,
  //                         child: Padding(
  //                       padding: const EdgeInsets.only(left: 5.0),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Container(
  //                       child: ClipRRect(borderRadius: BorderRadius.circular(50),
  //                       child: const Image(image: const AssetImage('images/whatsapp.png',),),
  //                       ),
  //                           ),
  //                           Container(child: const Text('089312345678',
  //                           style: const TextStyle(
  //                             color: const Color.fromARGB(255, 234, 132, 0),
  //                             fontWeight: FontWeight.w800,
  //                             fontSize: 15
  //                           ),),
  //                           ),
  //                           Container(
  //                             child: const CircleAvatar(
  //                     radius: 24,
  //                     backgroundColor: Color.fromARGB(255, 234, 132, 0),
  //                     child: Icon(
  //                       Icons.send, size: 20,
  //                       color: Color.fromARGB(255, 255, 255, 255),
  //                     ),
  //                   ),
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(13),
  //                       color: Colors.white, border: Border.all(
  //                         color: const Color.fromARGB(255, 221, 221, 221),
  //                         width: 3.7)
  //                     ),
  //                     ),
  //                     const SizedBox(height: 12,),
  //                     Container(
  //                     width: MediaQuery.of(context).size.width,
  //                     padding: const EdgeInsets.all(7),
  //                     height: MediaQuery.of(context).size.height * 0.07,
  //                         child: Padding(
  //                       padding: const EdgeInsets.only(left: 5.0),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Container(
  //                       child: ClipRRect(borderRadius: BorderRadius.circular(50),
  //                       child: const Image(image: const AssetImage('images/instagram.png'),),
  //                       ),
  //                           ),
  //                           Container(child: const Text('@rental.ind',
  //                           style: TextStyle(
  //                             color: const Color.fromARGB(255, 234, 132, 0),
  //                             fontWeight: FontWeight.w800,
  //                             fontSize: 15
  //                           ),
  //                           ),),
  //                           Container(
  //                             child: const CircleAvatar(
  //                     radius: 24,
  //                     backgroundColor: Color.fromARGB(255, 234, 132, 0),
  //                     child: Icon(
  //                       Icons.send, size: 20,
  //                       color: Color.fromARGB(255, 255, 255, 255),
  //                     ),
  //                   ),
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(13),
  //                       color: Colors.white, border: Border.all(
  //                         color: const Color.fromARGB(255, 221, 221, 221),
  //                         width: 3.7)
  //                     ),
  //                     ),
  //                     const SizedBox(height: 12,),
  //                     Container(
  //                     width: MediaQuery.of(context).size.width,
  //                     padding: const EdgeInsets.all(7),
  //                     height: MediaQuery.of(context).size.height * 0.07,
  //                         child: Padding(
  //                       padding: const EdgeInsets.only(left: 5.0),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Container(
  //                       child: ClipRRect(borderRadius: BorderRadius.circular(50),
  //                       child: const Image(image: const AssetImage('images/facebook.jpg'),),
  //                       ),
  //                           ),
  //                           Container(child: const Text('rentalindonesia',
  //                           style: const TextStyle(
  //                             color: const Color.fromARGB(255, 234, 132, 0),
  //                             fontWeight: FontWeight.w800,
  //                             fontSize: 15
  //                           ),
  //                           ),),
  //                           Container(
  //                             child: const CircleAvatar(
  //                     radius: 24,
  //                     backgroundColor: Color.fromARGB(255, 234, 132, 0),
  //                     child: Icon(
  //                       Icons.send, size: 20,
  //                       color: Color.fromARGB(255, 255, 255, 255),
  //                     ),
  //                   ),
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(13),
  //                       color: Colors.white, border: Border.all(
  //                        color: const Color.fromARGB(255, 221, 221, 221),
  //                         width: 3.7)
  //                     ),
  //                     ),
  //                 ],
  //               ),
  //             ),
  //         )]),
  //         ),
  //       ]),
  //     )
  //   ));
  // }
}

class DetailContent extends StatelessWidget {
  final DetailArt art;
  // final List<Art>
  final bool getFavoriteStatus;
  
  const DetailContent(this.art, this.getFavoriteStatus);


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Container (child: const Text('Art Details', style: const TextStyle(color: Color.fromARGB(255, 45, 74, 148),fontWeight: FontWeight.bold, fontSize: 20), ),
        ),
        centerTitle: true,
        leading: 
        Padding(padding: const EdgeInsets.all(12.0),
        child: Container(child: Image.asset("images/logos.jpeg")
        ),  
        ), 
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              Container(
                  child: Container(
                    
                    height: MediaQuery.of(context).size.height * 0.36,
                    width:  MediaQuery.of(context).size.height * 0.45,
                    decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage('$BASE_IMAGE_KESENIAN_URL${art.image}',),
                      //     Image.network(
                      //   '$BASE_IMAGE_KESENIAN_URL${arts.image}', width: 150, height: 200, fit: BoxFit.cover,
                      // ),
                        // image: AssetImage('images/tariseblang.jpg'),
                      fit: BoxFit.fill,
                      ),
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1.0, 4.0),
                          blurRadius: 6.0
                    
                        )
                      ]
                    ),
                  ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Padding(
                    padding: const EdgeInsets.only(
                    top: 17, right: 10),
                    child: StarButton(),
                  ),
                  ),
                  const SizedBox(height: 140,),
                  Container(
                    padding: const EdgeInsets.only(left: 20 ),
                    child: Text(art.province, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),),
                  ),
                  const SizedBox(height: 4,),
                  Container(
                     padding: const EdgeInsets.only(left: 20 ),
                    child: Text(art.name, style: const TextStyle(color: Colors.white, fontSize: 27, fontWeight: FontWeight.w800),),
                  ),
                  const SizedBox(height: 4,),
                  Container(
                     padding: const EdgeInsets.only(left: 20 ),
                    child: Text(art.price.toString(), style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),),
                  ),
                ],
              )
            
            ],
          ),
          const SizedBox(height:5,), Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            
            padding: const EdgeInsets.all(20),
            child: TabBar(
              // padding: EdgeInsets.all(10),
              indicator: BoxDecoration(
                color: const Color.fromARGB(255, 45, 74, 148),
                borderRadius: BorderRadius.circular(10),
              ),
              tabs: const [
                 Tab(child:  Text('Description', style:  TextStyle(color:  Color.fromARGB(255, 221, 221, 221), fontWeight: FontWeight.bold, fontSize: 17)),),
                 Tab(child:  Text('Contacts', style:  TextStyle(color: Color.fromARGB(255, 221, 221, 221), fontWeight: FontWeight.bold, fontSize: 17)),)
              ],
            ),
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
                        width: MediaQuery.of(context).size.width,
                        // padding: EdgeInsets.all(5),
                        height: 250,
                        // color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 9),
                          child: Text(art.description,
                          style: const TextStyle(color:  Color.fromARGB(255, 190, 190, 190),fontWeight: FontWeight.w400 , fontSize: 13),),
                          
                        ),
                        ),
                    ),
                    Container(
                        child: Row(
                          children: [
                            const Padding(
                            padding: EdgeInsets.only(left:5.0),
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
                                    padding: const EdgeInsets.only(left: 3),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.11,
                    width:  MediaQuery.of(context).size.height * 0.14,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(image: const AssetImage('images/tariseblang_d.jpg'),
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
                        boxShadow: [
                          const BoxShadow(
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
                padding: const EdgeInsets.only(left: 35, right: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                        child: const Image(image: const AssetImage('images/whatsapp.png',),),
                        ),
                            ),
                            Container(child: const Text('089312345678',
                            style: const TextStyle(
                              color: const Color.fromARGB(255, 234, 132, 0),
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
                            Container(child: const Text('@rental.ind',
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
                            Container(child: const Text('rentalindonesia',
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
      )
    ));
  }
  }


class StarButton extends StatefulWidget {
  @override
  _StarButtonState createState() => _StarButtonState();
}

class _StarButtonState extends State<StarButton> {
  bool isStar = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isStar ? Icons.star : Icons.star_border,
        color: Color.fromARGB(255, 240, 190, 65),
      ),
      onPressed: () {
        setState(() {
          isStar = !isStar;
        });
      },
    );
  }
}
