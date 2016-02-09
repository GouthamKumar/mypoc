//
//  ShopCartViewController.m
//  Redknee
//
//  Created by Goutham  S on 2/9/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import "ShopCartViewController.h"
#import "MyAddOnsViewController.h"
#import "AvailableAddOnsViewController.h"
#import "AppDelegate.h"
#import "YSLContainerViewController.h"
#import "MFSideMenu.h"


@interface ShopCartViewController ()<YSLContainerViewControllerDelegate>{
    
    AppDelegate *appDelegate;
    
    
}

@end

@implementation ShopCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    MyAddOnsViewController *myAddOnsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MyAddOnsViewController"];
    myAddOnsVC.title = @"My Add-ons";
    
    AvailableAddOnsViewController *availableAddOnsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"AvailableAddOnsViewController"];
    availableAddOnsVC.title = @"Available Add-ons";
    
    // ContainerView
    float statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    float navigationHeight = self.navigationController.navigationBar.frame.size.height;
    
    if (appDelegate.containerVC) {
        
        appDelegate.containerVC = nil;
    }
    
    appDelegate.containerVC = [[YSLContainerViewController alloc]initWithControllers:@[myAddOnsVC,availableAddOnsVC]
                                                                        topBarHeight:statusHeight + navigationHeight
                                                                parentViewController:self];
    appDelegate.containerVC.delegate = self;
    appDelegate.containerVC.menuItemFont = [UIFont fontWithName:@"Futura-Medium" size:14];
    [self.view addSubview:appDelegate.containerVC.view];
    
    // Do any additional setup after loading the view.
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

#pragma mark -- YSLContainerViewControllerDelegate
- (void)containerViewItemIndex:(NSInteger)index currentController:(UIViewController *)controller
{
    //    NSLog(@"current Index : %ld",(long)index);
    //    NSLog(@"current controller : %@",controller);
    [controller viewWillAppear:YES];
}

- (void)scrollMenuViewSelectedIndex:(NSInteger)index{
    
}

#pragma mark -- User Actions

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
