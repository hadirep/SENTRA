import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class PlatformWidget extends StatelessWidget {
  final WidgetBuilder androidBuilder;
  final WidgetBuilder iosBuilder;

  // ignore: use_key_in_widget_constructors
  const PlatformWidget({required this.androidBuilder, required this.iosBuilder});

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return androidBuilder(context);
      case TargetPlatform.iOS:
        return iosBuilder(context);
      default:
        return androidBuilder(context);
    }
  }
}