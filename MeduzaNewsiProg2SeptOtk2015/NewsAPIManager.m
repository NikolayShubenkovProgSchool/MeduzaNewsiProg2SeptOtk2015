//
//  NewsAPIManger.m
//  MeduzaNewsiProg2SeptOtk2015
//
//  Created by Nikolay Shubenkov on 31/10/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

#import "NewsAPIManager.h"

@implementation NewsAPIManager

+ (instancetype)manager {
    static NewsAPIManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *url = [NSURL URLWithString:@"https://meduza.io/api/v3/"];
        manager = [[self alloc]initWithBaseURL:url];
        manager.responseSerializer = [AFJSONResponseSerializer new];
    });
    return manager;
}

- (void)getNewsOfType:(NSString *)type page:(NSInteger)page withSuccess:(void (^)(id responseObject))success  failure:(void (^)(NSError *error))failure{
    [self GET:@"search"
   parameters:@{
                @"chrono" : type,
                @"page" : @(page),
                @"per_page" : @(20),
                @"locale" : @"ru"
                }
      success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
          success(responseObject);
      }
      failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
          failure(error);
      }];
}

- (void)getNewsDetailesByPath:(NSString *)path withSuccess:(void (^)(id))success failure:(void (^)(NSError *))failure {
    [self GET:path
   parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        success(responseObject);
   } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
       failure(error);
   }];
}

@end





















