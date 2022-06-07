import 'package:flutter/material.dart';

class LogoCenter extends StatelessWidget {
  const LogoCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/logo/sentra_drawer.png",
                height: 60,
                width: 80,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
