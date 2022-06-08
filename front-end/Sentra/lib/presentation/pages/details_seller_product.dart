import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:sentra/common/constants.dart';
import 'package:provider/provider.dart';
import 'package:sentra/common/result_state.dart';
import 'package:sentra/data/api/api_service.dart';
import 'package:sentra/presentation/provider/detail_provider.dart';
import 'package:readmore/readmore.dart';


// class DetailSellerProduct extends StatefulWidget {
//   static const routeName = '/detail_product';
//   final String id;
//   DetailSellerProduct({required this.id});

//   @override
//   State<DetailSellerProduct> createState() => _DetailSellerProductState();
// }

// class _DetailSellerProductState extends State<DetailSellerProduct> {
//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(() {
//       // BlocProvider.of<DetailBloc>(context, listen: false)
//       //     .add(OnDetailChanged(widget.id));
//       //   BlocProvider.of<DetailBloc>(context, listen: false).add(OnLoadFavoriteStatus(widget.id));
//             Provider.of<DetailNotifier>(context, listen: false)
//           .fetchMovieDetail(widget.id);
//       Provider.of<DetailNotifier>(context, listen: false)
//           .OnLoadFavoriteStatus(widget.id);
//     });
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: 
//       // BlocConsumer<DetailBloc, DetailState>(
//       Consumer<DetailNotifier>(
//         // listener:  (context, state) async {
//         //   if(state.favoritemessage == DetailBloc.addedFavorite ||
//         //   state.favoritemessage == DetailBloc.removedFavorite) {
//         //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.favoritemessage)));
//         //   } else {
//         //     showDialog(context: context, 
//         //     builder: (context) {
//         //       return AlertDialog(content: Text(state.favoritemessage));
//         //     });
//         //   }
//         // },
//         builder:  (context, provider, child) {
//           if (provider.artState == RequestState.Loading) {
//           return Center
//           (child: CircularProgressIndicator(),);

//           } else if (provider.artState == RequestState.Loaded) { 
//             final art = provider.art;
//           return SafeArea(child: DetailContent(
//             art,
//             provider.getFavoriteStatus,
//           ));
            
//           } else {
//             return Text(provider.message);
//           }
//         },
//         // listenWhen: (previousState, currentState) =>
//         //   previousState.favoritemessage != currentState.favoritemessage &&
//         //   currentState.favoritemessage != '',
//         //   builder: (context, state){
//         //     if(state.detailArtState == RequestState.Loading) {
//         //       return const Center(
//         //         child: CircularProgressIndicator(),
//         //       );
//         //     } else if (state.detailArtState == RequestState.Loaded) {
//         //       final art = state.detailArt!;
//         //       return SafeArea(
//         //         child: DetailContent(
//         //           art,
//         //           state.getFavoriteStatus,
//         //         ),
//         //       );
//         //     } else if (state.detailArtState == RequestState.Error) {
//         //       return Text(state.message);
//         //     } else {
//         //       return const Text('');
//         //     }
//         //   },
//         ),
//     );
//   }
// }

class DetailSellerProduct extends StatelessWidget {
  static const routeName = '/detail_product';

  final String id;

  // final DetailArt art;
  // final bool getFavoriteStatus;
  const DetailSellerProduct({required
    this.id});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailProvider>( 
      create: (_) => DetailProvider(
        id: id, detailApiService: ApiService()),
        child: Scaffold(
          body: Consumer<DetailProvider>(
            builder: (context, state, _) {
              if(state.detailState == ResultState.hasData) {
                return DefaultTabController(
                  length: 2,
                  child: Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    toolbarHeight: 70,
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    title: Container (child: const Text('Art Details', style: TextStyle(color: Color.fromARGB(255, 45, 74, 148),fontWeight: FontWeight.bold, fontSize: 20), ),
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
                height: MediaQuery.of(context).size.height * 0.36,
                width:  MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage('${ApiService.baseImageArt}${state.detail.data.image}',),
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
                    child: Text(state.detail.data.province, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),),
                  ),
                  const SizedBox(height: 4,),
                  Container(
                     padding: const EdgeInsets.only(left: 20 ),
                    child: Text(state.detail.data.name, style: const TextStyle(color: Colors.white, fontSize: 27, fontWeight: FontWeight.w800),),
                  ),
                  const SizedBox(height: 4,),
                  Container(
                     padding: const EdgeInsets.only(left: 20 ),
                    child: Text(state.detail.data.price, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),),
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
                        // color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 9),
                          child: ReadMoreText(state.detail.data.description,
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
                padding: const EdgeInsets.only(left: 35, right: 35),
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
                            Container(child: Text(state.detail.data.phoneNumber,
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
                            Container(child: Text(state.detail.data.isInstagram,
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
                            Container(child: Text(state.detail.data.isFacebook,
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
              } else if (state.detailState == ResultState.noData){
                return Center(child: Text(state.message),);
              } else if (state.detailState == ResultState.error) {
                return const Center(child: Text('error'));
              } else {
                return const Center(child:  Text(' '),);
              }
            }
          ),
        ),

    );

    // DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //   appBar: AppBar(
    //     elevation: 0,
    //     toolbarHeight: 70,
    //     backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    //     title: Container (child: const Text('Art Details', style: TextStyle(color: Color.fromARGB(255, 45, 74, 148),fontWeight: FontWeight.bold, fontSize: 20), ),
    //     ),
    //     centerTitle: true,
    //     leading: 
    //     Padding(padding: const EdgeInsets.all(12.0),
    //     child: Container(child: Image.asset("images/logos.jpeg")
    //     ),  
    //     ), 
    //   ),
    //   body: SingleChildScrollView(
    //     child: Column(children: [
    //       Stack(
    //         children: [
    //           Container(
    //             height: MediaQuery.of(context).size.height * 0.36,
    //             width:  MediaQuery.of(context).size.height * 0.45,
    //             decoration: BoxDecoration(
                  
    //               borderRadius: BorderRadius.circular(15),
    //               image: DecorationImage(
    //                 image: NetworkImage('$BASE_IMAGE_KESENIAN_URL${art.image}',),
    //               fit: BoxFit.fill,
    //               ),
    //               boxShadow: const [
    //                 BoxShadow(
    //                   color: Colors.grey,
    //                   offset: Offset(1.0, 4.0),
    //                   blurRadius: 6.0
                
    //                 )
    //               ]
    //             ),
    //           ),
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: <Widget>[
    //               Container(
    //                 child: Padding(
    //                 padding: const EdgeInsets.only(
    //                 top: 17, right: 10),
    //                 // child: StarButton(),
    //                 child: ElevatedButton(
    //                   onPressed: ()  async 
    //                   {
    //                      if(!getFavoriteStatus) {
    //                       Provider.of<DetailNotifier>(context,
    //                       listen: false).addWatchlist(art);
    //                     } else {
    //                       Provider.of<DetailNotifier>(context, listen: false).removeFromWatchlist(art);
    //                     }

    //                     final message =
    //                                 Provider.of<DetailNotifier>(context,
    //                                         listen: false)
    //                                     .favoritemessage;

    //                             if (message ==
    //                                     DetailNotifier
    //                                         .addedFavorite ||
    //                                 message ==
    //                                     DetailNotifier
    //                                         .removedFavorite) {
    //                               ScaffoldMessenger.of(context).showSnackBar(
    //                                   SnackBar(content: Text(message)));
    //                             } else {
    //                               showDialog(
    //                                   context: context,
    //                                   builder: (context) {
    //                                     return AlertDialog(
    //                                       content: Text(message),
    //                                     );
    //                                   });
    //                             }
    //                   },
    //                   // {
    //                   //   if(!getFavoriteStatus) {
    //                   //     BlocProvider.of<DetailBloc>(context,
    //                   //     listen: false).add(OnAddFavorite(art));
    //                   //   } else {
    //                   //     BlocProvider.of<DetailBloc>(context, listen: false).add(OnRemoveFavorite(art));
    //                   //   }
    //                   // },
    //                   child : Row(
    //                     mainAxisSize: MainAxisSize.min,
    //                     children: [
    //                       getFavoriteStatus ? const Icon (Icons.star_border, color: Color.fromARGB(255, 240, 190, 65),)
    //                       : const Icon(Icons.star_border_outlined,  color: Color.fromARGB(255, 240, 190, 65))
    //                     ],
    //                   )
    //                 ),
    //               ),
    //               ),
    //               const SizedBox(height: 140,),
    //               Container(
    //                 padding: const EdgeInsets.only(left: 20 ),
    //                 // REVISI
    //                 child: Text(art.province, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),),
    //               ),
    //               const SizedBox(height: 4,),
    //               Container(
    //                  padding: const EdgeInsets.only(left: 20 ),
    //                 child: Text(art.name, style: const TextStyle(color: Colors.white, fontSize: 27, fontWeight: FontWeight.w800),),
    //               ),
    //               const SizedBox(height: 4,),
    //               Container(
    //                  padding: const EdgeInsets.only(left: 20 ),
    //                 child: Text(art.price, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),),
    //               ),
    //             ],
    //           )
            
    //         ],
    //       ),
    //       const SizedBox(height:5,), Container(
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(15),
    //         ),
            
    //         padding: const EdgeInsets.all(20),
    //         child: TabBar(
    //           // padding: EdgeInsets.all(10),
    //           indicator: BoxDecoration(
    //             color: const Color.fromARGB(255, 45, 74, 148),
    //             borderRadius: BorderRadius.circular(10),
    //           ),
    //           tabs: const [
    //              Tab(child:  Text('Description', style:  TextStyle(color:  Color.fromARGB(255, 221, 221, 221), fontWeight: FontWeight.bold, fontSize: 17)),),
    //              Tab(child:  Text('Contacts', style:  TextStyle(color: Color.fromARGB(255, 221, 221, 221), fontWeight: FontWeight.bold, fontSize: 17)),)
    //           ],
    //         ),
    //       ),
          
    //       SizedBox(
    //         height: MediaQuery.of(context).size.height * 0.50,            
    //         child: TabBarView(
    //           children: [
    //           SingleChildScrollView(child: Container(
    //             padding: const EdgeInsets.only(left: 15, right: 15),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 SingleChildScrollView(
    //                   scrollDirection: Axis.vertical,
    //                   child: SizedBox(
    //                     width: MediaQuery.of(context).size.width,
    //                     // padding: EdgeInsets.all(5),
    //                     height: 250,
    //                     // color: Colors.white,
    //                     child: Padding(
    //                       padding: const EdgeInsets.only(left: 8.0, right: 9),
    //                       // REVISI
    //                       child: Text(art.description,
    //                       style: const TextStyle(color:  Color.fromARGB(255, 190, 190, 190),fontWeight: FontWeight.w400 , fontSize: 13),),
                          
    //                     ),
    //                     ),
    //                 ),
    //                 Container(
    //                     child: Row(
    //                       children: [
    //                         const Padding(
    //                         padding: EdgeInsets.only(left:5.0),
    //                         child: Text(
    //                           "Docummentations", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: const Color.fromARGB(255, 234, 132, 0),),
    //                         ),
    //                       ),
    //                       Container(
    //                         padding: const EdgeInsets.only(left: 1),
    //                         child: const Icon(
    //                     Icons.arrow_drop_down_rounded, size: 30,
    //                     color: const Color.fromARGB(255, 240, 190, 65),
    //                   ),
    //                       )
    //                       ],
    //                     ),
    //                     alignment: Alignment.bottomLeft,
    //                   ),
    //                 Container(
    //                   child: Center(
    //                     child: Column(
    //                       children: [
    //                         const SizedBox(height: 7,),
    //                         Row(
    //                           children: [
    //                               Container(
    //                                 padding: const EdgeInsets.only(left: 3),
    //               child: Container(
    //                 height: MediaQuery.of(context).size.height * 0.11,
    //                 width:  MediaQuery.of(context).size.height * 0.14,
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(10),
    //                     image: const DecorationImage(image: const AssetImage('images/tariseblang_d.jpg'),
    //                     fit: BoxFit.fill,
    //                     ),
    //                     boxShadow: const [
    //                       BoxShadow(
    //                         color: Colors.grey,
    //                         offset: Offset(1.0, 5.0),
    //                         blurRadius: 6.0
    //                       )
    //                     ]
    //                 ),
    //               ),
    //           ),
    //           const SizedBox(width: 12,),
    //           Container(
    //               child: Container(
    //                 height: MediaQuery.of(context).size.height * 0.11,
    //                 width:  MediaQuery.of(context).size.height * 0.14,
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(10),
    //                     image: const DecorationImage(image: const AssetImage('images/tariseblang_dd.jpeg'),
    //                     fit: BoxFit.fill,
    //                     ),
    //                     boxShadow: const [
    //                       BoxShadow(
    //                         color: Colors.grey,
    //                         offset: Offset(1.0, 5.0),
    //                         blurRadius: 6.0
    //                       )
    //                     ]
    //                 ),
    //               ),
    //           ),
    //           const SizedBox(width: 12,),
    //           Container(
    //               child: Container(
    //                 height: MediaQuery.of(context).size.height * 0.11,
    //                 width:  MediaQuery.of(context).size.height * 0.14,
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(10),
    //                     image: const DecorationImage(image: const AssetImage('images/tariseblang_ddd.jpg'),
    //                     fit: BoxFit.fill,
    //                     ),
    //                     boxShadow: [
    //                       const BoxShadow(
    //                         color: Colors.grey,
    //                         offset: const Offset(1.0, 5.0),
    //                         blurRadius: 6.0
    //                       )
    //                     ]
    //                 ),
    //               ),
    //           ),

    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //                   )
    //                 ),
    //               ],
    //             ),
    //           ),),
    //           Container(
    //             child: Container(
    //             padding: const EdgeInsets.only(left: 35, right: 35),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                   Container(
    //                   width: MediaQuery.of(context).size.width,
    //                   padding: EdgeInsets.all(7),
    //                   height: MediaQuery.of(context).size.height * 0.07,
    //                       child: Padding(
    //                     padding:  const EdgeInsets.only(left: 5.0),
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         Container(
    //                     child: ClipRRect(borderRadius: BorderRadius.circular(50),
    //                     child:  const Image(image:  AssetImage('images/whatsapp.png',),),
    //                     ),
    //                         ),
    //                         // REVISI
    //                         Container(child: Text(art.phoneNumber,
    //                         style: const TextStyle(
    //                           color: Color.fromARGB(255, 234, 132, 0),
    //                           fontWeight: FontWeight.w800,
    //                           fontSize: 15
    //                         ),),
    //                         ),
    //                         Container(
    //                           child: const CircleAvatar(
    //                   radius: 24,
    //                   backgroundColor: Color.fromARGB(255, 234, 132, 0),
    //                   child: Icon(
    //                     Icons.send, size: 20,
    //                     color: Color.fromARGB(255, 255, 255, 255),
    //                   ),
    //                 ),
    //                         )
    //                       ],
    //                     ),
    //                   ),
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(13),
    //                     color: Colors.white, border: Border.all(
    //                       color: const Color.fromARGB(255, 221, 221, 221),
    //                       width: 3.7)
    //                   ),
    //                   ),
    //                   const SizedBox(height: 12,),
    //                   Container(
    //                   width: MediaQuery.of(context).size.width,
    //                   padding: const EdgeInsets.all(7),
    //                   height: MediaQuery.of(context).size.height * 0.07,
    //                       child: Padding(
    //                     padding: const EdgeInsets.only(left: 5.0),
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         Container(
    //                     child: ClipRRect(borderRadius: BorderRadius.circular(50),
    //                     child: const Image(image: const AssetImage('images/instagram.png'),),
    //                     ),
    //                         ),
    //                         // revisi
    //                         Container(child: Text(art.isInstagram,
    //                         style: TextStyle(
    //                           color: const Color.fromARGB(255, 234, 132, 0),
    //                           fontWeight: FontWeight.w800,
    //                           fontSize: 15
    //                         ),
    //                         ),),
    //                         Container(
    //                           child: const CircleAvatar(
    //                   radius: 24,
    //                   backgroundColor: Color.fromARGB(255, 234, 132, 0),
    //                   child: Icon(
    //                     Icons.send, size: 20,
    //                     color: Color.fromARGB(255, 255, 255, 255),
    //                   ),
    //                 ),
    //                         )
    //                       ],
    //                     ),
    //                   ),
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(13),
    //                     color: Colors.white, border: Border.all(
    //                       color: const Color.fromARGB(255, 221, 221, 221),
    //                       width: 3.7)
    //                   ),
    //                   ),
    //                   const SizedBox(height: 12,),
    //                   Container(
    //                   width: MediaQuery.of(context).size.width,
    //                   padding: const EdgeInsets.all(7),
    //                   height: MediaQuery.of(context).size.height * 0.07,
    //                       child: Padding(
    //                     padding: const EdgeInsets.only(left: 5.0),
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         Container(
    //                     child: ClipRRect(borderRadius: BorderRadius.circular(50),
    //                     child: const Image(image: const AssetImage('images/facebook.jpg'),),
    //                     ),
    //                         ),
    //                         // revisi
    //                         Container(child: Text(art.phoneNumber,
    //                         style: const TextStyle(
    //                           color: const Color.fromARGB(255, 234, 132, 0),
    //                           fontWeight: FontWeight.w800,
    //                           fontSize: 15
    //                         ),
    //                         ),),
    //                         Container(
    //                           child: const CircleAvatar(
    //                   radius: 24,
    //                   backgroundColor: Color.fromARGB(255, 234, 132, 0),
    //                   child: Icon(
    //                     Icons.send, size: 20,
    //                     color: Color.fromARGB(255, 255, 255, 255),
    //                   ),
    //                 ),
    //                         )
    //                       ],
    //                     ),
    //                   ),
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(13),
    //                     color: Colors.white, border: Border.all(
    //                      color: const Color.fromARGB(255, 221, 221, 221),
    //                       width: 3.7)
    //                   ),
    //                   ),
    //               ],
    //             ),
    //           ),
    //       )]),
    //       ),
    //     ]),
    //   )
    // ));
  }

  // String _documlist(List<Docum> documKesenians) {
  //   String result = '';
  //   for (var documentation in documKesenians) {
  //     result += documentation.documentation;
  //   }

  //   if (result.isEmpty){
  //     return result;
  //   }

  //   return result..substring(0, result.length -2);
  // }
}
