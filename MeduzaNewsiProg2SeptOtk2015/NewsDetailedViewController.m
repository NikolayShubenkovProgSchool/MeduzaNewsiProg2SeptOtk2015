//
//  NewsDetailedViewController.m
//  MeduzaNewsiProg2SeptOtk2015
//
//  Created by Nikolay Shubenkov on 31/10/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

#import "NewsDetailedViewController.h"

@interface NewsDetailedViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation NewsDetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = self.article.title;
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.webView loadHTMLString:self.article.content
                         baseURL:nil];
}



@end
