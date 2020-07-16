//
//  CoreDataManager.h
//  WechatPublicAccount 2.0
//
//  Created by mayan on 2020/7/16.
//  Copyright © 2020 mayan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CoreDataManager : NSObject

+ (instancetype)shareInstance;

- (void)setupCoreDataStack;
- (void)cleanUp;


@end

NS_ASSUME_NONNULL_END
