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

#import "NewsDetailedViewController.h"

#import "NewsAPIManager.h"
#import "StoreManager.h"

@interface NewsListViewController ()

@property (nonatomic) NSInteger nextPageToLoad;

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
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"dd, MMMM";
    
    newsCell.dateLabel.text    = [formatter stringFromDate:article.date];
}

- (void)viewDidLoad {
    
    self.cellReuseIdentifier = @"NewsID";
    
    [super viewDidLoad];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    
    [self updateDataForPage:self.nextPageToLoad];
    // Do any additional setup after loading the view.
}

- (void)updateDataForPage:(NSInteger)page {
    [[NewsAPIManager manager] getNewsOfType:@"shapito" page:page withSuccess:^(id responseObject) {
        StoreManager *manager = [StoreManager new];
        [manager saveNewsArticlesFromJSON:responseObject];
        self.nextPageToLoad = self.nextPageToLoad + 1;
    } failure:^(NSError *error) {
        
    }];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger currentElementsCount = [tableView numberOfRowsInSection:0];
    NSInteger currentObjectIndex = indexPath.row;
    
    if (currentElementsCount - currentObjectIndex == 5){
        [self updateDataForPage:self.nextPageToLoad];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsArticle *article = (NewsArticle *)[self itemAtIndexPath:indexPath];
    //Если конента нет, то скачаем его
    if (article.content == nil){
        [[NewsAPIManager manager]getNewsDetailesByPath:article.idValue
                                           withSuccess:^(id responseObject) {
                                               StoreManager *manager = [StoreManager new];
                                               [manager updateNewsArticleDetailesFromJSON:responseObject];
                                               [self presentNewsArticle:article];
                                           }
                                               failure:nil];
        return;
    }
    [self presentNewsArticle:article];
}

- (void)presentNewsArticle:(NewsArticle *)article {
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [article.managedObjectContext refreshAllObjects];
        [self performSegueWithIdentifier:@"Show Article"
                                  sender:article];
//    });

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[NewsDetailedViewController class]]){
        NewsDetailedViewController *vc = segue.destinationViewController;
        vc.article = sender;
    }
}

@end
