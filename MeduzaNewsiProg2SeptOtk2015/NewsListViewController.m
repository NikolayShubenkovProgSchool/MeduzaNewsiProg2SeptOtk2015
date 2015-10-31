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
#import "NewsAPIManager.h"

@interface NewsListViewController ()

@end

@implementation NewsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateDataForPage:0];
    // Do any additional setup after loading the view.
}

- (void)updateDataForPage:(NSInteger)page {
    [[NewsAPIManager manager] getNewsOfType:@"shapito" page:0];
}

@end
