import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sentra/common/style.dart';
import 'package:sentra/item/list_kesenians_admin.dart';
import 'package:sentra/pages/login_page.dart';
import 'package:sentra/widget/button/button_back.dart';

class BusinessManagement extends StatelessWidget {
  static const routeName  = '/business-management';
  const BusinessManagement({Key? key}) : super(key: key);

  Widget customBannerImage(context) {
    final _auth = FirebaseAuth.instance;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child: Image.asset("assets/logo/sentra.png", width: 40, height: 40,),
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
                    tooltip: 'Add data',
                    onPressed: () async {
                      await _auth.signOut();
                      Navigator.pushReplacementNamed(
                          context, LoginPage.routeName);
                      // Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              alignment: Alignment.bottomCenter,
              child: const Center(
                child: Text(
                  'List Kesenian Nusanatara',
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