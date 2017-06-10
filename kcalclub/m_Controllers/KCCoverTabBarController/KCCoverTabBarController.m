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
#import "KCFourthViewController.h"
@interface KCCoverTabBarController ()<UITabBarControllerDelegate>

@end

@implementation KCCoverTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.delegate = self;
    [self createSubControllers];
    
    //设置标签栏文字和图片的颜色
    self.tabBar.tintColor = [UIColor orangeColor];
    
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
//    firstVC.tabBarItem.image = [UIImage imageNamed:@"12-eye"];
    UINavigationController *firstNC = [[KCCoverNavigationController alloc]initWithRootViewController:firstVC];
    firstNC.tabBarItem.title = @"训练";

    KCSecondViewController *secondVC = [KCSecondViewController new];
//    secondVC.tabBarItem.image = [UIImage imageNamed:@"21-skull"];
    UINavigationController *secondNC = [[KCCoverNavigationController alloc]initWithRootViewController:secondVC];
    secondNC.tabBarItem.title = @"附近";
    
    KCThirdViewController *thirdVC = [KCThirdViewController new];
//    thirdVC.tabBarItem.image = [UIImage imageNamed:@"21-skull"];
    UINavigationController *thirdNC = [[KCCoverNavigationController alloc]initWithRootViewController:thirdVC];
    thirdNC.tabBarItem.title = @"精选";
    
    KCFourthViewController *fourthVC = [KCFourthViewController new];
//    fourthVC.tabBarItem.image = [UIImage imageNamed:@"21-skull"];
    UINavigationController *fourthNC = [[KCCoverNavigationController alloc]initWithRootViewController:fourthVC];
    fourthNC.tabBarItem.title = @"我的";
    
    
    firstVC.view.backgroundColor = [UIColor colorWithRed:(arc4random()%255)/256.0f green:(arc4random()%255)/256.0f blue:(arc4random()%255)/256.0f alpha:1.0];
    secondVC.view.backgroundColor = [UIColor colorWithRed:(arc4random()%255)/256.0f green:(arc4random()%255)/256.0f blue:(arc4random()%255)/256.0f alpha:1.0];
    thirdVC.view.backgroundColor = [UIColor colorWithRed:(arc4random()%255)/256.0f green:(arc4random()%255)/256.0f blue:(arc4random()%255)/256.0f alpha:1.0];
    fourthVC.view.backgroundColor = [UIColor colorWithRed:(arc4random()%255)/256.0f green:(arc4random()%255)/256.0f blue:(arc4random()%255)/256.0f alpha:1.0];
    
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
