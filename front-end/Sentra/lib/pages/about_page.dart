import 'package:flutter/material.dart';
import 'package:sentra/common/style.dart';
import 'package:sentra/pages/login_page.dart';
import 'package:sentra/widget/button/button_back.dart';

class AboutPage extends StatelessWidget {
  static const routeName = '/about_page';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  ButtonBack(),
                  Padding(
                    padding: EdgeInsets.only(top: 33),
                    child: Text(
                      'About Us',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 45, 74, 148)
                      ),
                    ),
                  ),
                  SizedBox(width: 70,)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100, bottom: 50),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset("assets/logo/sentra.png",
                      width: 215,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Center(
                        child: Column(
                          children:  [
                            const Text(
                              'Hello, Sentra`s!',
                              style: TextStyle(
                                fontSize: 31,
                                fontWeight: FontWeight.bold,
                                color: secondaryColor
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10, left: 57, right: 57),
                              child: Text(
                                'we’re a mobile-based traditional art service provider to make it easier for you to hire traditional Indonesian performing arts services.',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: backgroundColor
                                ),
                              ),
                            ),
                            const Padding(
                                padding: EdgeInsets.only(top: 50, left: 50, right: 50),
                              child: Center(
                                child: Text(
                                  'We’d love to hear about more traditional art',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: secondaryColor
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10, left: 50, right: 50, bottom: 30),
                              child: Text(
                                'Are you willing to help people find traditional performing arts easily?',
                                style: TextStyle(
                                    fontSize: 11,
                                    color: backgroundColor
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
                                  borderRadius: BorderRadius.circular(13)
                                )
                              ),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 20
                                  ),
                                ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                              child: Text(
                                  'Contact Us At',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: secondaryColor,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 50),
                              child: Card(
                                child: ListTile(
                                  leading: Icon(Icons.alternate_email, color: secondaryColor),
                                  title: Text(
                                    'alamat email',
                                    style: TextStyle(
                                      color: buttonPrimaryColor,
                                      fontSize: 18
                                    )),
                                  trailing: Icon(Icons.navigate_next, color: secondaryColor),
                                  onTap: (){},
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 50),
                              child: Card(
                                child: ListTile(
                                  leading: Icon(Icons.whatsapp, color: secondaryColor),
                                  title: Text(
                                      'nomer wa',
                                      style: TextStyle(
                                          color: buttonPrimaryColor,
                                          fontSize: 18
                                      )),
                                  trailing: Icon(Icons.navigate_next, color: secondaryColor),
                                  onTap: (){},
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

  }

}