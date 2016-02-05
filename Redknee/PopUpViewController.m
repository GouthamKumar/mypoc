//
//  PopUpViewController.m
//  Redknee
//
//  Created by Goutham  S on 2/5/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import "PopUpViewController.h"
#import "YSLContainerViewController.h"
#import "CurrentPlansViewController.h"
#import "BestOffersViewController.h"
#import "RecommendedPlansViewController.h"

@interface PopUpViewController ()<YSLContainerViewControllerDelegate>

@end

@implementation PopUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.lblTitle.text = [NSString stringWithFormat:@"Connected with %@ wifi",self.strWifi_Name];
    
    // Do any additional setup after loading the view.
}

-(void) viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    CurrentPlansViewController *currentPlansVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CurrentPlansViewController"];
    currentPlansVC.title = @"CURRENT PLANS";
    
    BestOffersViewController *bestOffersVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BestOffersViewController"];
    bestOffersVC.title = @"BEST OFFERS";
    
    RecommendedPlansViewController *recomendedVC = [self.storyboard instantiateViewControllerWithIdentifier:@"RecommendedPlansViewController"];
    recomendedVC.title = @"RECOMMENDED PLANS";
    
    // ContainerView
    
    float navigationHeight = 64;
    
    YSLContainerViewController *containerVC = [[YSLContainerViewController alloc]initWithControllers:@[currentPlansVC,bestOffersVC,recomendedVC]
                                                                                        topBarHeight:navigationHeight+128
                                                                                parentViewController:self];
    containerVC.delegate = self;
    containerVC.menuItemFont = [UIFont fontWithName:@"Futura-Medium" size:14];
    
    [self.view addSubview:containerVC.view];
    
    
    [self.view bringSubviewToFront:self.viewAlert];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- YSLContainerViewControllerDelegate
- (void)containerViewItemIndex:(NSInteger)index currentController:(UIViewController *)controller
{
    //    NSLog(@"current Index : %ld",(long)index);
    //    NSLog(@"current controller : %@",controller);
    [controller viewWillAppear:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnCancelTapped:(id)sender {
    
    [self.delegate dismissfromRootView:self];
//    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnBuyTapped:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
