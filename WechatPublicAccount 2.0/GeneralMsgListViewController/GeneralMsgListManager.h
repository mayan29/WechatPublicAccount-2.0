//
//  GeneralMsgListManager.h
//  WechatPublicAccount 2.0
//
//  Created by mayan on 2020/7/16.
//  Copyright © 2020 mayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GeneralMsg+CoreDataClass.h"
#import "AppMsg+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface GeneralMsgListManager : NSObject

+ (instancetype)shareInstance;

- (void)fetchGeneralMsgListWithId:(NSString *)accountId isFromNetwork:(BOOL)isFromNetwork completed:(void (^)(NSArray<GeneralMsg *> *, NSError * __nullable))completedBlock;
- (void)deleteGeneralMsg:(GeneralMsg *)generalMsg completed:(void (^)(void))completedBlock;


@end

NS_ASSUME_NONNULL_END
