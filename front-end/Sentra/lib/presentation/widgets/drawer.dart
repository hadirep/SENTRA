import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class drawerMenu extends StatelessWidget{
  const drawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(234, 213, 160, 1),
      child: Column(
        children: [
          DrawerHeader(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/logo/sentra_drawer.png", width: 10, height: 10,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_rounded, color: Color(0xffdc7e00)),
            title: const Text(
              "Home",
              style: TextStyle(
                color: Color(0xff2d4b94),
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context, HomePage.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.stars, color: Color(0xffF0BE41)),
            title: const Text(
              'Favorite List',
              style: TextStyle(
                color: Color(0xff2d4b94),
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, FavoriteList.routeName);
            },
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, AboutPage.routeName);
            },
            leading: const Icon(Icons.info, color: Color(0xff2d4b94)),
            title: const Text(
              'About Us',
              style: TextStyle(
                color: Color(0xff2d4b94),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, UserSetting.routeName);
            },
            leading: const Icon(Icons.settings, color: Color(0xff969696)),
            title: const Text(
              'Settings',
              style: TextStyle(
                color: Color(0xff2d4b94),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    )
  }

}