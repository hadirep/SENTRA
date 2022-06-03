import 'package:flutter/material.dart';
import 'package:sentra/models/art_provience.dart';

listItem(index){
  final ArtProvince data = dataArtProvience[index];
  InkWell(
    onTap: () {
      // Menuju detail page filter
    },
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Card(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                data.image, width: 150, height: 200, fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                data.name,
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
