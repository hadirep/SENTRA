import 'package:flutter/material.dart';
import 'package:common/style.dart';

Row moreAction({required String title, required Function() onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: textPrimaryColor,
        ),
      ),
      InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: const [
              Text(
                'more',
                style: TextStyle(
                  fontSize: 15,
                  color: textPrimaryColor,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: textPrimaryColor,
                size: 15,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
