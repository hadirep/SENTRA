import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sentra/common/style.dart';
import 'package:sentra/presentation/provider/preference_provider.dart';
import 'package:sentra/presentation/widgets/button/button_back.dart';
import 'package:sentra/presentation/widgets/platform_widget.dart';

// class UserSetting extends StatelessWidget {
//   static const routeName = '/user_setting';
//
//   const UserSetting({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         title: const Text(
//           'Pengaturan',
//           style: TextStyle(
//             color: Color.fromARGB(255, 45, 74, 148),
//             fontWeight: FontWeight.bold,
//             fontSize: 24,
//           ),
//         ),
//         centerTitle: true,
//         leading: const Align(
//           alignment: Alignment.centerLeft,
//           child: ButtonBack(),
//         ),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
//                 child: Column(
//                   children: [
//                     Card(
//                       child: ListTile(
//                         leading: const Icon(Icons.circle_notifications, color: Color(0xffdc7e00)),
//                         title: const Text(
//                           'Notifikasi',
//                           style: TextStyle(
//                             color: buttonPrimaryColor,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         trailing: const Icon(
//                             Icons.radio_button_off, color: Color(0xffdc7e00),
//                         ),
//                         onTap: () {
//                           Navigator.pushNamed(context, EditArt.routeName);
//                         },
//                       ),
//                     ),
//                     Card(
//                       child: ListTile(
//                         leading: const Icon(
//                           Icons.dark_mode, color: Color(0xffF0BE41),
//                         ),
//                         title: const Text(
//                           'Mode Gelap',
//                           style: TextStyle(
//                             color: buttonPrimaryColor,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         trailing: const Icon(
//                           Icons.radio_button_off, color: Color(0xffdc7e00),
//                         ),
//                         onTap: () {
//                           Navigator.pushNamed(context, HomePage.routeName);
//                         }, //SEMENTARA MASIH KE HOME
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
class UserSetting extends StatelessWidget {
  static const routeName = '/user_setting';

  const UserSetting({Key? key}) : super(key: key);

  Widget _buildAndroid(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Pengaturan',
          style: TextStyle(
            color: Color.fromARGB(255, 45, 74, 148),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: const Align(
          alignment: Alignment.centerLeft,
          child: ButtonBack(),
        ),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Settings'
        ),
      ),
      child: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    return Consumer<PreferenceProvider>(
      builder: (context, provider, child) {
        return ListView(
          children: [
            Material(
              child: ListTile(
                title: const Text(
                  'Mode Gelap',
                  style: TextStyle(
                    fontSize: 20,
                    color: buttonPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Switch.adaptive(
                    value: provider.isDarkTheme,
                    onChanged: (value) {
                      provider.enableDarkTheme(value);
                    }),
              ),
            ),
            // Material(
            //   child: ListTile(
            //     title: const Text('Scheduling Restaurant Recommendation'),
            //     trailing: Consumer<SchedulingProvider>(
            //       builder: (context, scheduled, _) {
            //         return Switch.adaptive(
            //           value: provider.isDailyRestaurantActive,
            //           onChanged: (value) async {
            //             if (Platform.isIOS) {
            //               customDialog(context);
            //             } else {
            //               scheduled.scheduledRestaurants(value);
            //               provider.enableDailyRestaurant(value);
            //             }
            //           },
            //         );
            //       },
            //     ),
            //   ),
            // )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}