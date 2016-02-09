//
//  RecommendedPlansViewController.h
//  Redknee
//
//  Created by Sreekala on 01/02/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKSTableView.h"

@protocol RecommendedDelegate <NSObject>

-(void) scrolltoIndex:(int)flagValue;

@end

@interface RecommendedPlansViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, weak) id<RecommendedDelegate> delegate;

@end
