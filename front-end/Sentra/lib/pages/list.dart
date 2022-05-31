import 'package:flutter/material.dart';
import 'package:sentra/models/art_list.dart';
import 'package:sentra/pages/details_seller_product.dart';

//HOMEPAGE
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Container (child: Text('List', style: TextStyle(color: Color.fromARGB(255, 45, 74, 148),), ), 
        ),
        centerTitle: true,
        leading: 
        Padding(
            padding: const EdgeInsets.all(12.0),
            child: IconButton(
              icon: Icon(
                Icons.star_rounded,
                color: Color.fromARGB(255, 184, 120, 17),
              ),
              onPressed: () {
                // Navigator.pushNamed(context, FavoritePage.routeName);
              },
            ),
          ),
      ),
      body: Card(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                color: Color.fromARGB(255, 222, 222, 222),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        //List View Products
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final ArtList place = dataArtList[index];
                            return InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DetailSellerProduct(place: place);
                                }));
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      // flex: 1,
                                      child: FittedBox(
                                        child: Image.asset(
                                          place.image,
                                          width: 100,
                                          height: 80,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      
                                    ),
                                    Expanded(
                                      // flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 1.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          // mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              place.name,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Color.fromARGB(
                                                      255, 145, 35, 35),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              place.provience,
                                              style: TextStyle(
                                                  fontSize: 17.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.brown.shade200),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 17, right: 10),
                                          child: StarButton(),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: dataArtList.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
