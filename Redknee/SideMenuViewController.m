//
//  SideMenuViewController.m
//  Redknee
//
//  Created by Sreekala on 02/02/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import "SideMenuViewController.h"
#import "MyPlanViewController.h"
#import "MyUsageViewController.h"
#import "ViewController.h"
#import "LoginViewController.h"
#import "SettingsViewController.h"
#import "MFSideMenu.h"
#import "ShopCartViewController.h"
#import "BillPaymentViewController.h"
#import "TransactionHistoryViewController.h"
#import "StoreLocatorViewController.h"


@interface SideMenuViewController ()

@property (nonatomic, retain) NSArray *arrMenuList;

@end

@implementation SideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrMenuList = [[NSArray alloc] initWithObjects:@"Exclusive Offers", @"Current Plan", @"Recommendations", @"Shop & Cart", @"Bill & Payment", @"Transaction History", @"Store Locator", @"Log Out", @"Settings", @"Mock Location", nil];
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

#pragma mark - UItableView Delegates

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.arrMenuList count];
    
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil){
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    cell.imageView.image = [UIImage imageNamed:@"asdf.png"];
    cell.textLabel.text = [self.arrMenuList objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor]; 
    cell.backgroundColor = [UIColor blackColor];
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2) {
        
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *strMess = [defaults valueForKey:@"selectediMessage"];
        [defaults setValue:strMess forKey:@"selectedMessage"];
        [defaults synchronize];
        
        ViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        viewController.scrollIndexFlag = (int)indexPath.row+1;
        UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
        NSArray *controllers = [NSArray arrayWithObject:viewController];
        navigationController.viewControllers = controllers;
        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
        
    }
    else if (indexPath.row == 3){
        
        ShopCartViewController *shopCartVc = [self.storyboard instantiateViewControllerWithIdentifier:@"ShopCartViewController"];
        UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
        NSArray *controllers = [NSArray arrayWithObject:shopCartVc];
        navigationController.viewControllers = controllers;
        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
        
    }
    else if (indexPath.row == 4){
        
        BillPaymentViewController *billPayVc = [self.storyboard instantiateViewControllerWithIdentifier:@"BillPaymentViewController"];
        UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
        NSArray *controllers = [NSArray arrayWithObject:billPayVc];
        navigationController.viewControllers = controllers;
        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
        
    }
    else if (indexPath.row == 5){
        
        TransactionHistoryViewController *transactionHistoryVc = [self.storyboard instantiateViewControllerWithIdentifier:@"TransactionHistoryViewController"];
        UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
        NSArray *controllers = [NSArray arrayWithObject:transactionHistoryVc];
        navigationController.viewControllers = controllers;
        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
    }
    else if (indexPath.row == 6){
        
        StoreLocatorViewController *storeLocatorVc = [self.storyboard instantiateViewControllerWithIdentifier:@"StoreLocatorViewController"];
        UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
        NSArray *controllers = [NSArray arrayWithObject:storeLocatorVc];
        navigationController.viewControllers = controllers;
        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
    }
    else if (indexPath.row == 7){
        
        [self showAlertViewTitle:@"Message...!" andMessage:@"Are you sure want to logout?" andTag:200];
    }
    else if (indexPath.row == 8){
        
        SettingsViewController *settingsVc = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingsViewController"];
        UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
        NSArray *controllers = [NSArray arrayWithObject:settingsVc];
        navigationController.viewControllers = controllers;
        [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
    }
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 64;
}

-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *viewHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    viewHeader.backgroundColor = [UIColor blackColor];
    return viewHeader;
}

#pragma mark - Custom Methods

-(void)showAlertViewTitle:(NSString *)title andMessage:(NSString *)message andTag:(int)tagVal{
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    NSString *strOk = @"Ok";
    if (tagVal == 200) {
        strOk = @"yes";
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            
        }];
        [controller addAction:cancelAction];
    }
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:strOk style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if (tagVal == 200) {
            
            [[NSUserDefaults standardUserDefaults] setValue:@"" forKey:@"isActive"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            LoginViewController *loginVc = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:loginVc];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
        }
        
    }];
    [controller addAction:okAction];
    
    [self presentViewController:controller animated:YES completion:nil];
    
}



@end
