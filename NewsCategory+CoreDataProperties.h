//
//  NewsCategory+CoreDataProperties.h
//  
//
//  Created by Nikolay Shubenkov on 31/10/15.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "NewsCategory.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsCategory (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<NewsArticle *> *news;

@end

@interface NewsCategory (CoreDataGeneratedAccessors)

- (void)addNewsObject:(NewsArticle *)value;
- (void)removeNewsObject:(NewsArticle *)value;
- (void)addNews:(NSSet<NewsArticle *> *)values;
- (void)removeNews:(NSSet<NewsArticle *> *)values;

@end

NS_ASSUME_NONNULL_END
