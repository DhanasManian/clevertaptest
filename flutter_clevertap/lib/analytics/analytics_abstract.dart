
import 'package:flutter/material.dart';

abstract class IAnalyticsCloud {

  Future<void> sendUserProperty({Map<String, dynamic> userProperties});

  Future<void> sendAutoLoginEvent(
      {@required String storeId, @required bool status, String failureReason});

  Future<void> sendOtpRequestEvent(
      {@required bool status,
        @required int attemptCount,
        @required int resendOtpCount,
        String errorMessage});

  Future<void> sendOtpValidateEvent(
      {@required bool status, String errorMessage});

  Future<void> sendPricingDisplayEvent(
      {@required String  displayObject,
        bool displayStatus,
        String failureReason,
        int noOfPlans,
        String planNameAndOrder,
        String source,
        String categoryName});

  Future<void> sendSetClickEvent(
      {Map<String, dynamic> analyticsParam,
      });

  Future<void> sendSetConfirmEvent(
      {Map<String, dynamic> analyticsParam});

  Future<void> sendSetSecondConfirmEvent(
      {Map<String, dynamic> analyticsParam});

  Future<void> sendSearchEvent(
      {String keyWord,
        String searchMode,
        String tag,
        String searchSource,
        String resultsShown,
        String tagType});


  Future<void> sendPreviewEvent(
      {Map<String, dynamic> analyticsParam});

  Future<void> sendConnectEvents(
      {String eventName, Map<String, dynamic> analyticsParam});
}
