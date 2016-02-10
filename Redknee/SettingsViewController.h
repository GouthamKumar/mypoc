//
//  SettingsViewController.h
//  Redknee
//
//  Created by Goutham  S on 2/4/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textWifi_SSID1;
@property (weak, nonatomic) IBOutlet UITextField *textWifi_Message1;
@property (weak, nonatomic) IBOutlet UITextField *textWifi_Promo1;
@property (weak, nonatomic) IBOutlet UITextField *textWifi_Pack1;
@property (weak, nonatomic) IBOutlet UITextField *textWifi_Voice1;
@property (weak, nonatomic) IBOutlet UITextField *textWifi_Data1;
@property (weak, nonatomic) IBOutlet UITextField *textWifi_Price1;
@property (weak, nonatomic) IBOutlet UITextField *textWifi_Validity1;
@property (weak, nonatomic) IBOutlet UITextField *textWifi_SSID2;
@property (weak, nonatomic) IBOutlet UITextField *textWifi_Message2;
@property (weak, nonatomic) IBOutlet UITextField *textWifi_Promo2;
@property (weak, nonatomic) IBOutlet UITextField *textWifi_Pack2;
@property (weak, nonatomic) IBOutlet UITextField *textWifi_Voice2;
@property (weak, nonatomic) IBOutlet UITextField *textWifi_Data2;
@property (weak, nonatomic) IBOutlet UITextField *textWifi_Price2;
@property (weak, nonatomic) IBOutlet UITextField *textWifi_Validity2;


@property (weak, nonatomic) IBOutlet UITextField *textSim_OwnOperator;
@property (weak, nonatomic) IBOutlet UITextField *textSim_Operator1;
@property (weak, nonatomic) IBOutlet UITextField *textSim_Message1;
@property (weak, nonatomic) IBOutlet UITextField *textSim_Promo1;
@property (weak, nonatomic) IBOutlet UITextField *textSim_Pack1;
@property (weak, nonatomic) IBOutlet UITextField *textSim_Voice1;
@property (weak, nonatomic) IBOutlet UITextField *textSim_Data1;
@property (weak, nonatomic) IBOutlet UITextField *textSim_Price1;
@property (weak, nonatomic) IBOutlet UITextField *textSim_Validity1;

@property (weak, nonatomic) IBOutlet UITextField *textSim_Operator2;
@property (weak, nonatomic) IBOutlet UITextField *textSim_Message2;
@property (weak, nonatomic) IBOutlet UITextField *textSim_Promo2;
@property (weak, nonatomic) IBOutlet UITextField *textSim_Pack2;
@property (weak, nonatomic) IBOutlet UITextField *textSim_Voice2;
@property (weak, nonatomic) IBOutlet UITextField *textSim_Data2;
@property (weak, nonatomic) IBOutlet UITextField *textSim_Price2;
@property (weak, nonatomic) IBOutlet UITextField *textSim_Validity2;


@property (weak, nonatomic) IBOutlet UITextField *textData_Threshold1;
@property (weak, nonatomic) IBOutlet UITextField *textData_Message1;
@property (weak, nonatomic) IBOutlet UITextField *textData_Promo1;
@property (weak, nonatomic) IBOutlet UITextField *textData_Pack1;
@property (weak, nonatomic) IBOutlet UITextField *textData_Voice1;
@property (weak, nonatomic) IBOutlet UITextField *textData_Data1;
@property (weak, nonatomic) IBOutlet UITextField *textData_Price1;
@property (weak, nonatomic) IBOutlet UITextField *textData_Validity1;

@property (weak, nonatomic) IBOutlet UITextField *textData_Threshold2;
@property (weak, nonatomic) IBOutlet UITextField *textData_Message2;
@property (weak, nonatomic) IBOutlet UITextField *textData_Promo2;
@property (weak, nonatomic) IBOutlet UITextField *textData_Pack2;
@property (weak, nonatomic) IBOutlet UITextField *textData_Voice2;
@property (weak, nonatomic) IBOutlet UITextField *textData_Data2;
@property (weak, nonatomic) IBOutlet UITextField *textData_Price2;
@property (weak, nonatomic) IBOutlet UITextField *textData_Validity2;


@property (weak, nonatomic) IBOutlet UITextField *textLocation_Range;
@property (weak, nonatomic) IBOutlet UITextField *textLocation_Latitude1;
@property (weak, nonatomic) IBOutlet UITextField *textLocation_longitude1;
@property (weak, nonatomic) IBOutlet UITextField *textLocation_Message1;
@property (weak, nonatomic) IBOutlet UITextField *textLocation_Promo1;
@property (weak, nonatomic) IBOutlet UITextField *textLocation_Pack1;
@property (weak, nonatomic) IBOutlet UITextField *textLocation_Voice1;
@property (weak, nonatomic) IBOutlet UITextField *textLocation_Data1;
@property (weak, nonatomic) IBOutlet UITextField *textLocation_Price1;
@property (weak, nonatomic) IBOutlet UITextField *textLocation_Validity1;

@property (weak, nonatomic) IBOutlet UITextField *textLocation_Latitude2;
@property (weak, nonatomic) IBOutlet UITextField *textLocation_longitude2;
@property (weak, nonatomic) IBOutlet UITextField *textLocation_Message2;
@property (weak, nonatomic) IBOutlet UITextField *textLocation_Promo2;
@property (weak, nonatomic) IBOutlet UITextField *textLocation_Pack2;
@property (weak, nonatomic) IBOutlet UITextField *textLocation_Voice2;
@property (weak, nonatomic) IBOutlet UITextField *textLocation_Data2;
@property (weak, nonatomic) IBOutlet UITextField *textLocation_Price2;
@property (weak, nonatomic) IBOutlet UITextField *textLocation_Validity2;

@property (weak, nonatomic) IBOutlet UITextField *textShake_Message2;
@property (weak, nonatomic) IBOutlet UITextField *textShake_Promo2;
@property (weak, nonatomic) IBOutlet UITextField *textShake_Pack2;
@property (weak, nonatomic) IBOutlet UITextField *textShake_Voice2;
@property (weak, nonatomic) IBOutlet UITextField *textShake_Data2;
@property (weak, nonatomic) IBOutlet UITextField *textShake_Price2;
@property (weak, nonatomic) IBOutlet UITextField *textShake_Validity2;

@property (weak, nonatomic) IBOutlet UIButton *btnWifiSave;
@property (weak, nonatomic) IBOutlet UIButton *btnSimSave;
@property (weak, nonatomic) IBOutlet UIButton *btnDataSave;
@property (weak, nonatomic) IBOutlet UIButton *btnLocationSave;
@property (weak, nonatomic) IBOutlet UIButton *btnShakeSave;

- (IBAction)btnMenuTapped:(id)sender;
- (IBAction)btnWifi_SaveTapped:(id)sender;
- (IBAction)btnSim_SaveTapped:(id)sender;
- (IBAction)btnData_SaveTapped:(id)sender;
- (IBAction)btnLocation_SaveTapped:(id)sender;
- (IBAction)btnShake_SaveTapped:(id)sender;

@end
