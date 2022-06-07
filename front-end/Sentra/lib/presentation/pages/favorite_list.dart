import 'package:flutter/material.dart';
import 'package:sentra/data/models/dummy/art_list.dart';
import 'package:sentra/presentation/pages/product_management.dart';

class FavoriteList extends StatefulWidget {
  static const routeName = '/favorite-list-page';
  const FavoriteList({ Key? key }) : super(key: key);

  @override
  State<FavoriteList> createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> with RouteAware {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text('Favorite List', style: TextStyle(color: Color.fromARGB(255, 45, 74, 148),), ),
        centerTitle: true,
        leading: 
        Padding(
          padding: const EdgeInsets.all(12.0),
        child: IconButton(
        icon: Image.asset("images/logos.jpeg"),
        onPressed: () {
        Navigator.pushNamed(context, ProductManagement.routeName);
        }
        ),  
        ), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Stack(
            children: <Widget>[
              Container(
                color: Colors.grey,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
                height: 45,
                child: TextField(
                  textAlign: TextAlign.center,
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color.fromARGB(255, 240, 190, 65), width: 2.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'search here ...', hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(10),
                      child: const Icon(
                        Icons.search, color: Color.fromARGB(255, 45, 74, 148), size: 28,
                      ),
                    ),
                    enabledBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color.fromARGB(255, 240, 190, 65), width: 2.5),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(top:70),
                child: Container(
                  color: Colors.grey,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                  Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15,),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  child:  ListView.builder(
                    shrinkWrap: true,
                    itemCount: dataArtList.length,
                    itemBuilder: (context, index) {
                      final ArtList place = dataArtList[index];
                      return InkWell(
                        onTap: () {
                          /*Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                                return DetailSellerProduct(place: place);
                              },
                            ),
                          );*/
                        },
                        child: Card(
                            color: const Color.fromARGB(255, 252, 241, 215),
                            shape: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color.fromARGB(255, 240, 190, 65), width: 2.0),
                              borderRadius: BorderRadius.circular(15),),
                            child:
                            Column(
                              children: [
                                const SizedBox(height: 15,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(width: 15,),
                                    Container(
                                      height: MediaQuery.of(context).size.height * 0.1,
                                      width:  MediaQuery.of(context).size.width * 0.3,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          image: AssetImage(place.image),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      padding: const EdgeInsets.only(right: 1.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Text(
                                            place.name,
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                              color: Color.fromARGB(255, 209, 139, 25),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            place.provience,
                                            style: const TextStyle(
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(255, 191, 183, 28),
                                            ),
                                          ),
                                          /*Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                              child: StarButton(),
                                            ),
                                          ),*/
                                          const SizedBox(height: 15),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                        ),
                      );
                    },
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
    ),
    );
  }
}

class SearchFavoritePage extends StatelessWidget {
  const SearchFavoritePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text('Favorite List', style: TextStyle(color: Color.fromARGB(44, 0, 0, 0),), ),
        centerTitle: true,
        leading: 
        Padding(padding: const EdgeInsets.all(12.0),
        child: Image.asset("images/logos.jpeg"),
        ), 
      ),
      body: Padding(padding: const EdgeInsets.all(20.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        TextField(
          decoration: InputDecoration(
            hintText: 'search here ...',
            border: OutlineInputBorder()
          ),
        )
      ],),
      ),
    );
  }
}

class SearchInput extends StatefulWidget {
  const SearchInput({Key? key}) : super(key: key);
  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: TextField(
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none
                      ),
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18
                      ),
                      prefixIcon: Container(
                        padding: const EdgeInsets.all(15),
                        width: 18,
                        child: Image.asset('assets/icons/search.png'),
                      )
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only (left: 10),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  width: 25,
                  child: Image.asset(
                      'assets/icons/filter.png')
              ),
            ],
          )
        ],
      ),
    );
  }
}