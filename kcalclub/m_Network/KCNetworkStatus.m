//
//  KCNetworkStatus.m
//  kcalclub
//
//  Created by WangLei on 2017/6/12.
//  Copyright © 2017年 WangLei. All rights reserved.
//

#import "KCNetworkStatus.h"

@implementation KCNetworkStatus

+ (NetworkStatus )status{
    NetworkStatus netStatus = [[Reachability reachabilityForInternetConnection] currentReachabilityStatus];
    return netStatus;
}

+ (BOOL)reachable{
    NetworkStatus netStatus = [[Reachability reachabilityForInternetConnection] currentReachabilityStatus];
    return ((netStatus == ReachableViaWiFi) || (netStatus == ReachableViaWWAN));
}

+ (BOOL)notReachable{
    NetworkStatus netStatus = [[Reachability reachabilityForInternetConnection] currentReachabilityStatus];
    return (netStatus == NotReachable);
}

+ (BOOL)wifi{
    NetworkStatus netStatus = [[Reachability reachabilityForInternetConnection] currentReachabilityStatus];
    return (netStatus == ReachableViaWiFi);
}

@end
