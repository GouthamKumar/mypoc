//
//  RecommendedPlansViewController.m
//  Redknee
//
//  Created by Sreekala on 01/02/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import "RecommendedPlansViewController.h"
#import "SKSTableViewCell.h"
#import "MyCustomeCell.h"
#import "AppDelegate.h"

@interface RecommendedPlansViewController (){
    
    UIView *viewDetails;
    AppDelegate *appDelegate;
}

@property (nonatomic, retain) NSMutableArray *arrData;


@end

@implementation RecommendedPlansViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrData = [[NSMutableArray alloc] init];
    
    // Do any additional setup after loading the view.
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [self.arrData removeAllObjects];
    
    viewDetails = [[[NSBundle mainBundle] loadNibNamed:@"CommonView" owner:self options:nil] objectAtIndex:0];
    viewDetails.frame = CGRectMake(0, 2, self.view.frame.size.width, 300);
    
    
    
}


-(void) viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    NSArray *arr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *strDestPath = [NSString stringWithFormat:@"%@/Recommended.plist",[arr objectAtIndex:0]];
    
    
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:strDestPath];
    
    NSLog(@"rec wifi Details %@",[dict valueForKey:@"wifiDetails"]);
    
    
    self.arrData = [[dict valueForKey:@"wifiDetails"] mutableCopy];
    
    if (self.arrData == nil) {
        
        self.arrData = [[NSMutableArray alloc] init];
    }
    
    [self.tableView reloadData];
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
 
 Thanks for being purchased this plan !! Observe the same under current plan.
*/


#pragma mark - TableView Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSArray<NSIndexPath *> *selectedRows = [tableView indexPathsForSelectedRows];
//    if (selectedRows && [selectedRows containsObject:indexPath]) {
//        
//        return 350.0; // Expanded height
//    }
//    
//    return 50; // Normal height
    
    return 350.0;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section; {
    
    return [self.arrData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath; {
    
    static NSString *cellID = @"Cell";
    
    MyCustomeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID
                                                                forIndexPath:indexPath];
    //cell.textLabel.text = [NSString stringWithFormat:@"row %li", (long)indexPath.row];
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"section %li", (long)indexPath.section];
    
    NSDictionary *dict = [self.arrData objectAtIndex:indexPath.row];
    
    UILabel *lblPrice = (UILabel *)[cell viewWithTag:1];
    lblPrice.text = [NSString stringWithFormat:@"$ %@ per month",[dict valueForKey:@"price"]];
    
    UILabel *lblPack = (UILabel *)[cell viewWithTag:2];
    lblPack.text = [dict valueForKey:@"pack"];
    
    UILabel *lblPack_Details = (UILabel *)[cell viewWithTag:4];
    lblPack_Details.text = [dict valueForKey:@"pack"];
    
    UILabel *lblVoice_Details = (UILabel *)[cell viewWithTag:5];
    lblVoice_Details.text = [NSString stringWithFormat:@"Voice %@ min",[dict valueForKey:@"voice"]];
    
    UILabel *lblData_Details = (UILabel *)[cell viewWithTag:6];
    lblData_Details.text = [NSString stringWithFormat:@"Data %@ MB",[dict valueForKey:@"pack"]];
    
    UILabel *lblPrice_Detail = (UILabel *)[cell viewWithTag:7];
    lblPrice_Detail.text = [NSString stringWithFormat:@"$ %@",[dict valueForKey:@"price"]];
    
    UILabel *lblTotal_Detail = (UILabel *)[cell viewWithTag:8];
    lblTotal_Detail.text = [NSString stringWithFormat:@"$ %@",[dict valueForKey:@"price"]];
    
    
    UIButton *btnSub = (UIButton *)[cell viewWithTag:9];
    btnSub.layer.borderColor=[[UIColor whiteColor]CGColor];
    btnSub.layer.borderWidth= 1.0f;
    btnSub.tag = 100+indexPath.row;
    [btnSub addTarget:self action:@selector(btnSubTapped:) forControlEvents:UIControlEventTouchUpInside];
    
//    cell.customView.hidden = YES;
//    [cell.contentView sendSubviewToBack:cell.customView];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    [self updateTableView];
//    
//    MyCustomeCell* cell = [tableView cellForRowAtIndexPath:indexPath];
//    
//    cell.customView.hidden = NO;
//    [cell.contentView bringSubviewToFront:cell.customView];
    
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [self updateTableView];
//    
//    MyCustomeCell* cell = [tableView cellForRowAtIndexPath:indexPath];
//    cell.customView.hidden = YES;
//    [cell.contentView sendSubviewToBack:cell.customView];
    
    
}

- (void)updateTableView
{
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}

-(void) btnSubTapped:(id) sender{
    
    NSLog(@"tag is %ld",[sender tag]);
    
    NSInteger flagVal = [sender tag]-100;
    
    if (self.arrData.count>flagVal) {
        
        NSDictionary *dict = [self.arrData objectAtIndex:flagVal];
        
        [self.arrData removeObjectAtIndex:flagVal];
        
        NSArray *arr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *strDestPath = [NSString stringWithFormat:@"%@/BestOffer.plist",[arr objectAtIndex:0]];
        
        NSMutableArray *arrWifiDetails = [[NSMutableArray alloc] init];
        NSDictionary *dictRoot = [[NSDictionary alloc] initWithContentsOfFile:strDestPath];
        arrWifiDetails = [[dictRoot valueForKey:@"wifiDetails"] mutableCopy];
        
        [arrWifiDetails addObject:dict];
        
        NSDictionary *dictWifi = [NSDictionary dictionaryWithObjectsAndKeys:arrWifiDetails,@"wifiDetails", nil];
        [dictWifi writeToFile:strDestPath atomically:YES];
        
        [appDelegate.containerVC scrollMenuViewSelectedIndex:1];
        
        
        NSString *strDestPathReco = [NSString stringWithFormat:@"%@/Recommended.plist",[arr objectAtIndex:0]];
        
        NSDictionary *dictWifiReco = [NSDictionary dictionaryWithObjectsAndKeys:self.arrData,@"wifiDetails", nil];
        [dictWifiReco writeToFile:strDestPathReco atomically:YES];
        
        [self.tableView reloadData];
        
        
    }
}

/*
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.arrData count];
    
}

- (NSInteger)tableView:(SKSTableView *)tableView numberOfSubRowsAtIndexPath:(NSIndexPath *)indexPath {
    
    return 1;
}

- (BOOL)tableView:(SKSTableView *)tableView shouldExpandSubRowsOfCellAtIndexPath:(NSIndexPath *)indexPath {
    
    return NO;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SKSTableViewCell *cell = [[SKSTableViewCell alloc] init];
    
    NSDictionary *dict = [self.arrData objectAtIndex:indexPath.row];
    
    UILabel *lblPrice = [self createLabelwithFrame:CGRectMake(5, 15, 100, 40)
                                           andText:[NSString stringWithFormat:@"$ %@ per month",[dict valueForKey:@"price"]]
                                      andNoOfLines:0
                                       andFontName:@""
                                     andFontHeight:14
                                        andBGColor:[UIColor clearColor]
                                      andTextColor:[UIColor whiteColor]
                                      andTextAlign:NSTextAlignmentLeft];
    [cell.contentView addSubview:lblPrice];
    
    UILabel *lblName = [self createLabelwithFrame:CGRectMake(105, 15, self.view.frame.size.width-210, 40)
                                          andText:[dict valueForKey:@"pack"]
                                     andNoOfLines:0
                                      andFontName:@""
                                    andFontHeight:16
                                       andBGColor:[UIColor clearColor]
                                     andTextColor:[UIColor whiteColor]
                                     andTextAlign:NSTextAlignmentCenter];
    [cell.contentView addSubview:lblName];
    
    UIImageView *imageVw = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width-60, 15, 40, 40)];
    imageVw.image = [UIImage imageNamed:@"globe"];
    [cell.contentView addSubview:imageVw];
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

-(UITableViewCell *)tableView:(SKSTableView *)tableView cellForSubRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
//    cell.textLabel.text = @"iOS";
    
    cell.backgroundColor = [UIColor magentaColor];
    
    viewDetails.frame = CGRectMake(0, 0, self.view.bounds.size.width, 300);
    
    [cell.contentView addSubview:viewDetails];
    
    return cell;
}

- (CGFloat)tableView:(SKSTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}

- (CGFloat)tableView:(SKSTableView *)tableView heightForSubRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 302;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"didSelectRowAtIndexPath");
    
}

-(void)tableView:(SKSTableView *)tableView didSelectSubRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"didSelectSubRowAtIndexPath");
}
*/


#pragma mark - Create Custome Label
-(UILabel *)createLabelwithFrame:(CGRect)lblFrame andText:(NSString *)strTitle andNoOfLines:(int)lines andFontName:(NSString *)fontName andFontHeight:(float)fontHeight andBGColor:(UIColor *)bgColor andTextColor:(UIColor *)textColor andTextAlign:(NSTextAlignment)textAlign{
    
    UILabel *lbl = [[UILabel alloc] initWithFrame:lblFrame];
    lbl.text = strTitle;
    lbl.textColor = textColor;
    lbl.backgroundColor = bgColor;
    lbl.font = [UIFont fontWithName:@"Helvetica Neue" size:fontHeight];
    lbl.numberOfLines = lines;
    lbl.textAlignment = textAlign;
    return lbl;
}



-(void)createViewwithData:(NSDictionary *)dict{
    
    UILabel *lblHeader = [self createLabelwithFrame:CGRectMake(8, 8, self.view.frame.size.width-16, 25)
                                            andText:[dict valueForKey:@"pack"]
                                       andNoOfLines:0
                                        andFontName:@""
                                      andFontHeight:15
                                         andBGColor:[UIColor clearColor]
                                       andTextColor:[UIColor whiteColor]
                                       andTextAlign:NSTextAlignmentCenter];
    
    
    [viewDetails addSubview:lblHeader];
}

@end
