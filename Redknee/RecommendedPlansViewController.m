//
//  RecommendedPlansViewController.m
//  Redknee
//
//  Created by Sreekala on 01/02/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import "RecommendedPlansViewController.h"
#import "SKSTableViewCell.h"

@interface RecommendedPlansViewController ()<SKSTableViewDelegate>{
    
    UIView *viewDetails;
}

@property (nonatomic, retain) NSMutableArray *arrData;


@end

@implementation RecommendedPlansViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.SKSTableViewDelegate = self;
    self.tableView.shouldExpandOnlyOneCell = TRUE;
    
    self.arrData = [[NSMutableArray alloc] init];
    
    // Do any additional setup after loading the view.
    
    [self.arrData removeAllObjects];
    
    
    viewDetails = [[[NSBundle mainBundle] loadNibNamed:@"CommonView" owner:self options:nil] objectAtIndex:0];
    viewDetails.frame = CGRectMake(0, 2, self.view.frame.size.width, 300);
    
    
    NSString *strSSID1 = [[NSUserDefaults standardUserDefaults] valueForKey:@"wifiMessage1"];
    NSString *strSSID2 = [[NSUserDefaults standardUserDefaults] valueForKey:@"wifiMessage2"];
    
    NSString *strMessage = [[NSUserDefaults standardUserDefaults] valueForKey:@"selectedMessage"];
    
    if ([strMessage isEqualToString:strSSID1]) {
        
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *strPack = [defaults valueForKey:@"wifiPack1"];
        NSString *strVoice = [defaults valueForKey:@"wifiVoice1"];
        NSString *strData = [defaults valueForKey:@"wifiData1"];
        NSString *strPrice = [defaults valueForKey:@"wifiPrice1"];
        
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setValue:strPack forKey:@"pack"];
        [dict setValue:strVoice forKey:@"voice"];
        [dict setValue:strData forKey:@"data"];
        [dict setValue:strPrice forKey:@"price"];
        
        [self.arrData addObject:dict];
        
        
    }
    else if ([strMessage isEqualToString:strSSID2]){
        
        
    }
    
}


-(void) viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
    
//    [self.tableView reloadData];
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
