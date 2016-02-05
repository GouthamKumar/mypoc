//
//  PopUpViewController.h
//  Redknee
//
//  Created by Goutham  S on 2/5/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopUpViewController : UIViewController

@property (nonatomic, retain) NSString *strWifi_Name;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIButton *btnBuy;
@property (weak, nonatomic) IBOutlet UIButton *btnCancel;
@property (weak, nonatomic) IBOutlet UIView *viewAlert;

- (IBAction)btnCancelTapped:(id)sender;
- (IBAction)btnBuyTapped:(id)sender;
@end
