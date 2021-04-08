
import 'package:clevertap_plugin/clevertap_plugin.dart';
import 'package:flutter_clevertap/analytics/analytics_manager.dart';


abstract class IAnalyticsManager<T> {
  T getAnalytics();
}


class CleverTapAnalyticsManager extends IAnalyticsManager<CleverTapPlugin> {
  static CleverTapAnalyticsManager _instance;
  final String notificationChannel = 'App Default Channel';

  CleverTapPlugin _analytics;

  CleverTapAnalyticsManager._privateConstructor() {
    if (!AnalyticsManager.cleverTapAnalyticsEnabled) {
      return;
    }
    _analytics = CleverTapPlugin();
    CleverTapPlugin.setDebugLevel(3);
  }

  factory CleverTapAnalyticsManager.instance() {
    if (_instance == null)
      _instance = CleverTapAnalyticsManager._privateConstructor();
    return _instance;
  }

  @override
  CleverTapPlugin getAnalytics() {
    return CleverTapAnalyticsManager.instance()._analytics;
  }

  Future<void> setOptOut(bool value) async {
    return CleverTapPlugin.setOptOut(value);
  }

  Future<void> recordEvent(
      String eventName, Map<String, dynamic> properties) async {
    return CleverTapPlugin.recordEvent(eventName, properties);
  }

  Future<void> setPushToken(String token) async {
    return CleverTapPlugin.setPushToken(token).catchError((_) {});
  }

  Future<void> createChannel() async {
    return CleverTapPlugin.createNotificationChannel(
        notificationChannel, notificationChannel, notificationChannel, 3, true);
  }

  Future<void> initializeInbox() async {
    return  CleverTapPlugin.initializeInbox();
  }


  Future<void> setUserProperties(
      Map<String, dynamic> properties, bool onLogin) async {
    if(onLogin == true){
      return CleverTapPlugin.onUserLogin(properties).then((value){
        print("clevertap sendproperty success");
      },onError: (e){
        print("clevertap sendproperty error $e");
      });
    }
    else {
      return CleverTapPlugin.profileSet(properties);
    }
  }

  Future<void> registerPush() async {
    return CleverTapPlugin.registerForPush();
  }

  Future<String> getCleverTapId() async {
    return CleverTapPlugin.profileGetCleverTapID();
  }
}