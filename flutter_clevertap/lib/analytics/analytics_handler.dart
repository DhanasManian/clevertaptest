

import 'package:flutter_clevertap/analytics/analytics_abstract.dart';
import 'package:flutter_clevertap/analytics/analytics_manager.dart';
import 'package:flutter_clevertap/analytics/clevertap_analytics_manager.dart';
import 'package:flutter/material.dart';

class AnalyticsHandler extends IAnalyticsCloud {
  static IAnalyticsCloud _instance;

  AnalyticsHandler._privateConstructor();

  factory AnalyticsHandler.instance() {
    if (_instance == null) {
        _instance = AnalyticsHandler._privateConstructor();
    }
    return _instance;
  }

  // FirebaseAnalyticsManager get firebaseAnalyticsInstance =>
  //     FirebaseAnalyticsManager.instance();

  CleverTapAnalyticsManager get cleverTapAnalyticsInstance =>
      CleverTapAnalyticsManager.instance();

  Future<String> cleverTapId() async{
    return await CleverTapAnalyticsManager.instance().getCleverTapId();
  }

  Future<String> firebaseId() async{
    return await AnalyticsManager.getFirebaseId();
  }

  Future<void> _sendEvent(
      {@required String event,
        @required Map<String, dynamic> params}) async {
    assert(event != null, 'AnalyticsEventName is required');
    assert(params != null && params.length > 0, 'params is required');

    final eventName = event;
    if (eventName==null) return;
    
    // if (AnalyticsManager.fireBaseAnalyticsEnabled) {
    //   FirebaseAnalyticsManager.instance()
    //       .getAnalytics()
    //       ?.logEvent(name: eventName, parameters: params);
    // }

    if (AnalyticsManager.cleverTapAnalyticsEnabled) {
      CleverTapAnalyticsManager.instance()?.recordEvent(eventName, params);
    }
  }

  Future<void> _analyticsUserProperty(
      {@required Map<String, dynamic> properties, bool onLogin}) async {
    assert(properties != null && properties.length > 0, 'property is required');

    properties.removeWhere((key, value) => key.isEmpty || value == null);

    // if (AnalyticsManager.fireBaseAnalyticsEnabled) {
    //   properties.removeWhere((key, value) => key.contains('-'));
    //   properties.forEach((key, value) {
    //     FirebaseAnalyticsManager.instance()
    //         .getAnalytics()
    //         .setUserProperty(name: key, value: value.toString());
    //   });
    // }

    if (AnalyticsManager.cleverTapAnalyticsEnabled) {
      CleverTapAnalyticsManager.instance()?.setUserProperties(properties, onLogin);
    }
  }



  @override
  Future<void> sendAutoLoginEvent(
      {@required String storeId,
        @required bool status,
        String failureReason}) async {
    assert(storeId != null && storeId.isNotEmpty, 'storeId is required');
    assert(status != null, 'status is required');

    // Map<String, dynamic> params = {
    //   AnalyticsEventParameter.storeId.key: storeId,
    //   AnalyticsEventParameter.status.key: status
    //       ? AnalyticsEventParameterValue.status.success
    //       : AnalyticsEventParameterValue.status.failure,
    //   if (!status && failureReason != null && failureReason.isNotEmpty)
    //     AnalyticsEventParameter.failureReason.key: failureReason
    // };
    // _sendEvent(event: AnalyticsEventName.autoLogin, params: params);
  }

  @override
  Future<void> sendOtpRequestEvent(
      {@required bool status,
        @required int attemptCount,
        @required int resendOtpCount,
        String errorMessage}) async {
    assert(status != null, 'status is required');
    assert(resendOtpCount != null, 'resendOtpCount is required');
    assert(resendOtpCount != null, 'resendOtpCount is required');

    // Map<String, dynamic> params = {
    //   AnalyticsEventParameter.status.key: status
    //       ? AnalyticsEventParameterValue.status.success
    //       : AnalyticsEventParameterValue.status.failure,
    //   AnalyticsEventParameter.attemptCount.key: attemptCount,
    //   AnalyticsEventParameter.resendOtp.key: resendOtpCount,
    //   if (!status && errorMessage != null && errorMessage.isNotEmpty)
    //     AnalyticsEventParameter.failureReason.key: errorMessage
    // };
    // _sendEvent(event: AnalyticsEventName.otpRequest, params: params);
  }

  @override
  Future<void> sendOtpValidateEvent(
      {@required bool status, String errorMessage}) async {
    assert(status != null, 'status is required');

    // Map<String, dynamic> params = {
    //   AnalyticsEventParameter.status.key: status
    //       ? AnalyticsEventParameterValue.status.success
    //       : AnalyticsEventParameterValue.status.failure,
    //   if (!status && errorMessage != null && errorMessage.isNotEmpty)
    //     AnalyticsEventParameter.failureReason.key: errorMessage
    // };
    // _sendEvent(event: AnalyticsEventName.otpValidation, params: params);
  }

  @override
  Future<void> sendPricingDisplayEvent(
      {@required String displayObject,
        @required bool displayStatus,
        String failureReason,
        int noOfPlans,
        String planNameAndOrder,
        String source,
        String categoryName}) async {

    // Map<String, dynamic> params = {
    //   AnalyticsEventParameter.displayObject.key: displayObject,
    //   AnalyticsEventParameter.displayStatus.key: displayStatus
    //       ? AnalyticsEventParameterValue.status.success
    //       : AnalyticsEventParameterValue.status.failure,
    //   AnalyticsEventParameter.numberOfPlansDisplayed.key: noOfPlans,
    //   AnalyticsEventParameter.planNameAndOrder.key: planNameAndOrder,
    //   AnalyticsEventParameter.source.key: source,
    //   AnalyticsEventParameter.categoryName.key: categoryName,
    //   if (!displayStatus && failureReason != null && failureReason.isNotEmpty)
    //     AnalyticsEventParameter.failureReason.key: failureReason
    // };
    // _sendEvent(event: AnalyticsEventName.pricingDisplay, params: params);
  }

  @override
  Future<void> sendSetClickEvent({
    Map<String, dynamic> analyticsParam,
  }) async {
   // _sendEvent(event: AnalyticsEventName.setClick, params: analyticsParam);
  }

  @override
  Future<void> sendSetConfirmEvent(
      {Map<String, dynamic> analyticsParam}) async {
   // _sendEvent(event: AnalyticsEventName.setConfirm, params: analyticsParam);
  }

  @override
  Future<void> sendSetSecondConfirmEvent(
      {Map<String, dynamic> analyticsParam}) async {
    // _sendEvent(
    //     event: AnalyticsEventName.setSecondConsent, params: analyticsParam);
  }

  @override
  Future<void> sendUserProperty({ @required Map<String, dynamic> userProperties, bool onLogin}) async{
    _analyticsUserProperty(properties: userProperties, onLogin: onLogin);
  }

  @override
  Future<void> sendSearchEvent({String keyWord, String searchMode, String tag, String searchSource, String resultsShown, String tagType}) async{

    // Map<String, dynamic> params = {
    //   AnalyticsEventParameter.keyword.key: keyWord,
    //   AnalyticsEventParameter.searchMode.key: searchMode,
    //   AnalyticsEventParameter.tagType.key : tagType,
    //   AnalyticsEventParameter.tag.key: tag,
    //   AnalyticsEventParameter.source.key: searchSource,
    //   AnalyticsEventParameter.resultShown.key: resultsShown.toString(),
    //
    // };
    // _sendEvent(event: AnalyticsEventName.search, params: params);
  }

  @override
  Future<void> sendPreviewEvent({Map<String, dynamic > analyticsParam}) async {
   // _sendEvent(event: AnalyticsEventName.preview, params: analyticsParam);
  }

  @override
  Future<void> sendConnectEvents({String eventName, Map<dynamic, dynamic> analyticsParam}) async {
    _sendEvent(event: eventName, params: analyticsParam);
  }
}