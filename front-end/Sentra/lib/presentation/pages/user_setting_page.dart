import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sentra/l10n/common_l10n.dart';
import 'package:common/style.dart';
import 'package:sentra/presentation/pages/details_seller_product.dart';
import 'package:sentra/presentation/provider/preference_provider.dart';
import 'package:sentra/presentation/widgets/button/button_back.dart';
import 'package:sentra/presentation/widgets/flag_icon_widget.dart';
import 'package:sentra/presentation/widgets/platform_widget.dart';
import 'package:sentra/utils/notification_helper.dart';
import '../provider/schedulling_provider.dart';

class UserSetting extends StatefulWidget {
  static const routeName = '/user_setting';

  const UserSetting({Key? key}) : super(key: key);

  @override
  State<UserSetting> createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
  final NotificationHelper _notificationHelper = NotificationHelper();

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)!.settings,
          style: const TextStyle(
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
        middle: Text('Settings'),
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
                leading: const Icon(
                  Icons.dark_mode,
                  color: Color(0xffF0BE41),
                ),
                title: Text(
                  AppLocalizations.of(context)!.darkMode,
                  style: const TextStyle(
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
            Material(
              child: ListTile(
                leading: const Icon(
                  Icons.circle_notifications,
                  color: Color(0xffdc7e00),
                ),
                title: Text(
                  AppLocalizations.of(context)!.notification,
                  style: const TextStyle(
                    fontSize: 20,
                    color: buttonPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Consumer<SchedulingProvider>(
                  builder: (context, scheduled, _) {
                    return Switch.adaptive(
                        value: provider.isDailyRestaurantActive,
                        onChanged: (value) async {
                          scheduled.scheduledNews(value);
                          provider.enableDailyRestaurant(value);
                        });
                  },
                ),
              ),
            ),
            Material(
              child: ListTile(
                leading: const Icon(
                  Icons.flag,
                  color: Color(0xfff0be41),
                ),
                title: Text(
                  AppLocalizations.of(context)!.language,
                  style: const TextStyle(
                    fontSize: 20,
                    color: buttonPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: const FlagIconWidget(),
              ),
            ),
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

  @override
  void initState() {
    super.initState();
    _notificationHelper
        .configureSelectNotificationSubject(DetailSellerProduct.routeName);
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    super.dispose();
  }
}
