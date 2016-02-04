//
//  CurrentPlansViewController.m
//  Redknee
//
//  Created by Sreekala on 01/02/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import "CurrentPlansViewController.h"

@interface CurrentPlansViewController ()

@end

@implementation CurrentPlansViewController

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
#pragma mark - UIcollectionview Methods

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 2;
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"currentPlanCell" forIndexPath:indexPath];
    
    UILabel *lblPrice = (UILabel *)[cell viewWithTag:1];
    
    
    if (indexPath.row%2 == 0) {
        
        lblPrice.textColor = [UIColor colorWithRed:255/255.0 green:159/255.0 blue:64/255.0 alpha:1];
    }
    else{
        
        lblPrice.textColor = [UIColor colorWithRed:156/255.0 green:255/255.0 blue:124/255.0 alpha:1];
    }
    
    return cell;
}

-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(self.view.frame.size.width, 152);
}



@end
