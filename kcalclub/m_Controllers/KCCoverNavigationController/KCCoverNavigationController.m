//
//  KCCoverNavigationController.m
//  kcalclub
//
//  Created by WangLei on 2017/6/11.
//  Copyright © 2017年 WangLei. All rights reserved.
//

#import "KCCoverNavigationController.h"

@interface KCCoverNavigationController ()

@end

@implementation KCCoverNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
#pragma mark - 屏幕旋转
- (BOOL)shouldAutorotate{
    return [self.topViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return [self.topViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [self.topViewController preferredInterfaceOrientationForPresentation];
}


#pragma mark - StatusBar 设置
- (BOOL)prefersStatusBarHidden{
    return [self.topViewController prefersStatusBarHidden];
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return [self.topViewController preferredStatusBarStyle];
}

-(UIStatusBarAnimation)preferredStatusBarUpdateAnimation{
    return [self.topViewController preferredStatusBarUpdateAnimation];
}

@end
