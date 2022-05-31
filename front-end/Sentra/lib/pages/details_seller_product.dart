// import 'package:flutter/material.dart';

// class DetailSellerProduct extends StatelessWidget {
//     static const routeName = '/detail_product';
//   const DetailSellerProduct({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         toolbarHeight: 70,
//         backgroundColor: Color.fromARGB(255, 255, 255, 255),
//         title: Container (child: Text('Art Details', style: TextStyle(color: Color.fromARGB(255, 45, 74, 148),fontWeight: FontWeight.bold, fontSize: 20), ), 
//         ),
//         centerTitle: true,
//         leading: 
//         Padding(padding: const EdgeInsets.all(12.0),
//         child: Container(child: Image.asset("images/logos.jpeg")
//         ),  
//         ), 
//       ),
//       body: SingleChildScrollView(
//         child: Column(children: [
//           Stack(
//             children: [
//               Container(
//                   child: Container(
                    
//                     height: MediaQuery.of(context).size.height * 0.36,
//                     width:  MediaQuery.of(context).size.height * 0.45,
//                     decoration: BoxDecoration(
                      
//                       borderRadius: BorderRadius.circular(15),
//                       image: DecorationImage(image: AssetImage('images/tariseblang.jpg'),
//                       fit: BoxFit.fill,
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey,
//                           offset: Offset(1.0, 4.0),
//                           blurRadius: 6.0
                    
//                         )
//                       ]
//                     ),
//                   ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   SizedBox(height: 200,),

//                   Container(
//                     padding: EdgeInsets.only(left: 20 ),
//                     child: Text('jawa timur', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),),
//                   ),
//                   SizedBox(height: 4,),
//                   Container(
//                      padding: EdgeInsets.only(left: 20 ),
//                     child: Text('Tari Seblang', style: TextStyle(color: Colors.white, fontSize: 27, fontWeight: FontWeight.w800),),
//                   ),
//                   SizedBox(height: 4,),
//                   Container(
//                      padding: EdgeInsets.only(left: 20 ),
//                     child: Text('Rp 4.590.000', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),),
//                   ),
//                 ],
//               )
            
//             ],
//           ),
//           SizedBox(height:5,), Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//             ),
            
//             padding: EdgeInsets.all(20),
//             child: TabBar(
//               // padding: EdgeInsets.all(10),
//               indicator: BoxDecoration(
//                 color: Color.fromARGB(255, 45, 74, 148),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               tabs: [
//                 Tab(child: Text('Description', style: TextStyle(color: Color.fromARGB(255, 221, 221, 221), fontWeight: FontWeight.bold, fontSize: 17)),),
//                 Tab(child: Text('Contacts', style:  TextStyle(color: Color.fromARGB(255, 221, 221, 221), fontWeight: FontWeight.bold, fontSize: 17)),)
//               ],
//             ),
//           ),
          
//           Container(
//             height: MediaQuery.of(context).size.height * 0.50,            
//             child: TabBarView(
//               children: [
//               SingleChildScrollView(child: Container(
//                 padding: EdgeInsets.only(left: 15, right: 15),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SingleChildScrollView(
//                       child: Container(
//                         width: MediaQuery.of(context).size.width,
//                         // padding: EdgeInsets.all(5),
//                         height: 150,
//                         // color: Colors.white,
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 8.0, right: 9),
//                           child: Text('Kami menyediakan pertunjukan tari seblang pada acara anda. Dengan adat tari ini, tari seblang bertujuan untuk membersihkan desa agar terhindar dari marabahaya',
//                           style: TextStyle(color: Color.fromARGB(255, 190, 190, 190),fontWeight: FontWeight.w400 , fontSize: 13),),
                          
//                         ),
//                         ),
//                     ),
//                     Container(
//                         child: Row(
//                           children: [
//                             Padding(
//                             padding: const EdgeInsets.only(left:5.0),
//                             child: Text(
//                               "Docummentations", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: Color.fromARGB(255, 234, 132, 0),),
//                             ),
//                           ),
//                           Container(
//                             padding: EdgeInsets.only(left: 1),
//                             child: Icon(
//                         Icons.arrow_drop_down_rounded, size: 30,
//                         color: Color.fromARGB(255, 240, 190, 65),
//                       ),
//                           )
//                           ],
//                         ),
//                         alignment: Alignment.bottomLeft,
//                       ),

//                       //untuk grid images sesuai jumlah
//                       // Padding(
//                       //   padding: const EdgeInsets.all(15.0),
//                       //   child: Container(
//                       //     height: 300,
//                       //     child: GridView.count(
//                       //       scrollDirection: Axis.horizontal,
//                       //       crossAxisCount: 2,
//                       //           child: Center(
//                       //             child: Container(
//                       //               child: Card(
//                       //                 elevation: 4,
//                       //                 shape: RoundedRectangleBorder(
//                       //                     borderRadius:
//                       //                         BorderRadius.circular(15)),
//                       //               ),
//                       //             ),
//                       //           ),
                              
//                       //     ),
//                       //   ),
//                       // ),

//                     Container(
//                       child: Center(
//                         child: Column(
//                           children: [
//                             SizedBox(height: 7,),
//                             Row(
//                               children: [
//                                   Container(
//                                     padding: EdgeInsets.only(left: 3),
//                   child: Container(
//                     height: MediaQuery.of(context).size.height * 0.11,
//                     width:  MediaQuery.of(context).size.height * 0.14,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         image: DecorationImage(image: AssetImage('images/tariseblang_d.jpg'),
//                         fit: BoxFit.fill,
//                         ),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey,
//                             offset: Offset(1.0, 5.0),
//                             blurRadius: 6.0
//                           )
//                         ]
//                     ),
//                   ),
//               ),
//               SizedBox(width: 12,),
//               Container(
//                   child: Container(
//                     height: MediaQuery.of(context).size.height * 0.11,
//                     width:  MediaQuery.of(context).size.height * 0.14,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         image: DecorationImage(image: AssetImage('images/tariseblang_dd.jpeg'),
//                         fit: BoxFit.fill,
//                         ),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey,
//                             offset: Offset(1.0, 5.0),
//                             blurRadius: 6.0
//                           )
//                         ]
//                     ),
//                   ),
//               ),
//               SizedBox(width: 12,),
//               Container(
//                   child: Container(
//                     height: MediaQuery.of(context).size.height * 0.11,
//                     width:  MediaQuery.of(context).size.height * 0.14,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         image: DecorationImage(image: AssetImage('images/tariseblang_ddd.jpg'),
//                         fit: BoxFit.fill,
//                         ),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey,
//                             offset: Offset(1.0, 5.0),
//                             blurRadius: 6.0
//                           )
//                         ]
//                     ),
//                   ),
//               ),

//                               ],
//                             ),
//                           ],
//                         ),
//                       )
//                     ),
//                   ],
//                 ),
//               ),),
//               Container(
//                 child: Container(
//                 padding: EdgeInsets.only(left: 35, right: 35),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                       Container(
//                       width: MediaQuery.of(context).size.width,
//                       padding: EdgeInsets.all(7),
//                       height: MediaQuery.of(context).size.height * 0.07,
//                           child: Padding(
//                         padding: const EdgeInsets.only(left: 5.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                         child: ClipRRect(borderRadius: BorderRadius.circular(50),
//                         child: Image(image: AssetImage('images/whatsapp.png',),),
//                         ),
//                             ),
//                             Container(child: Text('089312345678', 
//                             style: TextStyle(
//                               color: Color.fromARGB(255, 234, 132, 0),
//                               fontWeight: FontWeight.w800,
//                               fontSize: 15
//                             ),),
//                             ),
//                             Container(
//                               child: const CircleAvatar(
//                       radius: 24,
//                       backgroundColor: Color.fromARGB(255, 234, 132, 0),
//                       child: Icon(
//                         Icons.send, size: 20,
//                         color: Color.fromARGB(255, 255, 255, 255),
//                       ),
//                     ),
//                             )
//                           ],
//                         ),
//                       ),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(13),
//                         color: Colors.white, border: Border.all(
//                           color: Color.fromARGB(255, 221, 221, 221),
//                           width: 3.7)
//                       ),
//                       ),
//                       SizedBox(height: 12,),
//                       Container(
//                       width: MediaQuery.of(context).size.width,
//                       padding: EdgeInsets.all(7),
//                       height: MediaQuery.of(context).size.height * 0.07,
//                           child: Padding(
//                         padding: const EdgeInsets.only(left: 5.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                         child: ClipRRect(borderRadius: BorderRadius.circular(50),
//                         child: Image(image: AssetImage('images/instagram.png'),),
//                         ),
//                             ),
//                             Container(child: Text('@rental.ind',
//                             style: TextStyle(
//                               color: Color.fromARGB(255, 234, 132, 0),
//                               fontWeight: FontWeight.w800,
//                               fontSize: 15
//                             ),
//                             ),),
//                             Container(
//                               child: const CircleAvatar(
//                       radius: 24,
//                       backgroundColor: Color.fromARGB(255, 234, 132, 0),
//                       child: Icon(
//                         Icons.send, size: 20,
//                         color: Color.fromARGB(255, 255, 255, 255),
//                       ),
//                     ),
//                             )
//                           ],
//                         ),
//                       ),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(13),
//                         color: Colors.white, border: Border.all(
//                           color: Color.fromARGB(255, 221, 221, 221),
//                           width: 3.7)
//                       ),
//                       ),
//                       SizedBox(height: 12,),
//                       Container(
//                       width: MediaQuery.of(context).size.width,
//                       padding: EdgeInsets.all(7),
//                       height: MediaQuery.of(context).size.height * 0.07,
//                           child: Padding(
//                         padding: const EdgeInsets.only(left: 5.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                         child: ClipRRect(borderRadius: BorderRadius.circular(50),
//                         child: Image(image: AssetImage('images/facebook.jpg'),),
//                         ),
//                             ),
//                             Container(child: Text('rentalindonesia', 
//                             style: TextStyle(
//                               color: Color.fromARGB(255, 234, 132, 0),
//                               fontWeight: FontWeight.w800,
//                               fontSize: 15
//                             ),
//                             ),),
//                             Container(
//                               child: const CircleAvatar(
//                       radius: 24,
//                       backgroundColor: Color.fromARGB(255, 234, 132, 0),
//                       child: Icon(
//                         Icons.send, size: 20,
//                         color: Color.fromARGB(255, 255, 255, 255),
//                       ),
//                     ),
//                             )
//                           ],
//                         ),
//                       ),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(13),
//                         color: Colors.white, border: Border.all(
//                          color: Color.fromARGB(255, 221, 221, 221),
//                           width: 3.7)
//                       ),
//                       ),
//                   ],
//                 ),
//               ),
//           )]),
//           ),
//         ]),
//       )
//     ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:sentra/models/art_list.dart';

class DetailSellerProduct extends StatelessWidget {
    static const routeName = '/detail_product';
    final ArtList place;
  DetailSellerProduct({required this.place});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
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
                        image: AssetImage(place.image),
                        // image: AssetImage('images/tariseblang.jpg'),
                      fit: BoxFit.fill,
                      ),
                      boxShadow: [
                        BoxShadow(
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
                  SizedBox(height: 200,),

                  Container(
                    padding: EdgeInsets.only(left: 20 ),
                    child: Text(place.provience, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height: 4,),
                  Container(
                     padding: EdgeInsets.only(left: 20 ),
                    child: Text(place.name, style: TextStyle(color: Colors.white, fontSize: 27, fontWeight: FontWeight.w800),),
                  ),
                  SizedBox(height: 4,),
                  Container(
                     padding: EdgeInsets.only(left: 20 ),
                    child: Text(place.price.toString(), style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),),
                  ),
                ],
              )
            
            ],
          ),
          SizedBox(height:5,), Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            
            padding: EdgeInsets.all(20),
            child: TabBar(
              // padding: EdgeInsets.all(10),
              indicator: BoxDecoration(
                color: Color.fromARGB(255, 45, 74, 148),
                borderRadius: BorderRadius.circular(10),
              ),
              tabs: [
                Tab(child: Text('Description', style: TextStyle(color: Color.fromARGB(255, 221, 221, 221), fontWeight: FontWeight.bold, fontSize: 17)),),
                Tab(child: Text('Contacts', style:  TextStyle(color: Color.fromARGB(255, 221, 221, 221), fontWeight: FontWeight.bold, fontSize: 17)),)
              ],
            ),
          ),
          
          Container(
            height: MediaQuery.of(context).size.height * 0.50,            
            child: TabBarView(
              children: [
              SingleChildScrollView(child: Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        // padding: EdgeInsets.all(5),
                        height: 250,
                        // color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 9),
                          child: Text(place.description,
                          style: TextStyle(color: Color.fromARGB(255, 190, 190, 190),fontWeight: FontWeight.w400 , fontSize: 13),),
                          
                        ),
                        ),
                    ),
                    Container(
                        child: Row(
                          children: [
                            Padding(
                            padding: const EdgeInsets.only(left:5.0),
                            child: Text(
                              "Docummentations", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: Color.fromARGB(255, 234, 132, 0),),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 1),
                            child: Icon(
                        Icons.arrow_drop_down_rounded, size: 30,
                        color: Color.fromARGB(255, 240, 190, 65),
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
                            SizedBox(height: 7,),
                            Row(
                              children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 3),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.11,
                    width:  MediaQuery.of(context).size.height * 0.14,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(image: AssetImage('images/tariseblang_d.jpg'),
                        fit: BoxFit.fill,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1.0, 5.0),
                            blurRadius: 6.0
                          )
                        ]
                    ),
                  ),
              ),
              SizedBox(width: 12,),
              Container(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.11,
                    width:  MediaQuery.of(context).size.height * 0.14,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(image: AssetImage('images/tariseblang_dd.jpeg'),
                        fit: BoxFit.fill,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1.0, 5.0),
                            blurRadius: 6.0
                          )
                        ]
                    ),
                  ),
              ),
              SizedBox(width: 12,),
              Container(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.11,
                    width:  MediaQuery.of(context).size.height * 0.14,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(image: AssetImage('images/tariseblang_ddd.jpg'),
                        fit: BoxFit.fill,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1.0, 5.0),
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
                padding: EdgeInsets.only(left: 35, right: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(7),
                      height: MediaQuery.of(context).size.height * 0.07,
                          child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                        child: ClipRRect(borderRadius: BorderRadius.circular(50),
                        child: Image(image: AssetImage('images/whatsapp.png',),),
                        ),
                            ),
                            Container(child: Text('089312345678', 
                            style: TextStyle(
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
                          color: Color.fromARGB(255, 221, 221, 221),
                          width: 3.7)
                      ),
                      ),
                      SizedBox(height: 12,),
                      Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(7),
                      height: MediaQuery.of(context).size.height * 0.07,
                          child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                        child: ClipRRect(borderRadius: BorderRadius.circular(50),
                        child: Image(image: AssetImage('images/instagram.png'),),
                        ),
                            ),
                            Container(child: Text('@rental.ind',
                            style: TextStyle(
                              color: Color.fromARGB(255, 234, 132, 0),
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
                          color: Color.fromARGB(255, 221, 221, 221),
                          width: 3.7)
                      ),
                      ),
                      SizedBox(height: 12,),
                      Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(7),
                      height: MediaQuery.of(context).size.height * 0.07,
                          child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                        child: ClipRRect(borderRadius: BorderRadius.circular(50),
                        child: Image(image: AssetImage('images/facebook.jpg'),),
                        ),
                            ),
                            Container(child: Text('rentalindonesia', 
                            style: TextStyle(
                              color: Color.fromARGB(255, 234, 132, 0),
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
                         color: Color.fromARGB(255, 221, 221, 221),
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