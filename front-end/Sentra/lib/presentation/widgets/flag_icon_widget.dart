import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentra/l10n/common_l10n.dart';
import 'package:sentra/presentation/provider/preference_provider.dart';
import 'package:sentra/utils/localization.dart';

class FlagIconWidget extends StatelessWidget {
  const FlagIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        icon: const Icon(Icons.flag, color: Colors.blue),
        items: AppLocalizations.supportedLocales.map((Locale locale) {
          final flag = Localization.getFlag(locale.languageCode);
          return DropdownMenuItem(
            value: locale,
            child: Center(
              child: Text(
                flag,
              ),
            ),
            onTap: () {
              final provider =
                  Provider.of<PreferenceProvider>(context, listen: false);
              provider.setLocale(locale);
            },
          );
        }).toList(),
        onChanged: (_) {},
      ),
    );
  }
}
