//
//  KCUser.m
//  kcalclub
//
//  Created by WangLei on 2017/6/11.
//  Copyright © 2017年 WangLei. All rights reserved.
//

#import "KCUser.h"

@interface KCUser ()

@property (nonatomic, assign) KCUserStatus userStatus;   // 用户默认为游客，登录后改变为注册用户
@property (nonatomic, copy) NSString *nickName; //用户昵称
@property (nonatomic, copy) NSURL *userAvatarURL;  //用户头像URL

@property (nonatomic, copy) KCUserLoginSuccessCompletion kcUserLoginSuccessCompletion; //用户登录成功Block回调
@end

@implementation KCUser

//全局变量
static id _instance = nil;
//单例方法
+(instancetype)current{
    return [[self alloc] init];
}
////alloc会调用allocWithZone:
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    //只进行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}
//初始化方法
- (instancetype)init{
    // 只进行一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super init];
    });
    return _instance;
}
//copy在底层 会调用copyWithZone:
- (id)copyWithZone:(NSZone *)zone{
    return  _instance;
}
+ (id)copyWithZone:(struct _NSZone *)zone{
    return  _instance;
}
+ (id)mutableCopyWithZone:(struct _NSZone *)zone{
    return _instance;
}
- (id)mutableCopyWithZone:(NSZone *)zone{
    return _instance;
}


/** 用户登录回调 */
- (void)addKCUserLoginSuccessCompletion:(KCUserLoginSuccessCompletion)completion{
    self.kcUserLoginSuccessCompletion = completion;
}



#pragma mark - 用户状态设置
/** 用户默认为游客，登录后改变为注册用户 */
- (void)setUserStatus:(KCUserStatus)userStatus{
    _userStatus = userStatus;
    
    NSDictionary *dic = @{
                          @"userStatus" : @(userStatus)
                          };
    
    [[NSNotificationCenter defaultCenter] postNotificationName:KCUserStatusChangeNotification object:nil userInfo:dic];
}


@end
