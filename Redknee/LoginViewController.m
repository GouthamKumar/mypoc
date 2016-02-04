//
//  LoginViewController.m
//  Redknee
//
//  Created by Goutham  S on 02/02/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import "LoginViewController.h"
#import "ViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.btnLogin.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.btnLogin.layer.borderWidth= 1.0f;
    
    
    CALayer *bottomNameBorder = [CALayer layer];
    bottomNameBorder.frame = CGRectMake(0.0f, self.textPassword.frame.size.height - 1, self.textPassword.frame.size.width, 1.0f);
    bottomNameBorder.backgroundColor = [UIColor whiteColor].CGColor;
    [self.textName.layer addSublayer:bottomNameBorder];
    
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, self.textPassword.frame.size.height - 1, self.textPassword.frame.size.width, 1.0f);
    bottomBorder.backgroundColor = [UIColor whiteColor].CGColor;
    [self.textPassword.layer addSublayer:bottomBorder];
    
    
//    [self setNeedsStatusBarAppearanceUpdate];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
    [[NSUserDefaults standardUserDefaults] setValue:@"no" forKey:@"enableGesture"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSString *strStatus = [[NSUserDefaults standardUserDefaults] valueForKey:@"isActive"];
    if((![strStatus isKindOfClass:[NSNull class]]) && !(strStatus == nil) && strStatus.length > 0){
        
        ViewController *viewC = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        [self.navigationController pushViewController:viewC animated:YES];
    }
    
    
    
    
}

-(void) viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    [self getWifi];
    
//    NSLog(@"my wifi%@",[self fetchSSIDInfo]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(void)getWifi{
    
    NSArray * networkInterfaces = [NEHotspotHelper supportedNetworkInterfaces];
    NSLog(@"Networks %@",networkInterfaces);
    
    for(NEHotspotNetwork *hotspotNetwork in [NEHotspotHelper supportedNetworkInterfaces]) {
        NSString *ssid = hotspotNetwork.SSID;
        NSLog(@"ssid %@",ssid);
//        NSString *bssid = hotspotNetwork.BSSID;
//        BOOL secure = hotspotNetwork.secure;
//        BOOL autoJoined = hotspotNetwork.autoJoined;
//        double signalStrength = hotspotNetwork.signalStrength;
    }
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

- (IBAction)btnLoginTapped:(id)sender {
    
//    if (![self.textName.text length]) {
//        
//        
//    }
//    else if (![self.textPassword.text length]){
//        
//        
//    }
//    else{
    
        [[NSUserDefaults standardUserDefaults] setValue:@"registered" forKey:@"isActive"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        ViewController *viewC = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        [self.navigationController pushViewController:viewC animated:YES];
//    }
    
}

-(UIImage *)image:(UIImage*)img resizeTo:(CGSize)newSize

{
    
    CGFloat scale = [[UIScreen mainScreen]scale];
    
    /*You can remove the below comment if you dont want to scale the image in retina   device .Dont forget to comment UIGraphicsBeginImageContextWithOptions*/
    
    //UIGraphicsBeginImageContext(newSize);
    
    UIGraphicsBeginImageContextWithOptions(newSize, NO, scale);
    
    [img drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
    
}

-(void)generateImagesForTextFields

{
    
    self.textName.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.textName.layer.borderWidth = 1.0;
    
    NSString *searchIconPath = [[NSBundle mainBundle] pathForResource:@"globe" ofType:@"png" ];
    
    UIImage * searchIcon =[self image:[UIImage imageWithContentsOfFile:searchIconPath] resizeTo:CGSizeMake(15, 16)];
    
    //UIImage * searchIcon =[UIImage imageWithContentsOfFile:searchResourcePath];
    
    
    
    UIImageView * searchIconView = [[UIImageView  alloc] initWithImage:searchIcon];
    
    searchIconView.frame = CGRectMake(0.0, 0.0, searchIconView.image.size.width+15.0, searchIconView.image.size.height);
    
    searchIconView.contentMode = UIViewContentModeCenter;
    
    
    
    [self.textName  setRightView :searchIconView];
    
    [self.textName  setRightViewMode: UITextFieldViewModeAlways];
    
    
    
}


@end
