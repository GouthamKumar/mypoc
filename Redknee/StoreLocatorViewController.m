//
//  StoreLocatorViewController.m
//  Redknee
//
//  Created by Goutham  S on 2/9/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import "StoreLocatorViewController.h"
#import "MFSideMenu.h"
#import "MyLocation.h"

#define METERS_PER_MILE 1609.344

@interface StoreLocatorViewController ()

@end

@implementation StoreLocatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    // 1
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 12.97549;
    zoomLocation.longitude= 77.7293;
    
    MKCoordinateSpan spn;
    spn.latitudeDelta = 0.5;
    spn.longitudeDelta = 0.5;
    
    MKCoordinateRegion region;
    region.center = zoomLocation;
    region.span = spn;
    
    // 2
//    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    
    // 3
    [_mapView setRegion:region animated:YES];
    
    
    CLLocationCoordinate2D tcsVydehi;
    tcsVydehi.latitude = 12.97549;
    tcsVydehi.longitude= 77.7293;
    MyLocation *annotation1 = [[MyLocation alloc] initWithName:@"Location 1" address:@"Bangalore" coordinate:tcsVydehi] ;
    [_mapView addAnnotation:annotation1];
    
    
    CLLocationCoordinate2D tcsPoineer;
    tcsPoineer.latitude = 12.9826;
    tcsPoineer.longitude= 77.7367;
    MyLocation *annotation2 = [[MyLocation alloc] initWithName:@"Location 2" address:@"Bangalore" coordinate:tcsPoineer] ;
    
    
    [_mapView addAnnotation:annotation2];
    
    CLLocationCoordinate2D manyatha;
    manyatha.latitude = 13.0426;
    manyatha.longitude= 77.62;
    MyLocation *annotation3 = [[MyLocation alloc] initWithName:@"Location 3" address:@"Bangalore" coordinate:manyatha] ;
    
    
    [_mapView addAnnotation:annotation3];
    
    CLLocationCoordinate2D vidhan;
    vidhan.latitude = 12.9397;
    vidhan.longitude= 77.5907;
    MyLocation *annotation4 = [[MyLocation alloc] initWithName:@"Location 4" address:@"Bangalore" coordinate:vidhan] ;
    
    
    [_mapView addAnnotation:annotation4];
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

@end
