//
//  BestOffersViewController.m
//  Redknee
//
//  Created by Sreekala on 01/02/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import "BestOffersViewController.h"
#import "AppDelegate.h"
#import "MyPlanViewController.h"

#define ARC4RANDOM_MAX 0x100000000

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WID ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WID, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WID, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)


@interface BestOffersViewController (){
    
    PNPieChart *pieCharts,*pieChart;
    
    AppDelegate *appDelegate;
    
    NSString *strMessage;
}

@property (nonatomic, retain) NSMutableArray *arrData;

@end

@implementation BestOffersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.slices = [NSMutableArray arrayWithCapacity:2];
    
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    for(int i = 0; i < 5; i ++)
    {
        NSNumber *one = [NSNumber numberWithInt:rand()%60+20];
        [_slices addObject:one];
    }
    
    
    self.arrData = [[NSMutableArray alloc] init];
    
    self.sliceColors =[NSArray arrayWithObjects:
                       [UIColor colorWithRed:246/255.0 green:155/255.0 blue:0/255.0 alpha:1],
                       [UIColor colorWithRed:129/255.0 green:195/255.0 blue:29/255.0 alpha:1],
                       [UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1],
                       [UIColor colorWithRed:229/255.0 green:66/255.0 blue:115/255.0 alpha:1],
                       [UIColor colorWithRed:148/255.0 green:141/255.0 blue:139/255.0 alpha:1],nil];
    
    NSArray *item = @[[PNPieChartDataItem dataItemWithValue:10 color:PNFreshGreen],
                       ];
    
    CGRect newFrame;
    if (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) {
        
        newFrame = CGRectMake(30, 75, 100, 10);
    }
    else if (IS_IPHONE_6){
        
        newFrame = CGRectMake(self.viewRightPieChart.frame.size.width/4-30, 75, 100, 10);
    }
    else{
        
        newFrame = CGRectMake(self.viewRightPieChart.frame.size.width/4-25, 78, 105, 10);
    }
    
    pieChart = [[PNPieChart alloc] initWithFrame:newFrame items:item];
    pieChart.descriptionTextColor = [UIColor whiteColor];
    pieChart.descriptionTextFont  = [UIFont fontWithName:@"Avenir-Medium" size:11.0];
    pieChart.descriptionTextShadowColor = [UIColor clearColor];
    pieChart.showAbsoluteValues = NO;
    pieChart.showOnlyValues = NO;
    [pieChart strokeChart];
    
    
    pieChart.legendStyle = PNLegendItemStyleStacked;
    pieChart.legendFont = [UIFont boldSystemFontOfSize:12.0f];
    
    [self.viewLeftPieChart addSubview:pieChart];
    
    NSArray *items = @[[PNPieChartDataItem dataItemWithValue:60 color:[UIColor redColor]],
                       [PNPieChartDataItem dataItemWithValue:100 color:PNGreen],
                       ];
    
    pieCharts = [[PNPieChart alloc] initWithFrame:newFrame items:items];
    pieCharts.descriptionTextColor = [UIColor whiteColor];
    pieCharts.descriptionTextFont  = [UIFont fontWithName:@"Avenir-Medium" size:11.0];
    pieCharts.descriptionTextShadowColor = [UIColor clearColor];
    pieCharts.showAbsoluteValues = NO;
    pieCharts.showOnlyValues = NO;
    [pieCharts strokeChart];
    
    
    pieCharts.legendStyle = PNLegendItemStyleStacked;
    pieCharts.legendFont = [UIFont boldSystemFontOfSize:12.0f];
    
    [self.viewLeftPieChart addSubview:pieChart];
    
    [self.viewRightPieChart addSubview:pieCharts];
    
    self.btnCreate.layer.borderColor=[[UIColor whiteColor]CGColor];
    self.btnCreate.layer.borderWidth= 1.0f;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [pieChart strokeChart];
    [pieCharts strokeChart];
    
//    [self.arrData removeAllObjects];
    
    NSString *strSSID1 = [[NSUserDefaults standardUserDefaults] valueForKey:@"wifiMessage1"];
    NSString *strSSID2 = [[NSUserDefaults standardUserDefaults] valueForKey:@"wifiMessage2"];
    
    strMessage = [[NSUserDefaults standardUserDefaults] valueForKey:@"selectedMessage"];
    if ([strSSID1 isEqualToString:strMessage]) {
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *strPack = [defaults valueForKey:@"wifiPack1"];
        NSString *strVoice = [defaults valueForKey:@"wifiVoice1"];
        NSString *strData = [defaults valueForKey:@"wifiData1"];
        NSString *strPrice = [defaults valueForKey:@"wifiPrice1"];
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        //        [dict removeObjectForKey:@"wifiDetails"];
        [dict setValue:strPack forKey:@"pack"];
        [dict setValue:strVoice forKey:@"voice"];
        [dict setValue:strData forKey:@"data"];
        [dict setValue:strPrice forKey:@"price"];
        [self.arrData addObject:dict];
        [defaults setValue:@"" forKey:@"selectedMessage"];
        [defaults synchronize];
    }
    
    else if ([strSSID2 isEqualToString:strMessage]){
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *strPack = [defaults valueForKey:@"wifiPack2"];
        NSString *strVoice = [defaults valueForKey:@"wifiVoice2"];
        NSString *strData = [defaults valueForKey:@"wifiData2"];
        NSString *strPrice = [defaults valueForKey:@"wifiPrice2"];
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        //        [dict removeObjectForKey:@"wifiDetails"];
        [dict setValue:strPack forKey:@"pack"];
        [dict setValue:strVoice forKey:@"voice"];
        [dict setValue:strData forKey:@"data"];
        [dict setValue:strPrice forKey:@"price"];
        [self.arrData addObject:dict];
        [defaults setValue:@"" forKey:@"selectedMessage"];
        [defaults synchronize];
    }
    
    [self.tableViewBestOffers reloadData];
}

-(void) viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
}

/*
#pragma mark - Navigation
 
 wifiDetails

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITableView Methods

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.arrData count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"wifiDetails" forIndexPath:indexPath];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"wifiDetails"];
    }
    
    NSDictionary *dict = [self.arrData objectAtIndex:indexPath.row];
    
    UILabel *lblName = (UILabel *)[cell viewWithTag:1];
    lblName.text = [dict valueForKey:@"pack"];
    
    UILabel *lblTatal_Data = (UILabel *)[cell viewWithTag:2];
    lblTatal_Data.text = @"1.00 GB";
    
    UILabel *lblRemain_Data = (UILabel *)[cell viewWithTag:3];
    lblRemain_Data.text = @"800 MB";
    
    UILabel *lblValid_Date = (UILabel *)[cell viewWithTag:4];
    lblValid_Date.text = @"30 Jan 2016";
    
    UIButton *btnUnSub = (UIButton *)[cell viewWithTag:5];
    btnUnSub.layer.borderColor=[[UIColor whiteColor]CGColor];
    btnUnSub.layer.borderWidth= 1.0f;
    btnUnSub.tag = 100+indexPath.row;
    [btnUnSub addTarget:self action:@selector(btnUnsubTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}


-(void) btnUnsubTapped:(id)sender{
    
    
    NSLog(@"btnUnsubTapped tag %ld",(long)[sender tag]);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *strMess = [defaults valueForKey:@"selectediMessage"];
    [defaults setValue:strMess forKey:@"selectedMessage"];
    [defaults synchronize];
    [self.arrData removeAllObjects];
    [self.tableViewBestOffers reloadData];
    [appDelegate.containerVC scrollMenuViewSelectedIndex:2];
    
}

- (IBAction)btnCreateTapped:(id)sender {
    
    MyPlanViewController *myPlanVc = [self.storyboard instantiateViewControllerWithIdentifier:@"MyPlanViewController"];
    myPlanVc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//    [self.navigationController pushViewController:myPlanVc animated:YES];
    [self presentViewController:myPlanVc animated:YES completion:nil];
}
@end
