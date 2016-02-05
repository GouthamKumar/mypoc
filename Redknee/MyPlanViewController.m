//
//  MyPlanViewController.m
//  Redknee
//
//  Created by Goutham  S on 2/4/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import "MyPlanViewController.h"
#import "MFSideMenu.h"
#import "PopUpViewController.h"
#import "ViewController.h"

@interface MyPlanViewController ()<PopupDelegate>



@property(nonatomic, weak) IBOutlet UILabel *voiceLable;
@property(nonatomic, weak) IBOutlet UILabel *smsLabel;
@property(nonatomic, weak) IBOutlet UILabel *dataLabel;

@property(nonatomic, weak) IBOutlet UISlider *voiceSlider;
@property(nonatomic, weak) IBOutlet UISlider *smsSlider;
@property(nonatomic, weak) IBOutlet UISlider *dataSlider;


- (IBAction) VoicesliderValueChanged:(id)sender;
- (IBAction) SMSliderValueChanged:(id)sender;
- (IBAction) DatasliderValueChanged:(id)sender;

@end

@implementation MyPlanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIImage *sliderThumb = [UIImage imageNamed:@"slideThumb.png"];
//    
//    
//    UIImage *sliderMinimum = [UIImage imageNamed:@"pinkimg.png"];
//    UIImage *sliderMaximum = [UIImage imageNamed:@"grayimg.png"] ;
//    
//    //Voice Slider UI
//    [self.voiceSlider setMinimumTrackTintColor:[UIColor orangeColor]];
//    [self.voiceSlider setThumbImage:sliderThumb forState:UIControlStateNormal];
//    [self.voiceSlider setThumbImage:sliderThumb forState:UIControlStateHighlighted];
//    [self.voiceSlider setMinimumTrackImage:sliderMinimum forState:UIControlStateNormal];
//    [self.voiceSlider setMaximumTrackImage:sliderMaximum forState:UIControlStateNormal];
//    
//    
//    //[voiceSlider setMaximumTrackTintColor:[UIColor blueColor]];
//    
//    //SMS Slider UI
//    [self.smsSlider setMinimumTrackTintColor:[UIColor greenColor]];
//    [self.smsSlider setThumbImage:sliderThumb forState:UIControlStateNormal];
//    [self.smsSlider setThumbImage:sliderThumb forState:UIControlStateHighlighted];
//    [self.smsSlider setMinimumTrackImage:sliderMinimum forState:UIControlStateNormal];
//    [self.smsSlider setMaximumTrackImage:sliderMaximum forState:UIControlStateNormal];
//    
//    
//    //[smsSlider setMaximumTrackTintColor:[UIColor blueColor]];
//    
//    //Data Slider UI
//    [self.dataSlider setMinimumTrackTintColor:[UIColor yellowColor]];
//    [self.dataSlider setThumbImage:sliderThumb forState:UIControlStateNormal];
//    [self.dataSlider setThumbImage:sliderThumb forState:UIControlStateHighlighted];
//    [self.dataSlider setMinimumTrackImage:sliderMinimum forState:UIControlStateNormal];
//    [self.dataSlider setMaximumTrackImage:sliderMaximum forState:UIControlStateNormal];
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

#pragma maek - User Actions
- (IBAction)btnMenuTapped:(id)sender {
    
    UIApplication *myApplication = [UIApplication sharedApplication];
    UIWindow *mainWindow = [myApplication keyWindow];
    MFSideMenuContainerViewController *container  = (MFSideMenuContainerViewController*)[mainWindow rootViewController];
    
    UIViewController *flyoutMenu = [self.storyboard instantiateViewControllerWithIdentifier:@"SideMenuViewController"];
    [container setLeftMenuViewController:flyoutMenu];
    [container setLeftMenuWidth:300.0f];
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}

- (IBAction) VoicesliderValueChanged:(id)sender;{
//    UISlider *MYslider = (UISlider *)sender;
//    float SliderValue = (float)roundf(MYslider.value);
//    self.voiceLable.text = [NSString stringWithFormat:@"%.2f", SliderValue];
    
}
- (IBAction) SMSliderValueChanged:(id)sender;{
//    UISlider *MYslider = (UISlider *)sender;
//    float SliderValue = (float)roundf(MYslider.value);
//    self.smsLabel.text = [NSString stringWithFormat:@"%.2f", SliderValue];
    
}
- (IBAction) DatasliderValueChanged:(id)sender;{
//    UISlider *MYslider = (UISlider *)sender;
//    float SliderValue = (float)roundf(MYslider.value);
//    self.dataLabel.text = [NSString stringWithFormat:@"%.2f", SliderValue];
}


-(void) dismissfromRootView:(UIViewController *)viewController{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    ViewController *mainVc = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    [self.navigationController pushViewController:mainVc animated:YES];
}
@end
