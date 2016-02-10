//
//  SettingsViewController.m
//  Redknee
//
//  Created by Goutham  S on 2/4/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import "SettingsViewController.h"
#import "MFSideMenu.h"
#import "MBProgressHUD.h"


@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void) viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self validateScreen];
    
    self.title = @"Settings";
    
    self.btnDataSave.layer.masksToBounds = YES;
    self.btnDataSave.layer.cornerRadius = 8.0;
    
    self.btnLocationSave.layer.masksToBounds = YES;
    self.btnLocationSave.layer.cornerRadius = 8.0;
    
    self.btnShakeSave.layer.masksToBounds = YES;
    self.btnShakeSave.layer.cornerRadius = 8.0;
    
    self.btnSimSave.layer.masksToBounds = YES;
    self.btnSimSave.layer.cornerRadius = 8.0;
    
    self.btnWifiSave.layer.masksToBounds = YES;
    self.btnWifiSave.layer.cornerRadius = 8.0;
    
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
    
    
    [self showToast:@"Saved Successfully"];
    
}

- (IBAction)btnSim_SaveTapped:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textSim_OwnOperator.text] forKey:@"simOwnOperator"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textSim_Operator1.text] forKey:@"simOperator1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textSim_Message1.text] forKey:@"simMessage1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textSim_Promo1.text] forKey:@"simPromo1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textSim_Pack1.text] forKey:@"simPack1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textSim_Voice1.text] forKey:@"simVoice1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textSim_Data1.text] forKey:@"simData1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textSim_Price1.text] forKey:@"simPrice1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textSim_Validity1.text] forKey:@"simValidity1"];
    
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textSim_Operator2.text] forKey:@"simOperator2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textSim_Message2.text] forKey:@"simMessage2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textSim_Promo2.text] forKey:@"simPromo2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textSim_Pack2.text] forKey:@"simPack2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textSim_Voice2.text] forKey:@"simVoice2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textSim_Data2.text] forKey:@"simData2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textSim_Price2.text] forKey:@"simPrice2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textSim_Validity2.text] forKey:@"simValidity2"];
    
    [defaults synchronize];
    
    [self showToast:@"Saved Successfully"];
    
}

- (IBAction)btnData_SaveTapped:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textData_Threshold1.text] forKey:@"dataThreshold1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textData_Message1.text] forKey:@"dataMessage1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textData_Promo1.text] forKey:@"dataPromo1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textData_Pack1.text] forKey:@"dataPack1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textData_Voice1.text] forKey:@"dataVoice1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textData_Data1.text] forKey:@"dataData1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textData_Price1.text] forKey:@"dataPrice1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textData_Validity1.text] forKey:@"dataValidity1"];
    
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textData_Threshold2.text] forKey:@"dataThreshold2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textData_Message2.text] forKey:@"dataMessage2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textData_Promo2.text] forKey:@"dataPromo2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textData_Pack2.text] forKey:@"dataPack2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textData_Voice2.text] forKey:@"dataVoice2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textData_Data2.text] forKey:@"dataData2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textData_Price2.text] forKey:@"dataPrice2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textData_Validity2.text] forKey:@"dataValidity2"];
    
    [defaults synchronize];
    
    [self showToast:@"Saved Successfully"];
}

- (IBAction)btnLocation_SaveTapped:(id)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textLocation_Range.text] forKey:@"locationRange"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textLocation_Latitude1.text] forKey:@"locationLatitude1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textLocation_longitude1.text] forKey:@"locationLongitude1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textLocation_Message1.text] forKey:@"locationMessage1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textLocation_Promo1.text] forKey:@"locationPromo1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textLocation_Pack1.text] forKey:@"locationPack1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textLocation_Voice1.text] forKey:@"locationVoice1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textLocation_Data1.text] forKey:@"locationData1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textLocation_Price1.text] forKey:@"locationPrice1"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textLocation_Validity1.text] forKey:@"locationValidity1"];
    
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textLocation_Latitude2.text] forKey:@"locationLatitude2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textLocation_longitude2.text] forKey:@"locationLongitude2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textLocation_Message2.text] forKey:@"locationMessage2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textLocation_Promo2.text] forKey:@"locationPromo2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textLocation_Pack2.text] forKey:@"locationPack2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textLocation_Voice2.text] forKey:@"locationVoice2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textLocation_Data2.text] forKey:@"locationData2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textLocation_Price2.text] forKey:@"locationPrice2"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textLocation_Validity2.text] forKey:@"locationValidity2"];
    
    [defaults synchronize];
    
    [self showToast:@"Saved Successfully"];
}

- (IBAction)btnShake_SaveTapped:(id)sender {
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textShake_Message2.text] forKey:@"shakeMessage"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textShake_Promo2.text] forKey:@"shakePromo"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textShake_Pack2.text] forKey:@"shakePack"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textShake_Voice2.text] forKey:@"shakeVoice"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textShake_Data2.text] forKey:@"shakeData"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textShake_Price2.text] forKey:@"shakePrice"];
    [defaults setValue:[NSString stringWithFormat:@"%@",self.textShake_Validity2.text] forKey:@"shakeValidity"];
    
    [defaults synchronize];
    
    [self showToast:@"Saved Successfully"];
    
}

#pragma mark - UItextField Methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return  YES;
}

#pragma mark - Validate Data

-(void)validateScreen{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *strWifiSSID1 = [defaults valueForKey:@"wifiSSID1"];
    if ([self validString:strWifiSSID1]) {
        
        self.textWifi_SSID1.text = strWifiSSID1;
    }
    NSString *strWifi_Msg1 = [defaults valueForKey:@"wifiMessage1"];
    if ([self validString:strWifi_Msg1]) {
        
        self.textWifi_Message1.text = strWifi_Msg1;
    }
    NSString *strWifi_Promo1 = [defaults valueForKey:@"wifiPromo1"];
    if ([self validString:strWifi_Promo1]) {
        
        self.textWifi_Promo1.text = strWifi_Promo1;
    }
    NSString *strWifi_Pack1 = [defaults valueForKey:@"wifiPack1"];
    if ([self validString:strWifi_Pack1]) {
        
        self.textWifi_Pack1.text = strWifi_Pack1;
    }
    NSString *strWifi_Voice1 = [defaults valueForKey:@"wifiVoice1"];
    if ([self validString:strWifi_Voice1]) {
        
        self.textWifi_Voice1.text = strWifi_Voice1;
    }
    NSString *strWifi_Data1 = [defaults valueForKey:@"wifiData1"];
    if ([self validString:strWifi_Data1]) {
        
        self.textWifi_Data1.text = strWifi_Data1;
    }
    NSString *strWifi_Price1 = [defaults valueForKey:@"wifiPrice1"];
    if ([self validString:strWifi_Price1]) {
        
        self.textWifi_Price1.text = strWifi_Price1;
    }
    NSString *strWifi_Validity1 = [defaults valueForKey:@"wifiValidity1"];
    if ([self validString:strWifi_Validity1]) {
        
        self.textWifi_Validity1.text = strWifi_Validity1;
    }
    
    NSString *strWifiSSID2 = [defaults valueForKey:@"wifiSSID2"];
    if ([self validString:strWifiSSID2]) {
        
        self.textWifi_SSID2.text = strWifiSSID2;
    }
    NSString *strWifi_Msg2 = [defaults valueForKey:@"wifiMessage2"];
    if ([self validString:strWifi_Msg2]) {
        
        self.textWifi_Message2.text = strWifi_Msg2;
    }
    NSString *strWifi_Promo2 = [defaults valueForKey:@"wifiPromo2"];
    if ([self validString:strWifi_Promo2]) {
        
        self.textWifi_Promo2.text = strWifi_Promo2;
    }
    NSString *strWifi_Pack2 = [defaults valueForKey:@"wifiPack2"];
    if ([self validString:strWifi_Pack2]) {
        
        self.textWifi_Pack2.text = strWifi_Pack2;
    }
    NSString *strWifi_Voice2 = [defaults valueForKey:@"wifiVoice2"];
    if ([self validString:strWifi_Voice2]) {
        
        self.textWifi_Voice2.text = strWifi_Voice2;
    }
    NSString *strWifi_Data2 = [defaults valueForKey:@"wifiData2"];
    if ([self validString:strWifi_Data2]) {
        
        self.textWifi_Data2.text = strWifi_Data2;
    }
    NSString *strWifi_Price2 = [defaults valueForKey:@"wifiPrice2"];
    if ([self validString:strWifi_Price2]) {
        
        self.textWifi_Price2.text = strWifi_Price2;
    }
    NSString *strWifi_Validity2 = [defaults valueForKey:@"wifiValidity2"];
    if ([self validString:strWifi_Validity2]) {
        
        self.textWifi_Validity2.text = strWifi_Validity2;
    }
    
    NSString *strSim_OwnOperator = [defaults valueForKey:@"simOwnOperator"];
    if ([self validString:strSim_OwnOperator]) {
        
        self.textSim_OwnOperator.text = strSim_OwnOperator;
    }
    NSString *strSim_Operator1 = [defaults valueForKey:@"simOperator1"];
    if ([self validString:strSim_Operator1]) {
        
        self.textSim_Operator1.text = strSim_Operator1;
    }
    NSString *strSim_Msg1 = [defaults valueForKey:@"simMessage1"];
    if ([self validString:strSim_Msg1]) {
        
        self.textSim_Message1.text = strSim_Msg1;
    }
    NSString *strSim_Promo1 = [defaults valueForKey:@"simPromo1"];
    if ([self validString:strSim_Promo1]) {
        
        self.textSim_Promo1.text = strSim_Promo1;
    }
    NSString *strSim_Pack1 = [defaults valueForKey:@"simPack1"];
    if ([self validString:strSim_Pack1]) {
        
        self.textSim_Pack1.text = strSim_Pack1;
    }
    NSString *strSim_Voice1 = [defaults valueForKey:@"simVoice1"];
    if ([self validString:strSim_Voice1]) {
        
        self.textSim_Voice1.text = strSim_Voice1;
    }
    NSString *strSim_Data1 = [defaults valueForKey:@"simData1"];
    if ([self validString:strSim_Data1]) {
        
        self.textSim_Data1.text = strSim_Data1;
    }
    NSString *strSim_Price1 = [defaults valueForKey:@"simPrice1"];
    if ([self validString:strSim_Price1]) {
        
        self.textSim_Price1.text = strSim_Price1;
    }
    NSString *strSim_Validity1 = [defaults valueForKey:@"simValidity1"];
    if ([self validString:strSim_Validity1]) {
        
        self.textSim_Validity1.text = strSim_Validity1;
    }
    
    
    NSString *strSim_Operator2 = [defaults valueForKey:@"simOperator2"];
    if ([self validString:strSim_Operator2]) {
        
        self.textSim_Operator2.text = strSim_Operator2;
    }
    NSString *strSim_Msg2 = [defaults valueForKey:@"simMessage2"];
    if ([self validString:strSim_Msg2]) {
        
        self.textSim_Message2.text = strSim_Msg2;
    }
    NSString *strSim_Promo2 = [defaults valueForKey:@"simPromo2"];
    if ([self validString:strSim_Promo2]) {
        
        self.textSim_Promo2.text = strSim_Promo2;
    }
    NSString *strSim_Pack2 = [defaults valueForKey:@"simPack2"];
    if ([self validString:strSim_Pack1]) {
        
        self.textSim_Pack2.text = strSim_Pack2;
    }
    NSString *strSim_Voice2 = [defaults valueForKey:@"simVoice2"];
    if ([self validString:strSim_Voice2]) {
        
        self.textSim_Voice2.text = strSim_Voice2;
    }
    NSString *strSim_Data2 = [defaults valueForKey:@"simData2"];
    if ([self validString:strSim_Data2]) {
        
        self.textSim_Data2.text = strSim_Data2;
    }
    NSString *strSim_Price2 = [defaults valueForKey:@"simPrice2"];
    if ([self validString:strSim_Price2]) {
        
        self.textSim_Price2.text = strSim_Price2;
    }
    NSString *strSim_Validity2 = [defaults valueForKey:@"simValidity2"];
    if ([self validString:strSim_Validity2]) {
        
        self.textSim_Validity2.text = strSim_Validity2;
    }
    
    NSString *strData_Threshold1 = [defaults valueForKey:@"dataThreshold1"];
    if ([self validString:strData_Threshold1]) {
        
        self.textData_Threshold1.text = strData_Threshold1;
    }
    NSString *strData_Msg1 = [defaults valueForKey:@"dataMessage1"];
    if ([self validString:strData_Msg1]) {
        
        self.textData_Message1.text = strSim_Msg1;
    }
    NSString *strData_Promo1 = [defaults valueForKey:@"dataPromo1"];
    if ([self validString:strData_Promo1]) {
        
        self.textData_Promo1.text = strData_Promo1;
    }
    NSString *strData_Pack1 = [defaults valueForKey:@"dataPack1"];
    if ([self validString:strData_Pack1]) {
        
        self.textData_Pack1.text = strData_Pack1;
    }
    NSString *strData_Voice1 = [defaults valueForKey:@"dataVoice1"];
    if ([self validString:strData_Voice1]) {
        
        self.textData_Voice1.text = strData_Voice1;
    }
    NSString *strData_Data1 = [defaults valueForKey:@"DataData1"];
    if ([self validString:strData_Data1]) {
        
        self.textData_Data1.text = strData_Data1;
    }
    NSString *strData_Price1 = [defaults valueForKey:@"dataPrice1"];
    if ([self validString:strData_Price1]) {
        
        self.textData_Price1.text = strData_Price1;
    }
    NSString *strData_Validity1 = [defaults valueForKey:@"dataValidity1"];
    if ([self validString:strData_Validity1]) {
        
        self.textData_Validity1.text = strData_Validity1;
    }
    NSString *strData_Threshold2 = [defaults valueForKey:@"dataThreshold2"];
    if ([self validString:strData_Threshold2]) {
        
        self.textData_Threshold2.text = strData_Threshold2;
    }
    NSString *strData_Msg2 = [defaults valueForKey:@"dataMessage2"];
    if ([self validString:strData_Msg2]) {
        
        self.textData_Message2.text = strSim_Msg2;
    }
    NSString *strData_Promo2 = [defaults valueForKey:@"dataPromo2"];
    if ([self validString:strData_Promo2]) {
        
        self.textData_Promo2.text = strData_Promo2;
    }
    NSString *strData_Pack2 = [defaults valueForKey:@"dataPack2"];
    if ([self validString:strData_Pack1]) {
        
        self.textData_Pack2.text = strData_Pack2;
    }
    NSString *strData_Voice2 = [defaults valueForKey:@"dataVoice2"];
    if ([self validString:strData_Voice2]) {
        
        self.textData_Voice2.text = strData_Voice2;
    }
    NSString *strData_Data2 = [defaults valueForKey:@"DataData2"];
    if ([self validString:strData_Data2]) {
        
        self.textData_Data2.text = strData_Data2;
    }
    NSString *strData_Price2 = [defaults valueForKey:@"dataPrice2"];
    if ([self validString:strData_Price2]) {
        
        self.textData_Price2.text = strData_Price2;
    }
    NSString *strData_Validity2 = [defaults valueForKey:@"dataValidity2"];
    if ([self validString:strData_Validity2]) {
        
        self.textData_Validity2.text = strData_Validity2;
    }
    
    NSString *strLoication_Range = [defaults valueForKey:@"locationRange"];
    if ([self validString:strLoication_Range]) {
        
        self.textLocation_Range.text = strLoication_Range;
    }
    NSString *strLat1 = [defaults valueForKey:@"locationLatitude1"];
    if ([self validString:strLat1]) {
        
        self.textLocation_Latitude1.text = strLat1;
    }
    NSString *strLong1 = [defaults valueForKey:@"locationLongitude1"];
    if ([self validString:strLong1]) {
        
        self.textLocation_longitude1.text = strLong1;
    }
    NSString *strMsg1 = [defaults valueForKey:@"locationMessage1"];
    if ([self validString:strMsg1]) {
        
        self.textLocation_Message1.text = strMsg1;
    }
    NSString *strLoc_Promo1 = [defaults valueForKey:@"locationPromo1"];
    if ([self validString:strLoc_Promo1]) {
        
        self.textSim_Promo1.text = strLoc_Promo1;
    }
    NSString *strLoc_Pack1 = [defaults valueForKey:@"locationPack1"];
    if ([self validString:strLoc_Pack1]) {
        
        self.textLocation_Pack1.text = strLoc_Pack1;
    }
    NSString *strLoc_Voice1 = [defaults valueForKey:@"locationVoice1"];
    if ([self validString:strLoc_Voice1]) {
        
        self.textLocation_Voice1.text = strLoc_Voice1;
    }
    NSString *strLoc_Data1 = [defaults valueForKey:@"locationData1"];
    if ([self validString:strLoc_Data1]) {
        
        self.textLocation_Data1.text = strLoc_Data1;
    }
    NSString *strLoc_Price1 = [defaults valueForKey:@"locationPrice1"];
    if ([self validString:strLoc_Price1]) {
        
        self.textLocation_Price1.text = strSim_Price1;
    }
    NSString *strLoc_Validity1 = [defaults valueForKey:@"locationValidity1"];
    if ([self validString:strLoc_Validity1]) {
        
        self.textLocation_Validity1.text = strLoc_Validity1;
    }
    
    NSString *strLat2 = [defaults valueForKey:@"locationLatitude2"];
    if ([self validString:strLat2]) {
        
        self.textLocation_Latitude2.text = strLat2;
    }
    NSString *strLong2 = [defaults valueForKey:@"locationLongitude2"];
    if ([self validString:strLong2]) {
        
        self.textLocation_longitude2.text = strLong2;
    }
    NSString *strMsg2 = [defaults valueForKey:@"locationMessage2"];
    if ([self validString:strMsg2]) {
        
        self.textLocation_Message2.text = strMsg2;
    }
    NSString *strLoc_Promo2 = [defaults valueForKey:@"locationPromo2"];
    if ([self validString:strLoc_Promo1]) {
        
        self.textSim_Promo2.text = strLoc_Promo2;
    }
    NSString *strLoc_Pack2 = [defaults valueForKey:@"locationPack2"];
    if ([self validString:strLoc_Pack1]) {
        
        self.textLocation_Pack2.text = strLoc_Pack2;
    }
    NSString *strLoc_Voice2 = [defaults valueForKey:@"locationVoice2"];
    if ([self validString:strLoc_Voice2]) {
        
        self.textLocation_Voice2.text = strLoc_Voice2;
    }
    NSString *strLoc_Data2 = [defaults valueForKey:@"locationData2"];
    if ([self validString:strLoc_Data1]) {
        
        self.textLocation_Data2.text = strLoc_Data2;
    }
    NSString *strLoc_Price2 = [defaults valueForKey:@"locationPrice2"];
    if ([self validString:strLoc_Price2]) {
        
        self.textLocation_Price2.text = strSim_Price2;
    }
    NSString *strLoc_Validity2 = [defaults valueForKey:@"locationValidity2"];
    if ([self validString:strLoc_Validity2]) {
        
        self.textLocation_Validity2.text = strLoc_Validity2;
    }
    
}

-(BOOL) validString:(NSString *)string{
    
    if (string == (id)[NSNull null] || string.length == 0 ){
        
        return NO;
    }
    else{
        
        return YES;
    }
}

-(void)showToast:(NSString *)strMessage{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    hud.bezelView.color = [UIColor blackColor];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = strMessage;
    hud.label.textColor = [UIColor whiteColor];
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:2.0];
}



@end
