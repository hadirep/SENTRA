import 'package:flutter/material.dart';
import 'dart:ui';


// ignore: must_be_immutable
class BlurryDialog extends StatelessWidget {

  String title;
  String content;
  VoidCallback continueCallBack;

  BlurryDialog(this.title, this.content, this.continueCallBack, {Key? key}) : super(key: key);
  TextStyle textStyle = const TextStyle (color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child:  AlertDialog(
          title: Text(title,style: textStyle,),
          content:  Text(content, style: textStyle,),
          actions: <Widget>[
            ElevatedButton(
              child:  const Text("Continue"),
              onPressed: () {
                continueCallBack();
              },
            ),
            ElevatedButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }
}
