import 'package:flutter/material.dart';
import 'package:sentra/common/style.dart';
import 'package:sentra/presentation/pages/home_page.dart';
import 'package:sentra/presentation/pages/product_management.dart';
import 'package:sentra/presentation/widgets/button/button_back.dart';

class UserSetting extends StatelessWidget {
  static const routeName = '/user_setting';

  const UserSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Color.fromARGB(255, 45, 74, 148),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        leading: const Align(
          alignment: Alignment.centerLeft,
          child: ButtonBack(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset("assets/dummy_data/profile_pict.png"),
                ],
              ),
              const Text(
                'Nama User',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromARGB(255, 45, 74, 148),
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                ),
              ),
              TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, ProductManagement.routeName);
                },
                child: const Text(
                  'edit profile',
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 13,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'My Account',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: buttonPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    Card(
                      child: ListTile(
                        leading: const Icon(Icons.add_box, color: Color(0xffdc7e00)),
                        title: const Text(
                          'Management',
                          style: TextStyle(
                            color: buttonPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: const Icon(
                            Icons.navigate_next, color: Color(0xffdc7e00),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, ProductManagement.routeName);
                        },
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: const Icon(
                          Icons.login_outlined, color: Color(0xffF0BE41),
                        ),
                        title: const Text(
                          'Logout',
                          style: TextStyle(
                            color: buttonPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.navigate_next, color: Color(0xffdc7e00),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, HomePage.routeName);
                        }, //SEMENTARA MASIH KE HOME
                      ),
                    ),
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