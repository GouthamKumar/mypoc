//
//  AvailableAddOnsViewController.m
//  Redknee
//
//  Created by Goutham  S on 2/9/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import "AvailableAddOnsViewController.h"

@interface AvailableAddOnsViewController ()

@end

@implementation AvailableAddOnsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.btnRemove1.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.btnRemove1.layer.borderWidth= 1.0f;
    self.btnRemove2.layer.borderWidth= 1.0f;
    self.btnRemove2.layer.borderColor=[[UIColor whiteColor]CGColor];
    
    
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

@end
