//
//  GeneralMsgListCell.h
//  WechatPublicAccount 2.0
//
//  Created by mayan on 2020/7/16.
//  Copyright © 2020 mayan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class AppMsg;
@interface GeneralMsgListCell : UITableViewCell

@property (nonatomic, copy) void (^imageViewClickBlock)(NSString *cover);

+ (instancetype)cellWithTableView:(UITableView *)tableView appMsg:(AppMsg *)appMsg;


@end

NS_ASSUME_NONNULL_END
