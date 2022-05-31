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
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(left: 16.0, top: 32.0),
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