
//
//  CoreDataManager.m
//  WechatPublicAccount 2.0
//
//  Created by mayan on 2020/7/16.
//  Copyright © 2020 mayan. All rights reserved.
//

#import "CoreDataManager.h"
#import <MagicalRecord/MagicalRecord.h>
#import "GeneralMsg+CoreDataClass.h"
#import "AppMsg+CoreDataClass.h"

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


#pragma mark - Public Methods

- (void)updateGeneralMsgsWithMetadataArray:(NSArray *)metadataArray accountId:(NSString *)accountId completed:(CoreDataManagerSaveCompletionHandler)completedBlock {
    [[NSManagedObjectContext MR_defaultContext] MR_saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
        for (NSDictionary *metadata in metadataArray) {
            if (![GeneralMsg MR_findFirstByAttribute:@"id" withValue:metadata[@"id"]]) {
                
                GeneralMsg *generalMsg = [GeneralMsg MR_createEntityInContext:localContext];
                generalMsg.id       = [NSString stringWithFormat:@"%@", metadata[@"id"]];
                generalMsg.datetime = [NSString stringWithFormat:@"%@", metadata[@"datetime"]];
                generalMsg.wx_id    = accountId;
                
                for (NSDictionary *msg in metadata[@"msglist"]) {
                    AppMsg *appMsg = [AppMsg MR_createEntityInContext:localContext];
                    appMsg.author      = msg[@"author"];
                    appMsg.content_url = msg[@"content_url"];
                    appMsg.cover       = msg[@"cover"];
                    appMsg.digest      = msg[@"digest"];
                    appMsg.title       = msg[@"title"];
                    [generalMsg addApp_msg_listObject:appMsg];
                }
            }
        }
    } completion:^(BOOL contextDidSave, NSError * _Nullable error) {
        if (completedBlock) {
            completedBlock(contextDidSave, error);
        }
    }];
}

- (NSArray<GeneralMsg *> *)generalMsgsWithAccountId:(NSString *)accountId {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"wx_id = %@", accountId];
    return [GeneralMsg MR_findAllSortedBy:@"datetime" ascending:YES withPredicate:predicate];
}


@end
