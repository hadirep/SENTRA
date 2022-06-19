import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sentra/common/style.dart';
import 'package:sentra/presentation/item/list_kesenians_admin.dart';
import 'package:sentra/presentation/pages/admin/create_art.dart';
import 'package:sentra/presentation/pages/login_page.dart';

class BusinessManagement extends StatelessWidget {
  static const routeName  = '/business-management';
  const BusinessManagement({Key? key}) : super(key: key);

  Widget customBannerImage(context) {
    final auth = FirebaseAuth.instance;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    child: IconButton(
                      iconSize: 20,
                      icon: const Icon(Icons.logout, color: Color(0xfff0be41)),
                      tooltip: 'Keluar',
                      onPressed: () async {
                        await auth.signOut();
                        Navigator.pushReplacementNamed(
                            context, LoginPage.routeName);
                        // Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  child: IconButton(
                    iconSize: 20,
                    icon: const Icon(Icons.add, color: Color(0xfff0be41)),
                    tooltip: 'Tambah data',
                    onPressed: () {
                      Navigator.pushNamed(
                          context, CreateArt.routeName);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              alignment: Alignment.bottomCenter,
              child: const Center(
                child: Text(
                  'List Kesenian Nusantara',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: secondaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: bgSecondColor,
              height: 160,
              alignment: Alignment.topCenter,
              child: customBannerImage(context),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              margin: const EdgeInsets.only(left: 16.0,right: 16.0),
              height: 600,
              child: const ItemKeseniansAdmin(),
            ),
          ),
        ],
      ),
    );
  }

}