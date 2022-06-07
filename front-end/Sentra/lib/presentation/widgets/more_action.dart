import 'package:flutter/material.dart';
import 'package:sentra/common/style.dart';

Row moreAction({required String title, required Function() onTap}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: textPrimaryColor,
        ),
      ),
      InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: const [
              Text(
                'More',
                style: TextStyle(
                  fontSize: 15, color: textPrimaryColor,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios, size: 15,
              )
            ],
          ),
        ),
      ),
    ],
  );
}