//
//  StoreManager.h
//  MeduzaNewsiProg2SeptOtk2015
//
//  Created by Nikolay Shubenkov on 31/10/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoreManager : NSObject

- (void)saveNewsArticlesFromJSON:(id)json;

- (void)updateNewsArticleDetailesFromJSON:(NSDictionary *)json;

@end
