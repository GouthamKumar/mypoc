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

- (IBAction)btnWifi_SaveTapped:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textWifi_SSID1.text] forKey:@"wifiSSID1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textWifi_Message1.text] forKey:@"wifiMessage1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textWifi_Promo1.text] forKey:@"wifiPromo1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textWifi_Pack1.text] forKey:@"wifiPack1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textWifi_Voice1.text] forKey:@"wifiVoice1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textWifi_Data1.text] forKey:@"wifiData1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textWifi_Price1.text] forKey:@"wifiPrice1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textWifi_Validity1.text] forKey:@"wifiValidity1"];
    
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textWifi_SSID2.text] forKey:@"wifiSSID2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textWifi_Message2.text] forKey:@"wifiMessage2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textWifi_Promo2.text] forKey:@"wifiPromo2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textWifi_Pack2.text] forKey:@"wifiPack2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textWifi_Voice2.text] forKey:@"wifiVoice2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textWifi_Data2.text] forKey:@"wifiData2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textWifi_Price2.text] forKey:@"wifiPrice2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textWifi_Validity2.text] forKey:@"wifiValidity2"];
    
    [defaults synchronize];
    
    
}

#pragma mark - UItextField Methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return  YES;
}

@end
