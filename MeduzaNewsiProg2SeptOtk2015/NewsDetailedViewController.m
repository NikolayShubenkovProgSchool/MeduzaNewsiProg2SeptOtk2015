//
//  NewsDetailedViewController.m
//  MeduzaNewsiProg2SeptOtk2015
//
//  Created by Nikolay Shubenkov on 31/10/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

#import "NewsDetailedViewController.h"

#import "NewsImage+CoreDataProperties.h"

#import <AFNetworking/UIImageView+AFNetworking.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface NewsDetailedViewController () <UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic,strong) NSArray *images;

@end

@implementation NewsDetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = self.article.title;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.images = [self.article.newRelationship allObjects];

    
    self.collectionView.dataSource = self;
    
    [self.collectionView reloadData];
    
    [self.webView loadHTMLString:self.article.content
                         baseURL:nil];
}

#pragma mark - UICollectionView DataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageID" forIndexPath:indexPath];
    
    UIImageView *imageView = [cell.contentView viewWithTag:40];
    
    NewsImage *image = self.images[indexPath.row];
    
    NSString *url = image.url;
    
    NSLog(@"url: %@",url);

//    [imageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]
//                     placeholderImage:nil
//                              success:nil
//                              failure:nil];
//
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil options:SDWebImageProgressiveDownload];
    return cell;
}




@end
