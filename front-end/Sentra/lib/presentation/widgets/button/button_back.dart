import 'package:flutter/material.dart';
import 'package:sentra/common/style.dart';

class ButtonBack extends StatefulWidget{

  const ButtonBack({Key? key}) : super(key: key);

  @override
  State<ButtonBack> createState() => _StateButtonBack();
}

class _StateButtonBack extends State<ButtonBack>{
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 12),
      child: SizedBox(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:  MaterialStateProperty.all(secondaryColor),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_rounded, color: Color(0xfff0be41),
          ),
        ),
      ),
    );
  }

}