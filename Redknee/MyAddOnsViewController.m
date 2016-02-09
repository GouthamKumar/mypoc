//
//  MyAddOnsViewController.m
//  Redknee
//
//  Created by Goutham  S on 2/9/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import "MyAddOnsViewController.h"

@interface MyAddOnsViewController ()

@end

@implementation MyAddOnsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.removeButton1.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.removeButton1.layer.borderWidth= 1.0f;
    self.removeButton2.layer.borderWidth= 1.0f;
    self.removeButton2.layer.borderColor=[[UIColor whiteColor]CGColor];
    
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
