//
//  NewsArticle.h
//  
//
//  Created by Nikolay Shubenkov on 31/10/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NewsCategory, NewsImage;

NS_ASSUME_NONNULL_BEGIN

@interface NewsArticle : NSManagedObject

// Insert code here to declare functionality of your managed object subclass

@end

NS_ASSUME_NONNULL_END

#import "NewsArticle+CoreDataProperties.h"
