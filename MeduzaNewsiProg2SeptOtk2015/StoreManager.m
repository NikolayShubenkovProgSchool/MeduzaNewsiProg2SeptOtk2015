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
#import "NewsImage+CoreDataProperties.h"

@implementation StoreManager

- (void)updateNewsArticleDetailesFromJSON:(NSDictionary *)json {
    
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        
        NSDictionary *root = json[@"root"];
        NSArray *gallery = root[@"gallery"];
        
        NSString *newsURL = root[@"url"];
        NewsArticle *article = [NewsArticle MR_findFirstByAttribute:@"idValue"
                                                          withValue:newsURL
                                                          inContext:localContext];
        article.content = root[@"content"][@"body"];
        
        for (NSDictionary *imageInfo in gallery){
            NSString *url = imageInfo[@"original_url"];
            url = [@"https://meduza.io" stringByAppendingString:url];
            
            NewsImage *image = [NewsImage MR_findFirstByAttribute:@"url"
                                                        withValue:url
                                //-----------------!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!---------
                                                        inContext:localContext];
            
            if (image == nil){
                image = [NewsImage MR_createEntityInContext:localContext];
                image.url = url;
            }
            [article addNewRelationshipObject:image];
        }
    }];
}

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
