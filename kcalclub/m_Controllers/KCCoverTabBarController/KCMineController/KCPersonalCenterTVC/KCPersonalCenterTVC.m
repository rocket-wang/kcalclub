//
//  KCPersonalCenterTVC.m
//  kcalclub
//
//  Created by WangLei on 2017/8/31.
//  Copyright © 2017年 WangLei. All rights reserved.
//

#import "KCPersonalCenterTVC.h"

#import "KCPersonalLabelCell.h"
#import "KCPersonalAvatarCell.h"
#import "KCPersonalTextFieldCell.h"
#import <KCCommon/UIColor+Common.h>
#import <KCCommon/UIViewController+Common.h>
#import <KCCommon/UINavigationController+Common.h>

@interface KCPersonalCenterTVC ()

@property (nonatomic, strong) NSArray *personalInfo;

@end

@implementation KCPersonalCenterTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSError *error = nil;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"PersonalInfo" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath options:NSDataReadingUncached error:&error];
    if (error == nil) {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        if (error == nil && [json isKindOfClass:[NSArray class]]) {
            self.personalInfo = json;
        }
    }
    
    if (![self.personalInfo isKindOfClass:[NSArray class]]) {
        self.personalInfo = @[];
    }
    
    self.titleLabel.text = @"个人资料";
    self.titleLabel.textColor = RGBHexColor(0xc2c2c2, 1);
    self.navigationController.navigationColor = RGBHexColor(0x404040, 1);
    UIImage *image = [UIImage imageNamed:@"ic_navigation_bar_back_white"];
    image =  [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self.backButton setImage:image forState:UIControlStateNormal];
//    [self backButton];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    
    [self.tableView registerClass:[KCPersonalLabelCell class] forCellReuseIdentifier:@"KCPersonalLabelCell"];
    [self.tableView registerClass:[KCPersonalAvatarCell class] forCellReuseIdentifier:@"KCPersonalAvatarCell"];
    [self.tableView registerClass:[KCPersonalTextFieldCell class] forCellReuseIdentifier:@"KCPersonalTextFieldCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.personalInfo.count;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [UIView new];
    header.backgroundColor = RGBHexColor(0xF7F7F7, 1);//[UIColor clearColor];
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 10.f;
    }
    return 5.f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *header = [UIView new];
    header.backgroundColor = RGBHexColor(0xF7F7F7, 1);//[UIColor clearColor];
    return header;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == ((self.personalInfo).count - 1)) {
        return 0.0001f;
    }
    return 5.f;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return ((NSArray *)self.personalInfo[section]).count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    NSDictionary *item = ((NSArray *)self.personalInfo[section])[row];
    NSNumber *height = item[@"height"];
    
    return [height floatValue];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    NSDictionary *item = ((NSArray *)self.personalInfo[section])[row];
    NSNumber *type = item[@"type"];

    switch ([type integerValue]) {
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier:@"KCPersonalAvatarCell" forIndexPath:indexPath];
            ((KCPersonalAvatarCell *)cell).titleLabel.text = item[@"title"];
            
            break;
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:@"KCPersonalTextFieldCell" forIndexPath:indexPath];
            ((KCPersonalTextFieldCell *)cell).titleLabel.text = item[@"title"];
            ((KCPersonalTextFieldCell *)cell).textfield.text = item[@"value"];
            
            break;
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:@"KCPersonalLabelCell" forIndexPath:indexPath];
            ((KCPersonalLabelCell *)cell).titleLabel.text = item[@"title"];
            ((KCPersonalLabelCell *)cell).infoLabel.text = item[@"value"];
            
            break;
        default:
            cell = [tableView dequeueReusableCellWithIdentifier:@"KCPersonalLabelCell" forIndexPath:indexPath];
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
