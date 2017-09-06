//
//  KCMineController.m
//  kcalclub
//
//  Created by WangLei on 2017/9/2.
//  Copyright © 2017年 WangLei. All rights reserved.
//

#import "KCMineController.h"
#import <KCCommon/UIViewController+Common.h>
#import <KCCommon/UIColor+Common.h>
#import "KCMineLabelCell.h"
#import "KCMineAvatarCell.h"

#import "KCPersonalCenterTVC.h"
@interface KCMineController ()

@end

@implementation KCMineController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.titleLabel.text = @"我的";
    self.titleLabel.textColor = [UIColor whiteColor];
    self.navigationColor = RGBHexColor(0xfc6820, 1);
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    
    [self.tableView registerClass:[KCMineLabelCell class] forCellReuseIdentifier:@"KCMineLabelCell"];
    [self.tableView registerClass:[KCMineAvatarCell class] forCellReuseIdentifier:@"KCMineAvatarCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [UIView new];
    if (section == 0) {
        header.backgroundColor = RGBHexColor(0xfc6820, 1);
    }
    else{
        header.backgroundColor = RGBHexColor(0xF7F7F7, 1);//[UIColor clearColor];
    }
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.5f;
    }
    else if(section == 1){
        return 10;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *header = [UIView new];
    header.backgroundColor = RGBHexColor(0xF7F7F7, 1);//[UIColor clearColor];
    return header;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.5f;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }
    else if(section == 1){
        return 1;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 140;
    }
    return 44;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"KCMineAvatarCell" forIndexPath:indexPath];
        cell.contentView.backgroundColor = RGBHexColor(0xfc6820, 1);
    }
    else if (indexPath.section == 0 && indexPath.row == 1){
        cell = [tableView dequeueReusableCellWithIdentifier:@"KCMineLabelCell" forIndexPath:indexPath];
        ((KCMineLabelCell *)cell).titleLabel.text = @"运动数据";
    }
    else if (indexPath.section == 0 && indexPath.row == 2){
        cell = [tableView dequeueReusableCellWithIdentifier:@"KCMineLabelCell" forIndexPath:indexPath];
        ((KCMineLabelCell *)cell).titleLabel.text = @"我的能量";
    }
    else if (indexPath.section == 1 && indexPath.row == 0){
        cell = [tableView dequeueReusableCellWithIdentifier:@"KCMineLabelCell" forIndexPath:indexPath];
        ((KCMineLabelCell *)cell).titleLabel.text = @"设置";
    }
    else{
        cell = [tableView dequeueReusableCellWithIdentifier:@"KCMineLabelCell" forIndexPath:indexPath];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        KCPersonalCenterTVC *tvc = [[KCPersonalCenterTVC alloc] initWithStyle:UITableViewStyleGrouped];
        [self.navigationController pushViewController:tvc animated:YES];
    }
}



#pragma mark - StatusBar 设置
- (BOOL)prefersStatusBarHidden{
    return NO;
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(UIStatusBarAnimation)preferredStatusBarUpdateAnimation{
    return UIStatusBarAnimationFade;
}
@end
