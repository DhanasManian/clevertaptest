

import 'package:flutter_clevertap/analytics/clevertap_analytics_manager.dart';

class AnalyticsManager {
  static final bool _fireBaseAnalyticsEnabled = true; //TODO need to take from local config
  static final bool _cleverTapAnalyticsEnabled = true; //TODO need to take from local config
  static final bool _gdprUserConsentApproved = true; //TODO Replace with sharedPreference data

  static bool get fireBaseAnalyticsEnabled => _fireBaseAnalyticsEnabled;

  static bool get cleverTapAnalyticsEnabled => _cleverTapAnalyticsEnabled;

  static bool get gdprUserConsentApproved => _gdprUserConsentApproved;

  static void initSDKs() async {
    _initializeFireBase(_gdprUserConsentApproved);
    _initializeClearTap(_gdprUserConsentApproved);
  }

  static void activateSDKs() async {
    _initializeFireBase(true);
    _initializeClearTap(true);
  }

  static void deactivateSDKs() async {
    _initializeFireBase(false);
    _initializeClearTap(false);
  }

  static void _initializeFireBase(bool enable) async {
    // FirebaseAnalyticsManager firebaseAnalyticsManager =
    // FirebaseAnalyticsManager.instance();
    // await firebaseAnalyticsManager
    //     ?.getAnalytics()
    //     ?.setAnalyticsCollectionEnabled(enable);
    // if (enable) {
    //   await _initializeFireBaseToken();
    // } else {
    //   try {
    //     await firebaseAnalyticsManager?.getAnalytics()?.resetAnalyticsData();
    //   } catch (e) {
    //     //Flogger.instance().error(e.toString());
    //   }
    // }
  }

  static void _initializeClearTap(bool enable) async {
    CleverTapAnalyticsManager.instance()?.registerPush();
    CleverTapAnalyticsManager.instance()?.createChannel();
    CleverTapAnalyticsManager.instance().initializeInbox();
    CleverTapAnalyticsManager.instance()?.setOptOut(!enable);
  }


  static Future<void> _initializeFireBaseToken() async {
    // String existingToken =
    // await FirebaseMessagingManager.instance().getExistingToken();
    // if (existingToken == null || existingToken.isEmpty) {
    //   String newToken =
    //   await FirebaseMessagingManager.instance().generateToken();
    //   if (cleverTapAnalyticsEnabled) {
    //     await CleverTapAnalyticsManager.instance().setPushToken(newToken);
    //     //await AnalyticsCloud.getInstance().updateUserProperties(); //TODO need to update user data as well
    //   }
    // }
  }

  static Future<String> getFirebaseId() async{
    // String token = await FirebaseMessagingManager.instance().getExistingToken();
    // if (token == null || token.isEmpty) {
    //   token =
    //   await FirebaseMessagingManager.instance().generateToken();
    // }
    // return token;
  }
}