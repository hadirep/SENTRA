import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentra/common/common.dart';
import 'package:sentra/common/constants.dart';
import 'package:sentra/common/result_state.dart';
import 'package:sentra/data/api/api_service.dart';
import 'package:sentra/data/models/art_and_province_model.dart';
import 'package:sentra/presentation/provider/database_provider.dart';
import 'package:sentra/presentation/provider/detail_provider.dart';
import 'package:readmore/readmore.dart';
import 'package:sentra/presentation/widgets/button/button_back.dart';

class DetailSellerProduct extends StatefulWidget {
  final ArtList artList;
  static const routeName = '/detail-seller-product';

  const DetailSellerProduct({Key? key, required this.artList}) : super(key: key);

  @override
  State<DetailSellerProduct> createState() => _DetailSellerProductState();
}

class _DetailSellerProductState extends State<DetailSellerProduct> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DetailProvider>(
          create: (_) => DetailProvider(detailApiService: ApiService(), id: widget.artList.id),
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
                title: Text(
                  AppLocalizations.of(context)!.artDetail,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 45, 74, 148),
                      fontWeight: FontWeight.bold
                  ),
                ),
                centerTitle: true,
                leading: const Align(
                  alignment: Alignment.centerLeft,
                  child: ButtonBack(),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
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
                        Container(
                          width:  MediaQuery.of(context).size.height * 0.45,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width:  MediaQuery.of(context).size.height * 0.45,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Consumer<DatabaseProvider>(
                                      builder: (context, provider, child) {
                                        return FutureBuilder<bool>(
                                          future: provider.isFavorited(widget.artList.id),
                                          builder: (context, snapshot) {
                                            var isFavorited = snapshot.data ?? false;
                                            return isFavorited
                                                ? IconButton(
                                                icon: const Icon(Icons.favorite, color: Colors.red),
                                                onPressed: () => provider
                                                    .removeFavorite(widget.artList.id)
                                            ) : IconButton(
                                              icon: const Icon(Icons.favorite_border, color: Colors.red),
                                              onPressed: () => provider
                                                  .addFavorite(widget.artList),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 10, right: 10),
                                ),
                                const SizedBox(height: 100),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.only(left: 20 ),
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
                                      padding: const EdgeInsets.only(left: 20 ),
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
                                      padding: const EdgeInsets.only(left: 20 ),
                                      child: Text(
                                        state.detail.data.price,
                                        style: const TextStyle(
                                          color: Colors.white, fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                    // Consumer<DatabaseProvider>(
                    //   builder: (context, provider, child) {
                    //     return FutureBuilder<bool>(
                    //       future: provider.isFavorited(widget.artList.id),
                    //       builder: (context, snapshot) {
                    //         var isFavorited = snapshot.data ?? false;
                    //         return isFavorited
                    //             ? IconButton(
                    //             icon: const Icon(Icons.favorite, color: Colors.red),
                    //             onPressed: () => provider
                    //                 .removeFavorite(widget.artList.id)
                    //         ) : IconButton(
                    //           icon: const Icon(Icons.favorite_border, color: Colors.red),
                    //           onPressed: () => provider
                    //               .addFavorite(widget.artList),
                    //         );
                    //       },
                    //     );
                    //   },
                    // ),
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
                        tabs: [
                          Tab(
                            child: Text(
                              AppLocalizations.of(context)!.artDescription,
                              style: const TextStyle(
                                color:  Color.fromARGB(255, 221, 221, 221),
                                fontWeight: FontWeight.bold, fontSize: 17,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              AppLocalizations.of(context)!.contact,
                              style: const TextStyle(
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
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400 , fontSize: 13,
                                        ),
                                        trimLength: 500,
                                        colorClickableText: const Color.fromARGB(255, 45, 74, 148),
                                        trimCollapsedText: '\n${AppLocalizations.of(context)!.seeAll}',
                                        trimExpandedText: AppLocalizations.of(context)!.close,
                                      ),
                                    ),
                                  ),
                                  // ),
                                  const SizedBox(height: 10),
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left:5.0),
                                          child: Text(
                                            AppLocalizations.of(context)!.artDocumentation,
                                            style: const TextStyle(
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
                                              height: MediaQuery.of(context).size.height * 0.12,
                                              width: MediaQuery.of(context).size.width,
                                              child:
                                              SingleChildScrollView(
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
                                                                  child: Hero(tag: state.detail.data.documKesenians, child: CachedNetworkImage(imageUrl: '$baseImageDocArt${category.documentation}',)),
                                                                )), context: context);
                                                      },
                                                      child: Container(
                                                        width: 140,
                                                        decoration: BoxDecoration( boxShadow: const [
                                                          BoxShadow(
                                                              color: Color.fromARGB(185, 158, 158, 158),
                                                              offset: Offset(2.0, 2.0),
                                                              blurRadius: 2.0
                                                          )
                                                        ],
                                                            border: Border.all(width: 3, color: Colors.white), borderRadius: BorderRadius.circular(12) ),
                                                        child: ClipRRect(
                                                          borderRadius: BorderRadius.circular(10),
                                                          child:
                                                          FittedBox(
                                                            fit:
                                                            BoxFit.fill,
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
                                const SizedBox(height: 12),
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
                                const SizedBox(height: 12),
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
        } else if (state.detailState == ResultState.error) {
          return Center(child: Text(state.message));
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