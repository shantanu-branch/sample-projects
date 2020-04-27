//
//  AppDelegate.m
//  BranchObjective-C
//
//  Created by Shantanu Khanwalkar on 11/09/19.
//  Copyright © 2019 Shantanu Khanwalkar. All rights reserved.
//

#import "AppDelegate.h"
#import <Branch/Branch.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[Branch getInstance] setDebug];
    // listener for Branch Deep Link data
    [[Branch getInstance] initSessionWithLaunchOptions:launchOptions andRegisterDeepLinkHandler:^(NSDictionary * _Nonnull params, NSError * _Nullable error) {
      // do stuff with deep link data (nav to page, display content, etc)
        
      NSLog(@"%@", params);
    }];
    return YES;
}


- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
  [[Branch getInstance] application:app openURL:url options:options];
  return YES;
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler {
    // handler for Universal Links
    [[Branch getInstance] continueUserActivity:userActivity];
    return YES;
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    // handler for Push Notifications
    [[Branch getInstance] handlePushNotification:userInfo];
}

@end
