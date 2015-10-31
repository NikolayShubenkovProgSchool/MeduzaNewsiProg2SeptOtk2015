//
//  NewsImage+CoreDataProperties.h
//  MeduzaNewsiProg2SeptOtk2015
//
//  Created by Nikolay Shubenkov on 31/10/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "NewsImage.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsImage (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *url;
@property (nullable, nonatomic, retain) NewsArticle *newRelationship;

@end

NS_ASSUME_NONNULL_END
