//
//  KCPassportNavigationController.m
//  kcalclub
//
//  Created by WangLei on 2017/6/11.
//  Copyright © 2017年 WangLei. All rights reserved.
//

#import "KCPassportNavigationController.h"
#import "KCLoginViewController.h"

@interface KCPassportNavigationController ()

@end

@implementation KCPassportNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *urlString  = nil;
    NSDictionary *parameters = nil;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - 单例
//单例方法
+ (instancetype)singleInstance{
    //单例变量
    static id _instance = nil;
    //只进行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        KCLoginViewController *kcLoginViewController = [[KCLoginViewController alloc] init];
        _instance = [[KCPassportNavigationController alloc] initWithRootViewController:kcLoginViewController];
    });
    return _instance;
}


/** 登录界面 */
- (void)willBePressentByMainNavigationController{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;

    [rootViewController presentViewController:self animated:YES completion:^{
        
    }];
}


#pragma mark - 屏幕旋转
- (BOOL)shouldAutorotate{
    return YES;//[self.topViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;//[self.topViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;//[self.topViewController preferredInterfaceOrientationForPresentation];
}

@end
