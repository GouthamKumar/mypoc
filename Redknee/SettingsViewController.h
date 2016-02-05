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






- (IBAction)btnMenuTapped:(id)sender;
- (IBAction)btnWifi_SaveTapped:(id)sender;

@end
