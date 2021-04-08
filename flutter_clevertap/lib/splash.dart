
import 'package:flutter/material.dart';
import 'package:flutter_clevertap/analytics/analytics_handler.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _sendEventsToCleverTap();
    _sendtestproeprtyclevertap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void _sendEventsToCleverTap() {
    Map<String, dynamic> params = {
      "source" : "ios",
    };
    AnalyticsHandler.instance().sendConnectEvents(
        eventName: "ios_app_launch", analyticsParam: params);
  }


  void _sendtestproeprtyclevertap() async {
    String cleverTapId = await AnalyticsHandler.instance().cleverTapId();

    Map<String, dynamic> userProperties = {
      "emailid" : "test@gmail.com",
      "clevertap_id": cleverTapId,
    };
    AnalyticsHandler.instance().sendUserProperty(userProperties: userProperties, onLogin: true);
  }

}
