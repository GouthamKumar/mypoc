//
//  TransactionHistoryViewController.m
//  Redknee
//
//  Created by Goutham  S on 2/9/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import "TransactionHistoryViewController.h"
#import "MFSideMenu.h"


@interface TransactionHistoryViewController ()

@end

@implementation TransactionHistoryViewController

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


#pragma mark - TableView Delegate

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 6;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"historyCell" forIndexPath:indexPath];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"historyCell"];
    }
    
    UILabel *lblDate = (UILabel *)[cell viewWithTag:1];
    lblDate.numberOfLines = 0;
    lblDate.text = [NSString stringWithFormat:@"10:02:2016 %ld:00 AM",indexPath.row+6];
    
    UILabel *lblMobileNo = (UILabel *)[cell viewWithTag:2];
    lblMobileNo.numberOfLines = 0;
    lblMobileNo.text = [NSString stringWithFormat:@"+91 970480201%ld",indexPath.row+1];
    
    UILabel *lblMins = (UILabel *)[cell viewWithTag:3];
    lblMins.text = [NSString stringWithFormat:@"%ld Mins",indexPath.row+26];
    
    
    return cell;
    
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}
@end
