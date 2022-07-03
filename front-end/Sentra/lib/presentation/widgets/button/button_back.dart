import 'package:flutter/material.dart';
import 'package:common/style.dart';

class ButtonBack extends StatefulWidget {
  const ButtonBack({Key? key}) : super(key: key);

  @override
  State<ButtonBack> createState() => _StateButtonBack();
}

class _StateButtonBack extends State<ButtonBack> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 12),
      child: SizedBox(
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: secondaryColor,
          ),
          tooltip: 'Increase volume by 10',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
