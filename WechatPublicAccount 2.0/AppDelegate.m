//
//  AppDelegate.m
//  WechatPublicAccount 2.0
//
//  Created by mayan on 2020/7/16.
//  Copyright © 2020 mayan. All rights reserved.
//

#import "AppDelegate.h"
#import "CoreDataManager.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[CoreDataManager shareInstance] setupCoreDataStack];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [[CoreDataManager shareInstance] cleanUp];
}


@end
