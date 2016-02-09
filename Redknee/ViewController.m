//
//  ViewController.m
//  Redknee
//
//  Created by Sreekala on 31/01/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import "ViewController.h"

#import "YSLContainerViewController.h"
#import "CurrentPlansViewController.h"
#import "BestOffersViewController.h"
#import "RecommendedPlansViewController.h"
#import "MFSideMenu.h"
#import "PopUpViewController.h"
#import "AppDelegate.h"

//#import "MTReachabilityManager.h"

@interface ViewController ()<YSLContainerViewControllerDelegate>
{
//    YSLContainerViewController *containerVC;
    
    AppDelegate *appDelegate;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"REDKNEE";
    
//    // Add Observer
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityDidChange:) name:kReachabilityChangedNotification object:nil];
    
    /*
     Observe the kNetworkReachabilityChangedNotification. When that notification is posted, the method reachabilityChanged will be called.
     */
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    CurrentPlansViewController *currentPlansVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CurrentPlansViewController"];
    currentPlansVC.title = @"Exclusive";
    
    BestOffersViewController *bestOffersVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BestOffersViewController"];
    bestOffersVC.title = @"Current Plan";
    
    RecommendedPlansViewController *recomendedVC = [self.storyboard instantiateViewControllerWithIdentifier:@"RecommendedPlansViewController"];
    recomendedVC.title = @"Recommended";
    
    // ContainerView
    float statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    float navigationHeight = self.navigationController.navigationBar.frame.size.height;
    
    if (appDelegate.containerVC) {
        
        appDelegate.containerVC = nil;
    }
    
    appDelegate.containerVC = [[YSLContainerViewController alloc]initWithControllers:@[currentPlansVC,bestOffersVC,recomendedVC]
                                                                                        topBarHeight:statusHeight + navigationHeight
                                                                                parentViewController:self];
    appDelegate.containerVC.delegate = self;
    appDelegate.containerVC.menuItemFont = [UIFont fontWithName:@"Futura-Medium" size:14];
    [self.view addSubview:appDelegate.containerVC.view];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    [[NSUserDefaults standardUserDefaults] setValue:@"no" forKey:@"enableGesture"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

/*
 Exclusive for app users: high speed on demand! 30 minites for just 99 cent - usage countsagainst your data allowance.
 */

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    if (self.scrollIndexFlag != 0) {
        
        [appDelegate.containerVC scrollMenuViewSelectedIndex:self.scrollIndexFlag-1];
    }
    else{
        
        [appDelegate.containerVC scrollMenuViewSelectedIndex:1];
    }
    
    if ([self.strWifiName length]) {
        
        PopUpViewController *popupVc = [self.storyboard instantiateViewControllerWithIdentifier:@"PopUpViewController"];
        popupVc.strWifi_Name = self.strWifiName;
        self.strWifiName = @"";
//        popupVc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//        [self presentViewController:popupVc animated:YES completion:nil];
        [self.navigationController pushViewController:popupVc animated:YES];
    }
    
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

- (void)scrollMenuViewSelectedIndex:(NSInteger)index{
    
}



#pragma mark - Custom Methods

-(void)showAlertViewTitle:(NSString *)title andMessage:(NSString *)message andTag:(int)tagVal{
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    [controller addAction:okAction];
    [self presentViewController:controller animated:YES completion:nil];
}

#pragma mark - User Actions

- (IBAction)btnMenuTapped:(id)sender {
    
    UIApplication *myApplication = [UIApplication sharedApplication];
    UIWindow *mainWindow = [myApplication keyWindow];
    MFSideMenuContainerViewController *container  = (MFSideMenuContainerViewController*)[mainWindow rootViewController];
    
    UIViewController *flyoutMenu = [self.storyboard instantiateViewControllerWithIdentifier:@"SideMenuViewController"];
    [container setLeftMenuViewController:flyoutMenu];
    [container setLeftMenuWidth:300.0f];
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
    
}

@end
