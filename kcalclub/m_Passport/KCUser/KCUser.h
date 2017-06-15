//
//  KCUser.h
//  kcalclub
//
//  Created by WangLei on 2017/6/11.
//  Copyright © 2017年 WangLei. All rights reserved.
//

#import <Foundation/Foundation.h>

//用户状态
typedef NS_ENUM(NSUInteger,KCUserStatus) {
    KCUserStatusTourist = 0,            //游客身份
    KCUserStatusRegisteredUsers         //注册用户
} ;


typedef NS_ENUM(NSUInteger,KCLoginStatus) {
    KCLoginStatusCancel,            //取消登录
    KCLoginStatusSuccess,           //成功登录
    KCLoginStatusSucceeded,         //已经登录
    KCLoginStatusFailure,           //成功失败
    KCLoginStatusErrorNetwork,      //网络出错
} ;



//用户状态改变通知
static NSString *KCUserStatusChangeNotification = @"KCUserStatusChangeNotification";

@class KCUser;
//用户登录成功Block回调
typedef void (^KCUserLoginSuccessCompletion) (KCLoginStatus status);

@interface KCUser : NSObject

@property (nonatomic, assign, readonly) KCUserStatus userStatus;   // 用户默认为游客，登录后改变为注册用户
@property (nonatomic, copy, readonly) NSString *nickName; //用户昵称
@property (nonatomic, copy, readonly) NSURL *userAvatarURL;  //用户头像URL


//当前用户
+ (instancetype) current;

//用户登录回调
- (void)addKCUserLoginSuccessCompletion:(KCUserLoginSuccessCompletion)completion;


@end
