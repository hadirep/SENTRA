import 'package:flutter/material.dart';
import 'package:sentra/common/style.dart';
import 'package:sentra/models/art_provience.dart';

class ProvienceMorePage extends StatefulWidget {
  static const routeName = '/provience_page';
  const ProvienceMorePage({Key? key}) : super(key: key);

  @override
  State<ProvienceMorePage> createState() => _ProvienceMorePageState();
}

class _ProvienceMorePageState extends State<ProvienceMorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'Filter By Provience',
            style: TextStyle(color: textPrimaryColor, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
        leading : IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.3),
            ),
            itemCount: dataArtProvience.length,
            itemBuilder: (context, index) {
              return _gridProvienceItem(index);
            },
          ),
        ),
      ),
    );
  }

  _gridProvienceItem(index){
    ArtProvince artProvience = dataArtProvience[index];
    return InkWell(
      onTap: () {
        // Menuju detail page new update
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Card(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  artProvience.image, height: 200, fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  artProvience.province, textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xff2d4b94),
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
