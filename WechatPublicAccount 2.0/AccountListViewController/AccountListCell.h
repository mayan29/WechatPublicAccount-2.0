//
//  AccountListCell.h
//  WechatPublicAccount 2.0
//
//  Created by mayan on 2019/11/27.
//  Copyright © 2019 mayan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class Account;
@interface AccountListCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView account:(Account *)account;

@end

NS_ASSUME_NONNULL_END
