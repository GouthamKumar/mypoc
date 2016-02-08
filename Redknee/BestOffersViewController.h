//
//  BestOffersViewController.h
//  Redknee
//
//  Created by Sreekala on 01/02/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PNChartDelegate.h"
#import "PNChart.h"

@interface BestOffersViewController : UIViewController<PNChartDelegate>
@property (weak, nonatomic) IBOutlet UIView *viewRightPieChart;

@property (weak, nonatomic) IBOutlet UIView *viewLeftPieChart;




@property(nonatomic, strong) NSMutableArray *slices;
@property(nonatomic, strong) NSArray        *sliceColors;

@end
