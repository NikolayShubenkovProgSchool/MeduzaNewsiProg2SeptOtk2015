//
//  StoreManager.m
//  MeduzaNewsiProg2SeptOtk2015
//
//  Created by Nikolay Shubenkov on 31/10/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

#import "StoreManager.h"

#import <MagicalRecord/MagicalRecord.h>
#import "NewsArticle+CoreDataProperties.h"

@implementation StoreManager

- (void)saveNewsArticlesFromJSON:(NSDictionary *)json {
   [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
       NSDictionary *documents = json[@"documents"];
       [documents enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
           [self parseNewsArtilce:key fromJSON:obj inContext:localContext];
       }];
   }];
}

- (void)parseNewsArtilce:(NSString *)idValue fromJSON:(NSDictionary *)json inContext:(NSManagedObjectContext *)context {
    
    NewsArticle *article = [[NewsArticle MR_findByAttribute:@"idValue"
                                                  withValue:idValue
                                                  inContext:context] firstObject];
    
    if (article == nil){
        article = [NewsArticle MR_createEntityInContext:context];
        article.idValue = idValue;
    }
    article.title = json[@"title"];
    NSString *date = json[@"pub_date"];
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    //2015-10-31
    formatter.dateFormat = @"yyyy-MM-dd";
    
    article.date = [formatter dateFromString:date];
    NSLog(@"found or updated article: %@",article);
}


@end
