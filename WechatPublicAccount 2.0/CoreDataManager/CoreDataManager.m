
//
//  CoreDataManager.m
//  WechatPublicAccount 2.0
//
//  Created by mayan on 2020/7/16.
//  Copyright © 2020 mayan. All rights reserved.
//

#import "CoreDataManager.h"
#import <MagicalRecord/MagicalRecord.h>

@implementation CoreDataManager

#pragma mark - Init

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    static id instance;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)setupCoreDataStack {
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"WechatPublicAccount"];
    [MagicalRecord setLoggingLevel:MagicalRecordLoggingLevelWarn];
    
    NSLog(@"%@", NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject);
}

- (void)cleanUp {
    [MagicalRecord cleanUp];
}


@end
