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

//#import "MTReachabilityManager.h"

@interface ViewController ()<YSLContainerViewControllerDelegate>
{
    
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
    
    CurrentPlansViewController *currentPlansVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CurrentPlansViewController"];
    currentPlansVC.title = @"CURRENT PLANS";
    
    BestOffersViewController *bestOffersVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BestOffersViewController"];
    bestOffersVC.title = @"BEST OFFERS";
    
    RecommendedPlansViewController *recomendedVC = [self.storyboard instantiateViewControllerWithIdentifier:@"RecommendedPlansViewController"];
    recomendedVC.title = @"RECOMMENDED PLANS";
    
    // ContainerView
    float statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    float navigationHeight = self.navigationController.navigationBar.frame.size.height;
    
    YSLContainerViewController *containerVC = [[YSLContainerViewController alloc]initWithControllers:@[currentPlansVC,bestOffersVC,recomendedVC]
                                                                                        topBarHeight:statusHeight + navigationHeight
                                                                                parentViewController:self];
    containerVC.delegate = self;
    containerVC.menuItemFont = [UIFont fontWithName:@"Futura-Medium" size:14];
    
    [self.view addSubview:containerVC.view];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
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

/*
#pragma mark -
#pragma mark Notification Handling
- (void)reachabilityDidChange:(NSNotification *)notification {
    Reachability *reachability = (Reachability *)[notification object];
    
    if ([reachability isReachable]) {
        NSLog(@"Reachable");
        
        if ([MTReachabilityManager isReachableViaWiFi]) {
            
            UILocalNotification* localNotification = [[UILocalNotification alloc] init];
            
            localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:3];
            
            localNotification.alertBody = @"Wifi Available";
            
            localNotification.timeZone = [NSTimeZone defaultTimeZone];
            
            localNotification.soundName = UILocalNotificationDefaultSoundName; // den den den
            
            //localNotification.soundName = @"sound.caf";
            
            [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
            
            // Request to reload table view data
            [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadData" object:self];
        }
        else if([MTReachabilityManager isReachableViaWWAN]){
            
            UILocalNotification* localNotification = [[UILocalNotification alloc] init];
            
            localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:3];
            
            localNotification.alertBody = @"3G/2G Available";
            
            localNotification.timeZone = [NSTimeZone defaultTimeZone];
            
            localNotification.soundName = UILocalNotificationDefaultSoundName; // den den den
            
            //localNotification.soundName = @"sound.caf";
            
            [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
            
            // Request to reload table view data
            [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadData" object:self];
        }
        
    } else {
        NSLog(@"Unreachable");
        UILocalNotification* localNotification = [[UILocalNotification alloc] init];
        
        localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:3];
        
        localNotification.alertBody = @"Jaffa no";
        
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        
        localNotification.soundName = UILocalNotificationDefaultSoundName; // den den den
        
        //localNotification.soundName = @"sound.caf";
        
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
        
        
        // Request to reload table view data
        [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadData" object:self];
    }
}
*/




#pragma mark - Custom Methods

-(void)showAlertViewTitle:(NSString *)title andMessage:(NSString *)message andTag:(int)tagVal{
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    [controller addAction:okAction];
    
    
    
    [self presentViewController:controller animated:YES completion:nil];
    
}


/*
 
 
 
 ServicesViewController *serviceViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ServicesViewController"];
 UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
 NSArray *controllers = [NSArray arrayWithObject:serviceViewController];
 navigationController.viewControllers = controllers;
 [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
 
 hsejar@271968
 
 */

#pragma mark - User Actions

- (IBAction)btnMenuTapped:(id)sender {
    
    UIApplication *myApplication = [UIApplication sharedApplication];
    UIWindow *mainWindow = [myApplication keyWindow];
    MFSideMenuContainerViewController *container  = (MFSideMenuContainerViewController*)[mainWindow rootViewController];
    
    UIViewController *flyoutMenu = [self.storyboard instantiateViewControllerWithIdentifier:@"SideMenuViewController"];
    [container setLeftMenuViewController:flyoutMenu];
    [container setLeftMenuWidth:200.0f];
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
    
}
@end
