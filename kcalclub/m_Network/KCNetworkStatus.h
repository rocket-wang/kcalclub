//
//  KCNetworkStatus.h
//  kcalclub
//
//  Created by WangLei on 2017/6/12.
//  Copyright © 2017年 WangLei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Reachability/Reachability.h>

@interface KCNetworkStatus : NSObject

+ (NetworkStatus )status;

+ (BOOL)reachable;

+ (BOOL)notReachable;

+ (BOOL)wifi;

@end
