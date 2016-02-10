//
//  StoreLocatorViewController.h
//  Redknee
//
//  Created by Goutham  S on 2/9/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface StoreLocatorViewController : UIViewController
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)btnMenuTapped:(id)sender;

@end
