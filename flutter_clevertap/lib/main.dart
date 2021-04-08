import 'dart:io';
import 'package:clevertap_plugin/clevertap_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clevertap/analytics/analytics_manager.dart';
import 'package:flutter_clevertap/splash.dart';


void main() => runApp(MainView());

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  CleverTapPlugin _clevertapPlugin;

  @override
  void initState() {
    //for clevertap
    initPlatformState();
    activateCleverTapFlutterPluginHandlers();
    getCleverTapInitialUrl();
    AnalyticsManager.initSDKs();
    activateCleverTapFlutterPluginHandlers();
    super.initState();
  }



  void activateCleverTapFlutterPluginHandlers() async {
    _clevertapPlugin = new CleverTapPlugin();
    if (Platform.isIOS)
      _clevertapPlugin.setCleverTapPushClickedPayloadReceivedHandler(
          pushClickedPayloadReceived);
  }

  void getCleverTapInitialUrl() async {
    var initialUrl = await CleverTapPlugin.getInitialUrl();
    if (initialUrl != null) {
      var promotionUrl = Uri.parse(initialUrl);
      // DeepLinkHandler.parseDeepLinkUrl(promotionUrl);
    }
  }

  void pushClickedPayloadReceived(Map<String, dynamic> map) {
  }

  Future<void> initPlatformState() async {
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: "TEST CLEVERTAP",
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (ctx) => Splash(),
          },
        );
  }
}