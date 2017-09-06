//
//  KCCoverTabBarController.m
//  kcalclub
//
//  Created by WangLei on 2017/6/10.
//  Copyright © 2017年 WangLei. All rights reserved.
//

#import "KCCoverTabBarController.h"

#import "KCCoverNavigationController.h"
#import "KCFirstViewController.h"
#import "KCSecondViewController.h"
#import "KCThirdViewController.h"
#import "KCMineController.h"
#import <KCCommon/UINavigationController+Common.h>
#import <KCCommon/UIColor+Common.h>
//#import <KCCommon/KCCommon-umbrella.h>
@interface KCCoverTabBarController ()<UITabBarControllerDelegate>

@end

@implementation KCCoverTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.delegate = self;
    [self createSubControllers];
    
    //设置标签栏文字和图片的颜色
    self.tabBar.tintColor = RGBHexColor(0xfc6820, 1);
    
    //设置标签栏的颜色
    self.tabBar.barTintColor = [UIColor blackColor];
    
    //设置标签栏风格(默认高度49)
    self.tabBar.barStyle = UIBarStyleBlack;
    
    //设置初始状态选中的下标
    self.selectedIndex = 3;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
 */

#pragma mark - 创建子视图
- (void)createSubControllers{
    KCFirstViewController *firstVC = [KCFirstViewController new];
    firstVC.tabBarItem.image = [UIImage imageNamed:@"ic_tab_train"];
    UINavigationController *firstNC = [[KCCoverNavigationController alloc]initWithRootViewController:firstVC];
    firstNC.navigationBarHidden = YES;
    firstNC.tabBarItem.title = @"训练";

    KCSecondViewController *secondVC = [KCSecondViewController new];
    secondVC.tabBarItem.image = [UIImage imageNamed:@"ic_tab_nearby"];
    UINavigationController *secondNC = [[KCCoverNavigationController alloc]initWithRootViewController:secondVC];
    secondNC.navigationBarHidden = YES;
    secondNC.tabBarItem.title = @"附近";
    
    KCThirdViewController *thirdVC = [KCThirdViewController new];
    thirdVC.tabBarItem.image = [UIImage imageNamed:@"ic_tab_recommend"];
    UINavigationController *thirdNC = [[KCCoverNavigationController alloc]initWithRootViewController:thirdVC];
    thirdNC.navigationBarHidden = YES;
    thirdNC.tabBarItem.title = @"精选";
    
    KCMineController *fourthVC = [[KCMineController alloc] initWithStyle:UITableViewStyleGrouped];
    fourthVC.tabBarItem.image = [UIImage imageNamed:@"ic_tab_mine"];
    UINavigationController *fourthNC = [[KCCoverNavigationController alloc]initWithRootViewController:fourthVC];
    fourthNC.tabBarItem.title = @"我的";
    {
        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
        attributes[NSFontAttributeName] = [UIFont systemFontOfSize:12];
        [firstNC.tabBarItem setTitleTextAttributes:attributes forState:UIControlStateNormal];
        [secondNC.tabBarItem setTitleTextAttributes:attributes forState:UIControlStateNormal];
        [thirdNC.tabBarItem setTitleTextAttributes:attributes forState:UIControlStateNormal];
        [fourthNC.tabBarItem setTitleTextAttributes:attributes forState:UIControlStateNormal];
    }
    
    
    self.viewControllers = @[firstNC,secondNC,thirdNC,fourthNC];
}

#pragma mark - UITabBarController 代理方法
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    NSLog(@"clicked");
    return YES;
}

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"%@",viewController.tabBarItem.title);
}



#pragma mark - 屏幕旋转
- (BOOL)shouldAutorotate{
    return [self.selectedViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return [self.selectedViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [self.selectedViewController preferredInterfaceOrientationForPresentation];
}

@end
