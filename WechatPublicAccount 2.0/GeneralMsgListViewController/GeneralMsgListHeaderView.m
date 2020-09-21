//
//  GeneralMsgListHeaderView.m
//  WechatPublicAccount 2.0
//
//  Created by mayan on 2020/7/16.
//  Copyright © 2020 mayan. All rights reserved.
//

#import "GeneralMsgListHeaderView.h"

@interface GeneralMsgListHeaderView ()

@property (nonatomic, strong) UILabel *datetimeLabel;

@end

@implementation GeneralMsgListHeaderView

#pragma mark - Init

+ (instancetype)headerViewWithTableView:(UITableView *)tableView datetime:(NSString *)datetime {
    static NSString *id = @"GeneralMsgListHeaderView";
    GeneralMsgListHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:id];
    if (!view) {
        view = [[GeneralMsgListHeaderView alloc] initWithReuseIdentifier:id];
    }
    view.datetimeLabel.text = [[NSDate dateWithTimeIntervalSince1970:datetime.floatValue] stringWithFormat:@"YYYY年MM月dd日 hh:mm"];
    return view;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.datetimeLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.datetimeLabel.frame = self.contentView.bounds;
}


#pragma mark - Lazy Load

- (UILabel *)datetimeLabel {
    if (!_datetimeLabel) {
        _datetimeLabel = [[UILabel alloc] init];
        _datetimeLabel.font = [UIFont systemFontOfSize:14];
        _datetimeLabel.textAlignment = NSTextAlignmentCenter;
        _datetimeLabel.textColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1];
        _datetimeLabel.backgroundColor = UIColor.whiteColor;
    }
    return _datetimeLabel;
}


@end
