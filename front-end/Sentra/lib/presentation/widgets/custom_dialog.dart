import 'dart:io';

import 'package:common/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


customDialog(BuildContext context) {
  if (Platform.isIOS) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            'Coming Soon!',
            style: Theme.of(context).textTheme.caption,
          ),
          content: Text(
            'This feature will be coming soon!',
            style: Theme.of(context).textTheme.caption,
          ),
          actions: [
            CupertinoDialogAction(
              child: const Text('Ok'),
              onPressed: () {
                Navigation.back();
              },
            ),
          ],
        );
      },
    );
  } else {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Coming Soon!',
            style: Theme.of(context).textTheme.caption,
          ),
          content: Text(
            'This feature will be coming soon!',
            style: Theme.of(context).textTheme.caption,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigation.back();
              },
              child: Text(
                'Ok',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          ],
        );
      },
    );
  }
}