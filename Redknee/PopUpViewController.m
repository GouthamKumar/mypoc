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

@interface PopUpViewController ()<YSLContainerViewControllerDelegate>{
    
    YSLContainerViewController *containerVC;
    NSString *strMessage;
}

@end

@implementation PopUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"REDKNEE";
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    strMessage = [[NSUserDefaults standardUserDefaults] valueForKey:@"selectedMessage"];
    
    self.lblTitle.text = [NSString stringWithFormat:@"%@",strMessage];
    
    
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
    
    
    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"Recommended" ofType:@"plist"];
    NSArray *arr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *strDestPath = [NSString stringWithFormat:@"%@/Recommended.plist",[arr objectAtIndex:0]];
    
    
    NSString *strSSID1 = [[NSUserDefaults standardUserDefaults] valueForKey:@"wifiMessage1"];
    NSString *strSSID2 = [[NSUserDefaults standardUserDefaults] valueForKey:@"wifiMessage2"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:strDestPath]) {
        
        [fileManager copyItemAtPath:strPath toPath:strDestPath error:nil];
    }
    
    if ([strSSID1 isEqualToString:strMessage]) {
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *strPack = [defaults valueForKey:@"wifiPack1"];
        NSString *strVoice = [defaults valueForKey:@"wifiVoice1"];
        NSString *strData = [defaults valueForKey:@"wifiData1"];
        NSString *strPrice = [defaults valueForKey:@"wifiPrice1"];
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:strDestPath];
        
        [dict removeObjectForKey:@"wifiDetails1"];
        
        [dict setValue:strPack forKey:@"pack"];
        [dict setValue:strVoice forKey:@"voice"];
        [dict setValue:strData forKey:@"data"];
        [dict setValue:strPrice forKey:@"price"];
        
        
        NSDictionary *dictnry = [NSDictionary dictionaryWithObjectsAndKeys:dict,@"wifiDetails1", nil];
        
        [dictnry writeToFile:strDestPath atomically:YES];
    }
    
    else if ([strSSID2 isEqualToString:strMessage]){
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *strPack = [defaults valueForKey:@"wifiPack2"];
        NSString *strVoice = [defaults valueForKey:@"wifiVoice2"];
        NSString *strData = [defaults valueForKey:@"wifiData2"];
        NSString *strPrice = [defaults valueForKey:@"wifiPrice2"];
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:strDestPath];
        
        [dict removeObjectForKey:@"wifiDetails2"];
        
        
        [dict setValue:strPack forKey:@"pack"];
        [dict setValue:strVoice forKey:@"voice"];
        [dict setValue:strData forKey:@"data"];
        [dict setValue:strPrice forKey:@"price"];
        
        
        NSDictionary *dictnry = [NSDictionary dictionaryWithObjectsAndKeys:dict,@"wifiDetails2", nil];
        
        [dictnry writeToFile:strDestPath atomically:YES];
    }
    
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.viewAlert.frame =  CGRectMake(0, 0, 0, 0);
        //        [self.viewAlert removeFromSuperview];
        self.viewAlert.alpha = 0.0;
        
    }];
    
    [containerVC.view removeFromSuperview];
    
    [UIView animateWithDuration:1.0 animations:^{
        
        [self addChildViewsWithHeight:64];
        
    }];
    
    [self.view bringSubviewToFront:self.btnMenu];
    
    [containerVC scrollMenuViewSelectedIndex:2];
    
}

- (IBAction)btnBuyTapped:(id)sender {
    
    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"BestOffer" ofType:@"plist"];
    NSArray *arr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *strDestPath = [NSString stringWithFormat:@"%@/BestOffer.plist",[arr objectAtIndex:0]];
    
    
    NSString *strSSID1 = [[NSUserDefaults standardUserDefaults] valueForKey:@"wifiMessage1"];
    NSString *strSSID2 = [[NSUserDefaults standardUserDefaults] valueForKey:@"wifiMessage2"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:strDestPath]) {
        
        [fileManager copyItemAtPath:strPath toPath:strDestPath error:nil];
    }
    
    if ([strSSID1 isEqualToString:strMessage]) {
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *strPack = [defaults valueForKey:@"wifiPack1"];
        NSString *strVoice = [defaults valueForKey:@"wifiVoice1"];
        NSString *strData = [defaults valueForKey:@"wifiData1"];
        NSString *strPrice = [defaults valueForKey:@"wifiPrice1"];
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:strDestPath];
        
        [dict removeObjectForKey:@"wifiDetails1"];
        
        [dict setValue:strPack forKey:@"pack"];
        [dict setValue:strVoice forKey:@"voice"];
        [dict setValue:strData forKey:@"data"];
        [dict setValue:strPrice forKey:@"price"];
        
        
        NSDictionary *dictnry = [NSDictionary dictionaryWithObjectsAndKeys:dict,@"wifiDetails1", nil];
        
        [dictnry writeToFile:strDestPath atomically:YES];
    }
    
    else if ([strSSID2 isEqualToString:strMessage]){
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *strPack = [defaults valueForKey:@"wifiPack2"];
        NSString *strVoice = [defaults valueForKey:@"wifiVoice2"];
        NSString *strData = [defaults valueForKey:@"wifiData2"];
        NSString *strPrice = [defaults valueForKey:@"wifiPrice2"];
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:strDestPath];
        
        [dict removeObjectForKey:@"wifiDetails2"];
        
        
        [dict setValue:strPack forKey:@"pack"];
        [dict setValue:strVoice forKey:@"voice"];
        [dict setValue:strData forKey:@"data"];
        [dict setValue:strPrice forKey:@"price"];
        
        
        NSDictionary *dictnry = [NSDictionary dictionaryWithObjectsAndKeys:dict,@"wifiDetails2", nil];
        
        [dictnry writeToFile:strDestPath atomically:YES];
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.viewAlert.frame =  CGRectMake(0, 0, 0, 0);
//        [self.viewAlert removeFromSuperview];
        self.viewAlert.alpha = 0.0;
        
    }];
    
    
    [containerVC.view removeFromSuperview];
    
    [UIView animateWithDuration:1.0 animations:^{
        
        [self addChildViewsWithHeight:64];
        
    }];
    
    [self.view bringSubviewToFront:self.btnMenu];
    
    
    [containerVC scrollMenuViewSelectedIndex:1];
    
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
    currentPlansVC.title = @"CURRENT PLANS";
    
    BestOffersViewController *bestOffersVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BestOffersViewController"];
    bestOffersVC.title = @"BEST OFFERS";
    
    RecommendedPlansViewController *recomendedVC = [self.storyboard instantiateViewControllerWithIdentifier:@"RecommendedPlansViewController"];
    recomendedVC.title = @"RECOMMENDED PLANS";
    
    // ContainerView
    
    containerVC = [[YSLContainerViewController alloc]initWithControllers:@[currentPlansVC,bestOffersVC,recomendedVC]
                                                            topBarHeight:height
                                                    parentViewController:self];
    containerVC.delegate = self;
    containerVC.menuItemFont = [UIFont fontWithName:@"Futura-Medium" size:14];
    
    [self.view addSubview:containerVC.view];
}

@end
