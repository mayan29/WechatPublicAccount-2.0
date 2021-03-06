//
//  GeneralMsgListViewController.h
//  WechatPublicAccount 2.0
//
//  Created by mayan on 2020/7/16.
//  Copyright © 2020 mayan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GeneralMsgListViewController : UITableViewController

@property (nonatomic, copy) NSString *accountId;
@property (nonatomic, copy) NSString *accountNickName;

@end

NS_ASSUME_NONNULL_END
