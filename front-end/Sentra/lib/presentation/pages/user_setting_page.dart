import 'package:flutter/material.dart';
import 'package:sentra/common/style.dart';
import 'package:sentra/presentation/pages/home_page.dart';
import 'package:sentra/presentation/pages/product_management.dart';

class UserSetting extends StatelessWidget {
  static const routeName = '/user_setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Container (child: Text('Settings', style: TextStyle(color: Color.fromARGB(255, 45, 74, 148),fontWeight: FontWeight.bold, fontSize: 24), ),
        ),
        centerTitle: true,
        leading:
        Padding(padding: const EdgeInsets.all(12.0),
          child: Container(child: Image.asset("images/logos.jpeg")
          ),
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
                  onPressed: (){Navigator.pushNamed(context, ProductManagement.routeName);},
                  child: const Text(
                    'edit profile',
                    style: TextStyle(
                      color: secondaryColor,
                      fontSize: 13,
                    ),
                  )
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
                              color: buttonPrimaryColor
                          ),
                        ),
                      ],
                    ),
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.add_box, color: Color(0xffdc7e00)),
                        title: Text(
                          'Management',
                          style: TextStyle(
                              color: buttonPrimaryColor,
                              fontWeight: FontWeight.bold
                          ),),
                        trailing: Icon(Icons.navigate_next, color: Color(0xffdc7e00)),
                        onTap: () {Navigator.pushNamed(context, ProductManagement.routeName);},
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.login_outlined, color: Color(0xffF0BE41)),
                        title: Text(
                          'Logout',
                          style: TextStyle(
                              color: buttonPrimaryColor,
                              fontWeight: FontWeight.bold
                          ),),
                        trailing: Icon(Icons.navigate_next, color: Color(0xffdc7e00)),
                        onTap: () {Navigator.pushNamed(context, HomePage.routeName);}, //SEMENTARA MASIH KE HOME
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