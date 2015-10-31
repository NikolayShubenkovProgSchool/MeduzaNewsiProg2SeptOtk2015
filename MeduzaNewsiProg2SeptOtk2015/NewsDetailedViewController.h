//
//  NewsDetailedViewController.h
//  MeduzaNewsiProg2SeptOtk2015
//
//  Created by Nikolay Shubenkov on 31/10/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NewsArticle+CoreDataProperties.h"

@interface NewsDetailedViewController : UIViewController

@property (nonatomic, strong) NewsArticle *article;

@end
