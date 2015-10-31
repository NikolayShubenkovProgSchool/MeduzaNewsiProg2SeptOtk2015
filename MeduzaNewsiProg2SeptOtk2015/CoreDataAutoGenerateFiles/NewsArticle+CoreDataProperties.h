//
//  NewsArticle+CoreDataProperties.h
//  MeduzaNewsiProg2SeptOtk2015
//
//  Created by Nikolay Shubenkov on 31/10/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "NewsArticle.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsArticle (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *content;
@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSNumber *favorite;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *idValue;
@property (nullable, nonatomic, retain) NewsCategory *category;
@property (nullable, nonatomic, retain) NSSet<NewsImage *> *newRelationship;

@end

@interface NewsArticle (CoreDataGeneratedAccessors)

- (void)addNewRelationshipObject:(NewsImage *)value;
- (void)removeNewRelationshipObject:(NewsImage *)value;
- (void)addNewRelationship:(NSSet<NewsImage *> *)values;
- (void)removeNewRelationship:(NSSet<NewsImage *> *)values;

@end

NS_ASSUME_NONNULL_END
