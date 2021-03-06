import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sentra/l10n/common_l10n.dart';
import 'package:common/style.dart';
import 'package:sentra/presentation/item/list_kesenians_admin.dart';
import 'package:sentra/presentation/pages/admin/create_art.dart';
import 'package:sentra/presentation/pages/login_page.dart';

class BusinessManagement extends StatefulWidget {
  static const routeName = '/business-management';
  const BusinessManagement({Key? key}) : super(key: key);

  @override
  State<BusinessManagement> createState() => _BusinessManagementState();
}

class _BusinessManagementState extends State<BusinessManagement> {
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
                  onTap: () {},
                  child: Container(
                    width: 35,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: IconButton(
                      iconSize: 15,
                      icon: const Icon(Icons.logout, color: Color(0xfff0be41)),
                      tooltip: AppLocalizations.of(context)!.outData,
                      onPressed: () async {
                        await auth.signOut();
                        Navigator.pushReplacementNamed(
                          context,
                          LoginPage.routeName,
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  width: 35,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: IconButton(
                    iconSize: 15,
                    icon: const Icon(Icons.add, color: Color(0xfff0be41)),
                    tooltip: AppLocalizations.of(context)!.addData,
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, CreateArt.routeName);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 7),
            Text(
              AppLocalizations.of(context)!.titleBusiness,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: secondaryColor,
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
              margin: const EdgeInsets.only(left: 16.0, right: 16.0),
              height: 600,
              child: const ItemKeseniansAdmin(),
            ),
          ),
        ],
      ),
    );
  }
}
