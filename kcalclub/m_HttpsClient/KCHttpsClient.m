//
//  HttpsClient.m
//  kcalclub
//
//  Created by WangLei on 2017/6/12.
//  Copyright © 2017年 WangLei. All rights reserved.
//

#import "KCHttpsClient.h"
#import <AFNetworking/AFNetworking.h>

@interface KCHttpsClient()

@property (nonatomic, strong) NSURLSessionDataTask *dataTask;

@end

@implementation KCHttpsClient




+ (KCHttpsClient *)GET:(NSString *)URLString
                   parameters:(id)parameters
                      success:(void (^)(id  _Nullable result))success
                      failure:(void (^)(NSError * _Nonnull error))failure{
    
    KCHttpsClient *client = [[KCHttpsClient alloc] init];
    client.dataTask = [[AFHTTPSessionManager manager] GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
    return client;
}




- (KCHttpsClient *)POST:(NSString *)URLString
             parameters:(id)parameters
                success:(void (^)(id  _Nullable result))success
                failure:(void (^)(NSError * _Nonnull error))failure{

    
    
    KCHttpsClient *client = [[KCHttpsClient alloc] init];
    client.dataTask = [[AFHTTPSessionManager manager] POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    return client;
}

@end
