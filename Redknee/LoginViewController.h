//
//  LoginViewController.h
//  Redknee
//
//  Created by Goutham  S on 02/02/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <NetworkExtension/NetworkExtension.h>
#import <SystemConfiguration/CaptiveNetwork.h>

@interface LoginViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *textName;
@property (weak, nonatomic) IBOutlet UITextField *textPassword;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;

- (IBAction)btnLoginTapped:(id)sender;

@end
