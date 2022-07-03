import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:sentra/utils/background_service.dart';
import 'package:sentra/utils/date_time_helper.dart';

class SchedulingProvider extends ChangeNotifier {
  bool _isScheduled = false;

  bool get isScheduled => _isScheduled;

  Future<bool> scheduledNews(bool value) async {
    _isScheduled = value;
    if (_isScheduled) {
      if (kDebugMode) {
        print('Scheduling Sentra Activated');
      }
      notifyListeners();
      return await AndroidAlarmManager.periodic(
        const Duration(hours: 24),
        1,
        BackgroundService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      if (kDebugMode) {
        print('Scheduling Sentra Canceled');
      }
      notifyListeners();
      return await AndroidAlarmManager.cancel(1);
    }
  }
}
