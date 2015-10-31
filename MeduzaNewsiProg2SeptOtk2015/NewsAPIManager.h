//
//  NewsAPIManger.h
//  MeduzaNewsiProg2SeptOtk2015
//
//  Created by Nikolay Shubenkov on 31/10/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface NewsAPIManager : AFHTTPRequestOperationManager

+ (instancetype)manager;
- (void)getNewsOfType:(NSString *)type page:(NSInteger)page withSuccess:(void (^)(id responseObject))success  failure:(void (^)(NSError *error))failure;

@end
