//
//  RecommendedPlansViewController.m
//  Redknee
//
//  Created by Sreekala on 01/02/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import "RecommendedPlansViewController.h"
#import <AmChartsMobile/AmCharts.h>

@interface RecommendedPlansViewController ()

@end

@implementation RecommendedPlansViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    AmMobileChartView *chartView = [[AmMobileChartView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:chartView];
    
    AmPieChart *pieChart = [[AmPieChart alloc] init];
    pieChart.type = @"pie";
    pieChart.theme = @"none";
    NSMutableArray *dataProvider = [[NSMutableArray alloc] init];
    [dataProvider addObject:@{@"country" : @"Lithuania", @"litres" : @(501.9)}];
    [dataProvider addObject:@{@"country" : @"Czech Republic", @"litres" : @(301.9)}];
    [dataProvider addObject:@{@"country" : @"Ireland", @"litres" : @(201.1)}];
    pieChart.dataProvider = dataProvider;
    
    pieChart.valueField = @"litres";
    pieChart.titleField = @"country";
    
    // NSLog(@"\n%@", [pieChart javascriptRepresentation]);
    [chartView setChart:pieChart];
    [chartView drawChart];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
