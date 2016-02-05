//
//  AppDelegate.h
//  Redknee
//
//  Created by Sreekala on 31/01/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationTracker.h"

static NSString *kSavedItemsKey = @"savedItems";

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property LocationTracker * locationTracker;
@property (nonatomic) NSTimer* locationUpdateTimer;

@end

