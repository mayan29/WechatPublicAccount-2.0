//
//  GeneralMsgListViewController.m
//  WechatPublicAccount 2.0
//
//  Created by mayan on 2020/7/16.
//  Copyright © 2020 mayan. All rights reserved.
//

#import "GeneralMsgListViewController.h"
#import "GeneralMsgListViewCell.h"
#import "CoreDataManager.h"

@interface GeneralMsgListViewController ()

@end

@implementation GeneralMsgListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.accountNickName;
    
    self.tableView.tableFooterView = [UIView new];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 150.f;

    self.tableView.refreshControl = [[UIRefreshControl alloc] init];
    self.tableView.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
    [self.tableView.refreshControl addTarget:self action:@selector(refreshAction) forControlEvents:UIControlEventValueChanged];
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
//    [[GeneralMsgListManager shareInstance] fetchGeneralMsgListWithId:self.account.id isFromNetwork:isFromNetwork completed:^(NSArray<GeneralMsg *> * _Nonnull generalMsgs, NSError * _Nonnull error) {
//        self.generalMsgArray = generalMsgs.mutableCopy;
//        [self.tableView.refreshControl endRefreshing];
//        [self.tableView reloadData];
//    }];
    FMDBManager *manager = [FMDBManager shareInstance];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}


@end
