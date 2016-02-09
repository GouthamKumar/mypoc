//
//  BestOffersViewController.m
//  Redknee
//
//  Created by Sreekala on 01/02/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import "BestOffersViewController.h"
#import "AppDelegate.h"

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
        
        newFrame = CGRectMake(30, 84, 100, 10);
    }
    else if (IS_IPHONE_6){
        
        newFrame = CGRectMake(self.viewRightPieChart.frame.size.width/4-40, 84, 110, 10);
    }
    else{
        
        newFrame = CGRectMake(self.viewRightPieChart.frame.size.width/4-30, 84, 120, 10);
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
    
    NSArray *items = @[[PNPieChartDataItem dataItemWithValue:2 color:[UIColor redColor]],
                       [PNPieChartDataItem dataItemWithValue:10 color:PNGreen],
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
    
    [self.arrData removeAllObjects];
    
    
    NSArray *arr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *strDestPath = [NSString stringWithFormat:@"%@/BestOffer.plist",[arr objectAtIndex:0]];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:strDestPath];
    
    NSLog(@"best wifi Details %@",[dict valueForKey:@"wifiDetails"]);
    
    
    self.arrData = [dict valueForKey:@"wifiDetails"];
    
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
    
    NSInteger flagVal = [sender tag]-100;
    
    if (self.arrData.count>flagVal) {
        
        NSDictionary *dict = [self.arrData objectAtIndex:flagVal];
        
        [self.arrData removeObjectAtIndex:flagVal];
        
        NSArray *arr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *strDestPath = [NSString stringWithFormat:@"%@/Recommended.plist",[arr objectAtIndex:0]];
        
        NSMutableArray *arrWifiDetails = [[NSMutableArray alloc] init];
        NSDictionary *dictRoot = [[NSDictionary alloc] initWithContentsOfFile:strDestPath];
        arrWifiDetails = [[dictRoot valueForKey:@"wifiDetails"] mutableCopy];
        
        [arrWifiDetails addObject:dict];
        
        NSDictionary *dictWifi = [NSDictionary dictionaryWithObjectsAndKeys:arrWifiDetails,@"wifiDetails", nil];
        [dictWifi writeToFile:strDestPath atomically:YES];
        
        [appDelegate.containerVC scrollMenuViewSelectedIndex:2];
        
        
        NSString *strDestPathReco = [NSString stringWithFormat:@"%@/BestOffer.plist",[arr objectAtIndex:0]];
        
        NSDictionary *dictWifiReco = [NSDictionary dictionaryWithObjectsAndKeys:self.arrData,@"wifiDetails", nil];
        [dictWifiReco writeToFile:strDestPathReco atomically:YES];
        
        [self.tableViewBestOffers reloadData];
        
    }
    
    
}

@end
