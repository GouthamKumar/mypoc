//
//  RecommendedPlansViewController.m
//  Redknee
//
//  Created by Sreekala on 01/02/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import "RecommendedPlansViewController.h"
#import "SKSTableViewCell.h"

@interface RecommendedPlansViewController ()<SKSTableViewDelegate>

@end

@implementation RecommendedPlansViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.SKSTableViewDelegate = self;
    self.tableView.shouldExpandOnlyOneCell = TRUE;
    
    
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
 
 Thanks for being purchased this plan !! Observe the same under current plan.
*/


#pragma mark - TableView Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
    
}

- (NSInteger)tableView:(SKSTableView *)tableView numberOfSubRowsAtIndexPath:(NSIndexPath *)indexPath {
    
    return 1;
}

- (BOOL)tableView:(SKSTableView *)tableView shouldExpandSubRowsOfCellAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0){
        
        return YES;
    }
    else{
        
        return NO;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SKSTableViewCell *cell = [[SKSTableViewCell alloc] init];
    
    UILabel *lblPrice = [self createLabelwithFrame:CGRectMake(5, 15, 100, 40)
                                           andText:@"$ 20 per month"
                                      andNoOfLines:0
                                       andFontName:@""
                                     andFontHeight:14
                                        andBGColor:[UIColor clearColor]
                                      andTextColor:[UIColor whiteColor]
                                      andTextAlign:NSTextAlignmentLeft];
    [cell.contentView addSubview:lblPrice];
    
    UILabel *lblName = [self createLabelwithFrame:CGRectMake(105, 15, self.view.frame.size.width-210, 40)
                                          andText:@"Unlimited voice & data"
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
    
    cell.textLabel.text = @"iOS";
    
    return cell;
}

- (CGFloat)tableView:(SKSTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}

- (CGFloat)tableView:(SKSTableView *)tableView heightForSubRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 150;
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


@end
