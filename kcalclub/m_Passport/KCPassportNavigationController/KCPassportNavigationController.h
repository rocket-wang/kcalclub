//
//  KCPassportNavigationController.h
//  kcalclub
//
//  Created by WangLei on 2017/6/11.
//  Copyright © 2017年 WangLei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KCPassportNavigationController : UINavigationController

/** 单例 */
+ (instancetype)singleInstance;

/** 登录界面 */
- (void)willBePressentByMainNavigationController;

@end
