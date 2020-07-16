//
//  GeneralMsgListViewController.m
//  WechatPublicAccount 2.0
//
//  Created by mayan on 2020/7/16.
//  Copyright © 2020 mayan. All rights reserved.
//

#import "GeneralMsgListViewController.h"
#import "GeneralMsgListHeaderView.h"
#import "GeneralMsgListCell.h"
#import "GeneralMsgListManager.h"

@interface GeneralMsgListViewController ()

@property (nonatomic, strong) NSMutableArray<GeneralMsg *> *generalMsgArray;
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSArray<AppMsg *> *> *appMsgListMap;

@end

@implementation GeneralMsgListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.accountNickName;
    
    self.tableView.tableFooterView = [UIView new];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 150.f;
    self.tableView.sectionHeaderHeight = 40.f;

    self.tableView.refreshControl = [[UIRefreshControl alloc] init];
    self.tableView.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
    [self.tableView.refreshControl addTarget:self action:@selector(refreshAction) forControlEvents:UIControlEventValueChanged];
    
    [self fetchGeneralMsgArrayWithIsFromNetwork:NO];
}


#pragma mark - Pravite Methods

- (void)refreshAction {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:@"是否从远端获取数据？" preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self fetchGeneralMsgArrayWithIsFromNetwork:NO];
    }]];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self fetchGeneralMsgArrayWithIsFromNetwork:YES];
    }]];
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)fetchGeneralMsgArrayWithIsFromNetwork:(BOOL)isFromNetwork {
    [[GeneralMsgListManager shareInstance] fetchGeneralMsgListWithId:self.accountId isFromNetwork:isFromNetwork completed:^(NSArray<GeneralMsg *> * _Nonnull generalMsgs, NSError * _Nullable error) {
        self.generalMsgArray = generalMsgs.mutableCopy;
        [self.tableView.refreshControl endRefreshing];
        [self.tableView reloadData];
    }];
}

- (NSArray<AppMsg *> *)appMsgArrayWithGeneralMsg:(GeneralMsg *)generalMsg {
    if (!self.appMsgListMap[generalMsg.id]) {
        NSSortDescriptor *sd = [[NSSortDescriptor alloc] initWithKey:@"content_url" ascending:YES];
        self.appMsgListMap[generalMsg.id] = [generalMsg.app_msg_list.allObjects sortedArrayUsingDescriptors:@[sd]];
    }
    return self.appMsgListMap[generalMsg.id];
}


#pragma mark - UITableViewDelegate and UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.generalMsgArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.generalMsgArray[section].app_msg_list.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    GeneralMsg *generalMsg = self.generalMsgArray[section];
    return [GeneralMsgListHeaderView headerViewWithTableView:tableView datetime:generalMsg.datetime];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GeneralMsg *generalMsg = self.generalMsgArray[indexPath.section];
    AppMsg *appMsg = [self appMsgArrayWithGeneralMsg:generalMsg][indexPath.row];
    GeneralMsgListCell *cell = [GeneralMsgListCell cellWithTableView:tableView appMsg:appMsg];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"复制" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"复制");
    }]];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"删除");
    }]];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alertVC animated:YES completion:nil];
}


#pragma mark - Lazy Load

- (NSMutableDictionary<NSString *,NSArray<AppMsg *> *> *)appMsgListMap {
    if (!_appMsgListMap) {
        _appMsgListMap = [NSMutableDictionary dictionary];
    }
    return _appMsgListMap;
}


@end
