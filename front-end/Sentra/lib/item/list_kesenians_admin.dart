import 'package:flutter/material.dart';
import 'package:sentra/common/style.dart';
import 'package:sentra/models/art_list.dart';

class ItemKeseniansAdmin extends StatelessWidget{
  const ItemKeseniansAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          final ArtList artList = dataArtList[index];
          return InkWell(
            onTap: () {},
            child: Column(
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    height: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all( width: 2, color: secondaryColor),
                      borderRadius: BorderRadius.circular(8),
                      color: bgSecondColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 20,
                              child: const VerticalDivider(
                                color: secondaryColor,
                                thickness: 3,
                                width: 10,
                                indent: 0,
                                endIndent: 0,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              width: 80,
                              margin: const EdgeInsets.only(right: 16.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  artList.image, width: 80,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    artList.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal[800],
                                    ),
                                  ),
                                  Padding(padding: const EdgeInsets.only(top: 4),
                                    child: Text(
                                      artList.provience,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
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
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  margin: EdgeInsets.only(right: 4.0),
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: buttonPrimaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(8))
                        ),
                        child: IconButton(
                          iconSize: 16,
                          icon: const Icon(Icons.edit, color: Colors.white),
                          tooltip: 'Edit data',
                          onPressed: () {
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: buttonPrimaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(8))
                        ),
                        child: IconButton(
                          iconSize: 16,
                          icon: const Icon(Icons.delete, color: Colors.white),
                          tooltip: 'Delete data',
                          onPressed: () {
                          },
                        ),
                      ),
                    ],
                  )
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        },
      itemCount: dataArtList.length,
    );
  }

}