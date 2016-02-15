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
#import "LoginViewController.h"
#import "MFSideMenu.h"
#import "AppDelegate.h"

@interface PopUpViewController ()<YSLContainerViewControllerDelegate>{
    
//    YSLContainerViewController *containerVC;
    NSString *strMessage;
    AppDelegate *appDelegate;
}

@end

@implementation PopUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"REDKNEE";
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    strMessage = [[NSUserDefaults standardUserDefaults] valueForKey:@"selectediMessage"];
    
    self.lblTitle.text = [NSString stringWithFormat:@"%@",strMessage];
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    // Do any additional setup after loading the view.
}

-(void) viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    
    [self addChildViewsWithHeight:192];
    
    [self.view bringSubviewToFront:self.viewAlert];
    [self.view bringSubviewToFront:self.btnMenu];
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

#pragma mark - User Actions

- (IBAction)btnCancelTapped:(id)sender {
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.viewAlert.frame =  CGRectMake(0, 0, 0, 0);
        //        [self.viewAlert removeFromSuperview];
        self.viewAlert.alpha = 0.0;
        
    }];
    
    [appDelegate.containerVC.view removeFromSuperview];
    
    [UIView animateWithDuration:1.0 animations:^{
        
        [self addChildViewsWithHeight:64];
        
    }];
    
    [self.view bringSubviewToFront:self.btnMenu];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:strMessage forKey:@"selectedMessage"];
    [defaults synchronize];
    
    [appDelegate.containerVC scrollMenuViewSelectedIndex:2];
    
}

- (IBAction)btnBuyTapped:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:strMessage forKey:@"selectedMessage"];
    [defaults synchronize];
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.viewAlert.frame =  CGRectMake(0, 0, 0, 0);
        self.viewAlert.alpha = 0.0;
        
    }];
    
    
    [appDelegate.containerVC.view removeFromSuperview];
    
    [UIView animateWithDuration:1.0 animations:^{
        
        [self addChildViewsWithHeight:64];
        
    }];
    
    [self.view bringSubviewToFront:self.btnMenu];
    
    
    [appDelegate.containerVC scrollMenuViewSelectedIndex:1];
    
}

- (IBAction)btnMenuTapped:(id)sender {
    
    UIApplication *myApplication = [UIApplication sharedApplication];
    UIWindow *mainWindow = [myApplication keyWindow];
    MFSideMenuContainerViewController *container  = (MFSideMenuContainerViewController*)[mainWindow rootViewController];
    
    UIViewController *flyoutMenu = [self.storyboard instantiateViewControllerWithIdentifier:@"SideMenuViewController"];
    [container setLeftMenuViewController:flyoutMenu];
    [container setLeftMenuWidth:300.0f];
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}

#pragma mark - Add Childviews

-(void)addChildViewsWithHeight:(float)height{
    
    CurrentPlansViewController *currentPlansVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CurrentPlansViewController"];
    currentPlansVC.title = @"Exclusive";
    
    BestOffersViewController *bestOffersVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BestOffersViewController"];
    bestOffersVC.title = @"Current Plan";
    
    RecommendedPlansViewController *recomendedVC = [self.storyboard instantiateViewControllerWithIdentifier:@"RecommendedPlansViewController"];
    recomendedVC.title = @"Recommended";
    
    // ContainerView
    
    if (appDelegate.containerVC) {
        
        appDelegate.containerVC = nil;
    }
    
    appDelegate.containerVC = [[YSLContainerViewController alloc]initWithControllers:@[currentPlansVC,bestOffersVC,recomendedVC]
                                                            topBarHeight:height
                                                    parentViewController:self];
    appDelegate.containerVC.delegate = self;
    appDelegate.containerVC.menuItemFont = [UIFont fontWithName:@"Futura-Medium" size:14];
    
    [self.view addSubview:appDelegate.containerVC.view];
}

//#pragma mark - Custom Delegates
//
//-(void) scrolltoIndex:(int)flagValue{
//    
//    [appDelegate.containerVC scrollMenuViewSelectedIndex:flagValue];
//}

@end
