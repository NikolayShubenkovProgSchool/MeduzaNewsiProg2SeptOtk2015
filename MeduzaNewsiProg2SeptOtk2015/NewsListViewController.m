//
//  NewsListViewController.m
//  MeduzaNewsiProg2SeptOtk2015
//
//  Created by Nikolay Shubenkov on 31/10/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

#import "NewsListViewController.h"

#import <MagicalRecord/MagicalRecord.h>
#import <AFNetworking/AFNetworking.h>

#import "NewsTableViewCell.h"
#import "NewsArticle+CoreDataProperties.h"

#import "NewsAPIManager.h"
#import "StoreManager.h"

@interface NewsListViewController ()

@end

@implementation NewsListViewController

- (NSFetchRequest *)dataRequest {
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"NewsArticle"];

    NSSortDescriptor *sortDesriptor = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO];
    
    request.sortDescriptors = @[sortDesriptor];
    
    return request;
}

- (void)configureCell:(UITableViewCell *)aCell withItem:(NSManagedObject *)item {
    NewsTableViewCell *newsCell = (NewsTableViewCell *) aCell;
    NewsArticle *article        = (NewsArticle *) item;
    
    newsCell.articleLabel.text = article.title;
    newsCell.dateLabel.text    = article.date.description;
}

- (void)viewDidLoad {
    
    self.cellReuseIdentifier = @"NewsID";
    
    [super viewDidLoad];
    [self updateDataForPage:0];
    // Do any additional setup after loading the view.
}

- (void)updateDataForPage:(NSInteger)page {
    [[NewsAPIManager manager] getNewsOfType:@"shapito" page:0 withSuccess:^(id responseObject) {
        StoreManager *manager = [StoreManager new];
        [manager saveNewsArticlesFromJSON:responseObject];
        
    } failure:^(NSError *error) {
        
    }];
}

@end
