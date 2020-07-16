//
//  GeneralMsgListManager.m
//  WechatPublicAccount 2.0
//
//  Created by mayan on 2020/7/16.
//  Copyright © 2020 mayan. All rights reserved.
//

#import "GeneralMsgListManager.h"
#import "CoreDataManager.h"

@implementation GeneralMsgListManager

#pragma mark - Init

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    static id instance;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}


#pragma mark - Public Methods

- (void)fetchGeneralMsgListWithId:(NSString *)accountId isFromNetwork:(BOOL)isFromNetwork completed:(void (^)(NSArray<GeneralMsg *> * _Nonnull, NSError * __nullable))completedBlock {
    if (isFromNetwork) {
        NSString *metadataPath = [[NSBundle mainBundle] pathForResource:accountId ofType:nil];
        NSArray *metadata = [NSArray arrayWithContentsOfFile:metadataPath];
        
        [[CoreDataManager shareInstance] updateGeneralMsgsWithMetadataArray:metadata accountId:accountId completed:^(BOOL contextDidSave, NSError * _Nullable error) {
            if (completedBlock) {
                completedBlock([[CoreDataManager shareInstance] generalMsgsWithAccountId:accountId], error);
            }
        }];
    } else {
        if (completedBlock) {
            completedBlock([[CoreDataManager shareInstance] generalMsgsWithAccountId:accountId], nil);
        }
    }
}

- (void)deleteGeneralMsg:(GeneralMsg *)generalMsg completed:(void (^)(void))completedBlock {
    [[CoreDataManager shareInstance] deleteGeneralMsg:generalMsg completed:^{
        if (completedBlock) {
            completedBlock();
        }
    }];
}


@end
