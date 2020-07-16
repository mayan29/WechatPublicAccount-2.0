//
//  GeneralMsgListHeaderView.h
//  WechatPublicAccount 2.0
//
//  Created by mayan on 2020/7/16.
//  Copyright © 2020 mayan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GeneralMsgListHeaderView : UITableViewHeaderFooterView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView datetime:(NSString *)datetime;


@end

NS_ASSUME_NONNULL_END
