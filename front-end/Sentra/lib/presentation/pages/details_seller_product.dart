import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentra/common/constants.dart';
import 'package:sentra/common/result_state.dart';
import 'package:sentra/data/api/api_service.dart';
import 'package:sentra/data/db/database_helper.dart';
import 'package:sentra/presentation/provider/database_provider.dart';
import 'package:sentra/presentation/provider/detail_provider.dart';
import 'package:readmore/readmore.dart';
import 'package:sentra/presentation/widgets/button/button_back.dart';
import '../../data/models/art_list_model.dart';

class DetailSellerProduct extends StatelessWidget {
  static const routeName = '/detail-seller-product';
  final ArtList artList;
  const DetailSellerProduct({Key? key, required this.artList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DetailProvider>(
          create: (_) => DetailProvider(detailApiService: ApiService(), id: artList.id),
        ),
        ChangeNotifierProvider<DatabaseProvider>(
          create: (_) => DatabaseProvider(databaseHelper: DatabaseHelper()),
        ),
      ],
      child: Scaffold(
        body: _builder(context),
      ),
    );
  }

  Widget _builder(context) {
    return Consumer<DetailProvider>(
      builder: (context, state, _) {
        if (state.detailState == ResultState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.detailState == ResultState.hasData) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                toolbarHeight: 70,
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                title: const Text(
                  'Detail Seni',
                  style: TextStyle(
                    color: Color.fromARGB(255, 45, 74, 148),
                    fontWeight: FontWeight.bold, fontSize: 20,
                  ),
                ),
                centerTitle: true,
                leading: const ButtonBack(),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 6,),
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.33,
                          width:  MediaQuery.of(context).size.height * 0.45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(
                                '${ApiService.baseImageArt}${state.detail.data.image}',
                              ),
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
                              padding: EdgeInsets.only(top: 29, right: 10),
                            ),
                            const SizedBox(height: 140),
                            Container(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                state.detail.data.province,
                                style: const TextStyle(
                                  color: Colors.white, fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                state.detail.data.name,
                                style: const TextStyle(
                                  color: Colors.white, fontSize: 27,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                state.detail.data.price,
                                style: const TextStyle(
                                  color: Colors.white, fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Consumer<DatabaseProvider>(
                                builder: (context, provider, child) {
                                  return FutureBuilder<bool>(
                                    future: provider.isFavorited(artList.id),
                                    builder: (context, snapshot) {
                                      var isFavorited = snapshot.data ?? false;
                                      return CircleAvatar(
                                        backgroundColor: Colors.black12,
                                        child: isFavorited
                                            ? IconButton(
                                          icon: const Icon(Icons.favorite),
                                          color: Colors.red[400],
                                          onPressed: () => provider
                                              .removeFavorite(artList.id),
                                        ) : IconButton(
                                          icon: const Icon(Icons.favorite_border),
                                          color: Colors.red[400],
                                          onPressed: () => provider
                                              .addFavorite(artList),
                                        ),
                                      );
                                    },
                                  );
                                }
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height:10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: TabBar(
                        indicator: BoxDecoration(
                          color: const Color.fromARGB(255, 45, 74, 148),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        tabs: const [
                          Tab(
                            child: Text(
                              'Deskripsi',
                              style: TextStyle(
                                color:  Color.fromARGB(255, 221, 221, 221),
                                fontWeight: FontWeight.bold, fontSize: 17,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Kontak',
                              style: TextStyle(
                                color: Color.fromARGB(255, 221, 221, 221),
                                fontWeight: FontWeight.bold, fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.50,
                      child: TabBarView(
                        children: [
                          SingleChildScrollView(
                            child:
                            Container(
                              padding: const EdgeInsets.only(left: 15, right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0, right: 9),
                                      child: ReadMoreText(state.detail.data.description,
                                        style: const TextStyle(
                                          color:  Color.fromARGB(255, 190, 190, 190),
                                          fontWeight: FontWeight.w400 , fontSize: 13,
                                        ),
                                        trimLength: 500,
                                        colorClickableText: const Color.fromARGB(255, 45, 74, 148),
                                        trimCollapsedText: '\nlihat semua',
                                        trimExpandedText: 'tutup',
                                      ),
                                    ),
                                  ),
                                  // ),
                                  const SizedBox(height: 10),
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left:5.0),
                                          child: Text(
                                            "Dokumentasi",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600, fontSize: 15,
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
                                            Container(padding: const EdgeInsets.only(left: 3)),
                                            SizedBox(
                                              height: MediaQuery.of(context).size.height * 0.1,
                                              width:  MediaQuery.of(context).size.width,
                                              child:  SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: Row(
                                                  children: state.detail.data.documKesenians
                                                      .map((category) => Padding(
                                                    padding: const EdgeInsets.all(4.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        showDialog(
                                                            builder: (BuildContext context) => AlertDialog(
                                                              backgroundColor: const Color.fromARGB(0, 93, 93, 93),
                                                              insetPadding: const EdgeInsets.all(2),
                                                              title: SizedBox(
                                                                width: MediaQuery.of(context).size.width,
                                                                child: Hero(
                                                                  tag: state.detail.data.documKesenians,
                                                                  child: CachedNetworkImage(
                                                                    imageUrl: '$baseImageDocArt${category.documentation}',
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            context: context);
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              color: Color.fromARGB(185, 158, 158, 158),
                                                              offset: Offset(2.0, 2.0),
                                                              blurRadius: 2.0,
                                                            ),
                                                          ],
                                                          border: Border.all(width: 3, color: Colors.white),
                                                          borderRadius: BorderRadius.circular(12),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius: BorderRadius.circular(10),
                                                          child: FittedBox(
                                                            fit: BoxFit.fill,
                                                            child: CachedNetworkImage(
                                                              imageUrl: '$baseImageDocArt${category.documentation}',
                                                              width: 140,
                                                              placeholder: (context, url) => const Center(
                                                                child: CircularProgressIndicator(),
                                                              ),
                                                              errorWidget: (context, url, error) => const Icon(Icons.error),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )).toList(),
                                                ),
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
                            padding: const EdgeInsets.only(left: 35, right: 35),
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
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ClipRRect(borderRadius: BorderRadius.circular(50),
                                          child:  const Image(
                                            image: AssetImage('images/whatsapp.png'),
                                          ),
                                        ),
                                        // REVISI
                                        Text(state.detail.data.phoneNumber,
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
                                            image: AssetImage('images/instagram.png'),
                                          ),
                                        ),
                                        Text(state.detail.data.isInstagram,
                                          style: const TextStyle(
                                            color: Color.fromARGB(255, 234, 132, 0),
                                            fontWeight: FontWeight.w800, fontSize: 15,
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
                                      color: const Color.fromARGB(255, 221, 221, 221), width: 3.7),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(50),
                                          child: const Image(image: AssetImage('images/facebook.jpg'),
                                          ),
                                        ),
                                        Text(state.detail.data.isFacebook,
                                          style: const TextStyle(
                                            color: Color.fromARGB(255, 234, 132, 0),
                                            fontWeight: FontWeight.w800, fontSize: 14,
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
        } else if (state.detailState == ResultState.noData){
          return Center(child: Text(state.message));
        } else if (state.detailState == ResultState.error) {
          return const Center(child: Text('error'));
        } else {
          return const Center(child:  Text(''));
        }
      },
    );
  }
}
