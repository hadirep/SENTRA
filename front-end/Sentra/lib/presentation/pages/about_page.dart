import 'package:flutter/material.dart';
import 'package:sentra/common/common.dart';
import 'package:sentra/common/style.dart';
import 'package:sentra/presentation/pages/home_page.dart';
import 'package:sentra/presentation/pages/login_page.dart';
import 'package:sentra/presentation/widgets/button/button_back.dart';

class AboutPage extends StatelessWidget {
  static const routeName = '/about_page';

  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.aboutUS,
          style: const TextStyle(
            color: Color.fromARGB(255, 45, 74, 148),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded, color: secondaryColor,),
            onPressed: () {
              Navigator.pushNamed(context, HomePage.routeName);
            },
          ),
        ),
      ),
      body: Container(
        child:SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 50),
                  child: Column(
                    children: [
                      Center(
                        child: Image.asset("assets/logo/sentra.png", width: 215),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Center(
                          child: Column(
                            children:  [
                              Padding(
                                padding: const EdgeInsets.only(top: 10, left: 57, right: 57),
                                child: Text(
                                  AppLocalizations.of(context)!.aboutText1,
                                  style: const TextStyle(
                                    fontSize: 31,
                                    fontWeight: FontWeight.bold,
                                    color: secondaryColor,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10, left: 57, right: 57),
                                child: Text(
                                  AppLocalizations.of(context)!.aboutText2,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: textPrimaryColor,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
                                child: Center(
                                  child: Text(
                                    AppLocalizations.of(context)!.aboutText3,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: secondaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10, left: 50, right: 50, bottom: 30),
                                child: Text(
                                  AppLocalizations.of(context)!.aboutText4,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    color: textPrimaryColor,
                                  ),
                                ),
                              ),
                              OutlinedButton(
                                onPressed: () {Navigator.pushNamed(context, LoginPage.routeName);},
                                style: OutlinedButton.styleFrom(
                                  elevation: 6,
                                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                                  backgroundColor: buttonPrimaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                ),
                                child: Text(
                                  AppLocalizations.of(context)!.login,
                                  style: const TextStyle(
                                    color: primaryColor,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                                child: Text(
                                  AppLocalizations.of(context)!.contactUs,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    color: secondaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 50),
                                child: Card(
                                  child: ListTile(
                                    leading: const Icon(Icons.alternate_email, color: secondaryColor),
                                    title: Text(
                                      AppLocalizations.of(context)!.artEmail,
                                      style: const TextStyle(
                                          color: buttonPrimaryColor,
                                          fontSize: 18
                                      ),
                                    ),
                                    trailing: const Icon(Icons.navigate_next, color: secondaryColor),
                                    onTap: (){},
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 50),
                                child: Card(
                                  child: ListTile(
                                    leading: const Icon(Icons.whatsapp, color: secondaryColor),
                                    title: Text(
                                      AppLocalizations.of(context)!.artPhone,
                                      style: const TextStyle(
                                        color: buttonPrimaryColor, fontSize: 18,
                                      ),
                                    ),
                                    trailing: const Icon(Icons.navigate_next, color: secondaryColor),
                                    onTap: (){},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}