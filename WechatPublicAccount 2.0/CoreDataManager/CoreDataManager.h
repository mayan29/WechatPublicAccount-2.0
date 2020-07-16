//
//  CoreDataManager.h
//  WechatPublicAccount 2.0
//
//  Created by mayan on 2020/7/16.
//  Copyright © 2020 mayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GeneralMsg+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^CoreDataManagerSaveCompletionHandler)(BOOL contextDidSave, NSError * __nullable error);

@interface CoreDataManager : NSObject

+ (instancetype)shareInstance;

- (void)setupCoreDataStack;
- (void)cleanUp;

- (void)updateGeneralMsgsWithMetadataArray:(NSArray *)metadataArray accountId:(NSString *)accountId completed:(CoreDataManagerSaveCompletionHandler)completedBlock;
- (NSArray<GeneralMsg *> *)generalMsgsWithAccountId:(NSString *)accountId;

@end

NS_ASSUME_NONNULL_END
