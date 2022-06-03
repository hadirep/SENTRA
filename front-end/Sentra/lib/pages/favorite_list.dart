// <<<<<<< HEAD
// import 'package:flutter/material.dart';
// import 'package:sentra/models/art_list.dart';
// import 'package:sentra/pages/product_management.dart';
// import 'details_seller_product.dart';
// import 'list.dart';
// =======
// import 'package:flutter/material.dart';
// import 'package:sentra/models/art_list.dart';
// import 'details_seller_product.dart';
// import 'list.dart';
// >>>>>>> bd643b5e2a509e40f94a7ebfe237bab79b3852b4

// class FavoriteList extends StatelessWidget {
//   static const routeName = '/favorite_page';
//   const FavoriteList({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         toolbarHeight: 70,
//         backgroundColor: Color.fromARGB(255, 255, 255, 255),
//         title: Container (child: Text('Favorite List', style: TextStyle(color: Color.fromARGB(255, 45, 74, 148),), ), 
//         ),
//         centerTitle: true,
//         leading: 
//         Padding(
//           padding: const EdgeInsets.all(12.0),
//         child: IconButton(
//         icon: Image.asset("images/logos.jpeg"),
//         onPressed: () {
//         // Navigator.pushNamed(context, ProductManagement.routeName);
//         }
//         ),  
//         ), 
//       ),
//       body: 
//       Card(
//         child: Stack(
//           children: <Widget>[
//             Container(
//               // color: Colors.grey,
//               margin: EdgeInsets.only(left: 20, right: 20, top: 15),
//               height: 45,
//               child: TextField(
//                 textAlign: TextAlign.center,
//                 // cursorColor: Colors.red,
//                 decoration: InputDecoration(
//                   focusedBorder: OutlineInputBorder(
//                          borderSide: BorderSide(color: Color.fromARGB(255, 240, 190, 65), width: 2.0),
//                          borderRadius: BorderRadius.circular(10),
//                        ),
//                   hintText: 'search here ...', hintStyle: TextStyle(color: Colors.grey), 
//                   prefixIcon: Container(
//                     padding:EdgeInsets.all(10), child: Icon(Icons.search, color: Color.fromARGB(255, 45, 74, 148), size: 28,)),
//                   enabledBorder:OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: const BorderSide(color: Color.fromARGB(255, 240, 190, 65), width: 2.5)
//                   ), 
//                 ),
//               ),
//             ),
//             SizedBox(height: 10,),
//             Padding(
//               padding: const EdgeInsets.only(top:70),
//               child: Container(
//               // color: Colors.grey,
//                 child: ListView(
//                   scrollDirection: Axis.vertical,
//                   children: <Widget>[
//                     Padding(
//                       padding: EdgeInsets.only(left: 15, right: 15,),
//                       child: Container(
//                         width: MediaQuery.of(context).size.width,
//                         height: MediaQuery.of(context).size.height,
//                         //List View Products
//                         child:  ListView.builder(
//                           shrinkWrap: true,
//                           itemBuilder: (context, index) {
//                             final ArtList place = dataArtList[index];
//                             return InkWell(
//                               onTap: () {
//                                 Navigator.push(context,
//                                     MaterialPageRoute(builder: (context) {
//                                   return DetailSellerProduct(place: place);
//                                 }));
//                               },
                              
//                               child: Card( 
//                                 color: Color.fromARGB(255, 252, 241, 215),
//                                 shape: OutlineInputBorder( 
//                                   borderSide: BorderSide(color: Color.fromARGB(255, 240, 190, 65), width: 2.0),
//                          borderRadius: BorderRadius.circular(15),),
//                                 child:
//                                 Column(
//                                   children: [
//                                     SizedBox(height: 15,),
//                                    Container(
//                                      child: Row(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: <Widget>[
//                                         SizedBox(width: 15,),
//                                          Container(
//                                           child: Container(
                                            
//                                             height: MediaQuery.of(context).size.height * 0.1,
//                                             width:  MediaQuery.of(context).size.width * 0.3,
//                                             decoration: BoxDecoration(
                                              
//                                               borderRadius: BorderRadius.circular(15),
//                                               image: DecorationImage(
//                                                 image: AssetImage(place.image),
//                                                 // image: AssetImage('images/tariseblang.jpg'),
//                                               fit: BoxFit.fill,
//                                               ),
//                                               // boxShadow: [
//                                               //   BoxShadow(
//                                               //     color: Colors.grey,
//                                               //     offset: Offset(1.0, 4.0),
//                                               //     blurRadius: 6.0
                                            
//                                               //   )
//                                               // ]
//                                             ),
//                                           ),
//                                       ),
//                                       SizedBox(width: 10,),
//                                         // Expanded(
//                                         //   flex: 1,
//                                         //   child: Image.asset(
//                                         //     place.image,
//                                         //     width: 100,
//                                         //     height: 80,
//                                         //   ),
//                                         // ),
//                                         Container(
//                                           // flex: 1,
//                                           child: Container(
//                                             padding: const EdgeInsets.only(right: 1.0),
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               mainAxisSize: MainAxisSize.min,
//                                               children: <Widget>[
//                                                 Text(
//                                                   place.name,
//                                                   style: TextStyle(
//                                                       fontSize: 16.0,
//                                                       color: Color.fromARGB(255, 209, 139, 25),
//                                                       fontWeight: FontWeight.bold),
//                                                 ),
//                                                 SizedBox(
//                                                   height: 5,
//                                                 ),
//                                                 Text(
//                                                   place.provience,
//                                                   style: TextStyle(
//                                                       fontSize: 13.0,
//                                                       fontWeight: FontWeight.bold,
//                                                       color: Color.fromARGB(255, 191, 183, 28)),
//                                                 ),
//                                                 Align(
//                                                   alignment: Alignment.topLeft,
//                                             child: Container(
//                                               // padding: const EdgeInsets.only(
//                                               //      right: 1),
//                                               child: StarButton(),
//                                             ),
//                                                 ),                 
//                                                 SizedBox(height: 15,),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                   ),
//                                    ),
//                                   ],
//                                 )
//                                 ),
                                
                              
//                             );
//                           },
//                           itemCount: dataArtList.length,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SearchFavoritePage extends StatelessWidget {
//   const SearchFavoritePage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         toolbarHeight: 70,
//         backgroundColor: Color.fromARGB(255, 255, 255, 255),
//         title: Container (child: Text('Favorite List', style: TextStyle(color: Color.fromARGB(44, 0, 0, 0),), ), 
//         ),
//         centerTitle: true,
//         leading: 
//         Padding(padding: const EdgeInsets.all(12.0),
//         child: Container(child: Image.asset("images/logos.jpeg")
//         ),  
//         ), 
//       ),
//       body: Padding(padding: const EdgeInsets.all(20.0),
//       child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         TextField(
//           decoration: InputDecoration(
//             hintText: 'search here ...',
//             border: OutlineInputBorder()
//           ),
//         )
//       ],),
//       ),
//     );
//   }
// }




// class SearchInput extends StatefulWidget {
//       @override
//       State<SearchInput> createState() => _SearchInputState();
//     }
    
//     class _SearchInputState extends State<SearchInput> {
//       @override
//       Widget build(BuildContext context) {
//         return Container(
//           margin: EdgeInsets.only(top: 25, left: 25, right: 25),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Flexible(
//                     flex: 1,
//                     child: TextField(
//                       cursorColor: Colors.grey,
//                       decoration: InputDecoration(
//                         fillColor: Colors.white,
//                         filled: true,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide.none
//                         ),
//                         hintText: 'Search',
//                         hintStyle: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 18
//                         ),
//                         prefixIcon: Container(
//                           padding: EdgeInsets.all(15),
//                           child: Image.asset('assets/icons/search.png'),
//                           width: 18,
//                         )
//                       ),
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only (left: 10),
//                     padding: EdgeInsets.all(15),
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).primaryColor,
//                       borderRadius: BorderRadius.circular(15)
//                     ),
//                     child: Image.asset(
//                     'assets/icons/filter.png'),
//                     width: 25
//                   ),
//                 ],
//               )
//             ],
//           ),
//         );
//       }
//     }