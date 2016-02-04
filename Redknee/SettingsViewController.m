//
//  SettingsViewController.m
//  Redknee
//
//  Created by Goutham  S on 2/4/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import "SettingsViewController.h"
#import "MFSideMenu.h"


@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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