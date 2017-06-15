//
//  HttpsClient.h
//  kcalclub
//
//  Created by WangLei on 2017/6/12.
//  Copyright © 2017年 WangLei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
@interface KCHttpsClient : NSObject

/** 网络请求GET方法 */
+ (KCHttpsClient *)GET:(NSString *)URLString
            parameters:(id)parameters
               success:(void (^)(id  _Nullable result))success
               failure:(void (^)(NSError * _Nonnull error))failure;

/** 网络请求POST方法 */
+ (KCHttpsClient *)POST:(NSString *)URLString
             parameters:(id)parameters
                success:(void (^)(id  _Nullable result))success
                failure:(void (^)(NSError * _Nonnull error))failure;

@end
