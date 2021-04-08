import UIKit
import Flutter
import CleverTapSDK
import clevertap_plugin

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    CleverTap.autoIntegrate()
    CleverTap.setDebugLevel(3);
    CleverTapPlugin.sharedInstance()?.applicationDidLaunch(options: launchOptions)
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

extension AppDelegate {
    override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        CleverTap.sharedInstance()?.setPushToken(deviceToken)
    }
    
    
    func application(application: UIApplication, didReceiveRemoteNotification
        userInfo: [NSObject : AnyObject]) {
        CleverTap.sharedInstance()?.handleNotification(withData: userInfo)
    }
    
    func application(application: UIApplication, didReceiveLocalNotification
        notification: UILocalNotification) {
        CleverTap.sharedInstance()?.handleNotification(withData: notification)
    }
    
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?,
                     forLocalNotification notification: UILocalNotification, completionHandler: () -> Void) {
        CleverTap.sharedInstance()?.handleNotification(withData: notification)
        completionHandler()
    }
    
    
    override func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        CleverTap.sharedInstance()?.handleNotification(withData: userInfo)
        completionHandler(.noData)
    }
    
    
}

