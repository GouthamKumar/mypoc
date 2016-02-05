//
//  AppDelegate.m
//  Redknee
//
//  Created by Sreekala on 31/01/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import "AppDelegate.h"
#import "MFSideMenu.h"
#import "CarrierModel.h"
#import "WifiModel.h"
#import "Reachability.h"
#import <ifaddrs.h>
#import <net/if.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#import "Geotification.h"
#import "Utilities.h"
#import "PopUpViewController.h"

//#import "MTReachabilityManager.h"

@import CoreLocation;

@interface AppDelegate () <CLLocationManagerDelegate, PopupDelegate>

@property (nonatomic) Reachability *hostReachability;
@property (nonatomic) Reachability *internetReachability;
@property (nonatomic) Reachability *wifiReachability;

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) NSMutableArray *geotifications;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
    [[NSUserDefaults standardUserDefaults] setValue:@"no" forKey:@"enableGesture"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    //    NSString *remoteHostName = @"www.apple.com";
    //    self.hostReachability = [Reachability reachabilityWithHostName:remoteHostName];
    ////    [self.hostReachability startNotifier];
    ////    [self updateInterfaceWithReachability:self.hostReachability];
    //
    //    self.internetReachability = [Reachability reachabilityForInternetConnection];
    ////    [self.internetReachability startNotifier];
    ////    [self updateInterfaceWithReachability:self.internetReachability];
    //
    //    self.wifiReachability = [Reachability reachabilityForLocalWiFi];
    //    [self.wifiReachability startNotifier];
    //    [self updateInterfaceWithReachability:self.wifiReachability];
    
    [application setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
    
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont fontWithName:@"" size:16.0], NSFontAttributeName, nil]];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    MFSideMenuContainerViewController *container = (MFSideMenuContainerViewController *)self.window.rootViewController;
    UINavigationController *navigationController = [storyboard instantiateViewControllerWithIdentifier:@"navigationController"];
    UIViewController *leftSideMenuViewController = [storyboard instantiateViewControllerWithIdentifier:@"SideMenuViewController"];
    [container setLeftMenuViewController:leftSideMenuViewController];
    [container setCenterViewController:navigationController];
    
    [container setCenterViewController:navigationController];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert
                                                                                         | UIUserNotificationTypeBadge
                                                                                         | UIUserNotificationTypeSound) categories:nil];
    [application registerUserNotificationSettings:settings];
    
    
    [self performSelector:@selector(registerGeofencing) withObject:nil afterDelay:1.0];
    
    
    return YES;
}


-(void)registerGeofencing{
    
    self.locationManager = [CLLocationManager new];
    [self.locationManager setDelegate:self];
    [self.locationManager requestAlwaysAuthorization];
    self.geotifications = [NSMutableArray array];
    
    
    //Co-ordinates of the maumbai
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 19.076903148088462;
    coordinate.longitude = 72.867914822978236;
    CGFloat radius = 100000;
    NSString *identifier = [[NSUUID new] UUIDString];
    NSString *note = @"Welcome to Mumbai....!!";
    EventType eventType = OnEntry;  //(self.eventTypeSegmentedControl.selectedSegmentIndex == 0) ? OnEntry : OnExit;
    
    //Calling the the method to add the co-ordinates of the mumbai location to user NSUseDefaults
    [self addGeotificationCoordinate:coordinate radius:radius identifier:identifier note:note eventType:eventType];
    
    //Co-ordinates of the maumbai
    CLLocationCoordinate2D tcoordinate;
    tcoordinate.latitude = 35.6833;
    tcoordinate.longitude = 139.6833;
    CGFloat tradius = 100000;
    NSString *tidentifier = [[NSUUID new] UUIDString];
    NSString *tnote = @"Welcome to Tokyo....!!";
    EventType teventType = OnEntry;  //(self.eventTypeSegmentedControl.selectedSegmentIndex == 0) ? OnEntry : OnExit;
    
    //Calling the the method to add the co-ordinates of the mumbai location to user NSUseDefaults
    [self addGeotificationCoordinate:tcoordinate radius:tradius identifier:tidentifier note:tnote eventType:teventType];
    
    
    [self saveAllGeotifications];
    
    [self startGeotificationMonitoring];
}

-(BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray * _Nullable))restorationHandler{
    
    return YES;
}


-(void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler{
    
    
    //    dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    //        // Add code here to do background processing
    //        //
    //        //
    //
    //        [self scheduleLocalNotificationwithOUTMessage];
    //        NSLog(@"results of the background processing");
    //        dispatch_async( dispatch_get_main_queue(), ^{
    //            // Add code here to update the UI/send notifications based on the
    //            // results of the background processing
    //
    //
    //        });
    //    });
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChangedBG:) name:kReachabilityChangedNotification object:nil];
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    
    NSLog(@"applicationWillResignActive %ld",(long)[[UIApplication sharedApplication] applicationState]);
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChangedBG:) name:kReachabilityChangedNotification object:nil];
    //
    //    NSString *remoteHostName = @"www.google.co.in";
    //    self.hostReachability = [Reachability reachabilityWithHostName:remoteHostName];
    //    [self.hostReachability startNotifier];
    ////    [self updateInterfaceWithReachability:self.hostReachability];
    //
    //    self.internetReachability = [Reachability reachabilityForInternetConnection];
    ////    [self.internetReachability startNotifier];
    //    //    [self updateInterfaceWithReachability:self.internetReachability];
    //
    //    self.wifiReachability = [Reachability reachabilityForLocalWiFi];
    //    [self.wifiReachability startNotifier];
    //    //    [self updateInterfaceWithReachability:self.wifiReachability];
    //    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    //    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    
    self.locationTracker = [[LocationTracker alloc]init];
    [self.locationTracker startLocationTracking];
    
    //Send the best location to server every 60 seconds
    //You may adjust the time interval depends on the need of your app.
    NSTimeInterval time = 60.0;
    self.locationUpdateTimer =
    [NSTimer scheduledTimerWithTimeInterval:time
                                     target:self
                                   selector:@selector(updateLocation)
                                   userInfo:nil
                                    repeats:YES];
    
}

-(void)updateLocation {
    NSLog(@"updateLocation");
    
    [self.locationTracker updateLocationToServer];
    
    NSString *remoteHostName = @"www.apple.com";
    self.hostReachability = [Reachability reachabilityWithHostName:remoteHostName];
    [self.hostReachability startNotifier];
    [self updateInterfaceWithReachability:self.hostReachability];
    
    self.wifiReachability = [Reachability reachabilityForLocalWiFi];
    [self.wifiReachability startNotifier];
    //    [self updateInterfaceWithReachability:self.wifiReachability];
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Notification Methods

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    //[super application:application didReceiveLocalNotification:notification]; // In most case, you don't need this line
    UIApplicationState state = [application applicationState];
    if (state == UIApplicationStateInactive) {
        // Application was in the background when notification was delivered.
        
        NSLog(@"%@",notification.alertBody);
        
        NSArray *arr = [notification.alertBody componentsSeparatedByString:@"with "];
        NSLog(@"%@",arr);
        NSString *strSSID1 = [[NSUserDefaults standardUserDefaults] valueForKey:@"wifiSSID1"];
        NSString *strSSID2 = [[NSUserDefaults standardUserDefaults] valueForKey:@"wifiSSID2"];
        
        if (arr.count>1) {
            
            if ([[arr objectAtIndex:1] isEqualToString:strSSID1]) {
                
                
                NSLog(@"open popup");
                
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                
                PopUpViewController *popupVc = [storyboard instantiateViewControllerWithIdentifier:@"PopUpViewController"];
                popupVc.strWifi_Name = strSSID1;
                popupVc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
                popupVc.delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                [self.window.rootViewController presentViewController:popupVc animated:YES completion:nil];
                
            }
            else if ([[arr objectAtIndex:1] isEqualToString:strSSID2]){
                
                NSLog(@"open popup");
                
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                
                PopUpViewController *popupVc = [storyboard instantiateViewControllerWithIdentifier:@"PopUpViewController"];
                popupVc.strWifi_Name = strSSID2;
                popupVc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
                [self.window.rootViewController presentViewController:popupVc animated:YES completion:nil];
            }
            
        }
        
    }
}

-(void) dismissfromRootView:(UIViewController *)viewController{
    
    [self.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark Notification Handling



- (void) reachabilityChanged:(NSNotification *)note
{
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    [self updateInterfaceWithReachability:curReach];
}

- (void) reachabilityChangedBG:(NSNotification *)note
{
    
    //    [self isWiFiEnabled];
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    [self updateInterfaceWithReachability:curReach];
}

- (void)updateInterfaceWithReachability:(Reachability *)reachability
{
    NSLog(@"updateInterfaceWithReachability");
    
    
    if (reachability == self.hostReachability)
    {
        
        NetworkStatus netStatus = [reachability currentReachabilityStatus];
        BOOL connectionRequired = [reachability connectionRequired];
        
        BOOL statusF = (netStatus != ReachableViaWWAN);
        NSString* baseLabelText = @"";
        
        if (connectionRequired)
        {
            baseLabelText = NSLocalizedString(@"Cellular data network is available.\nInternet traffic will be routed through it after a connection is established.", @"Reachability text if a connection is required");
        }
        else
        {
            baseLabelText = NSLocalizedString(@"Cellular data network is active.\nInternet traffic will be routed through it.", @"Reachability text if a connection is not required");
        }
        
        NSLog(@"status %@, flag %d",baseLabelText,statusF);
    }
    
    
    [self configureReachability:reachability];
}

- (void)configureReachability:(Reachability *)reachability
{
    NetworkStatus netStatus = [reachability currentReachabilityStatus];
    BOOL connectionRequired = [reachability connectionRequired];
    NSString* statusString = @"";
    
    switch (netStatus)
    {
        case NotReachable:        {
            statusString = NSLocalizedString(@"Access Not Available", @"Text field text for access is not available");
            
            connectionRequired = NO;
            break;
        }
            
        case ReachableViaWWAN:        {
            
            NSString *strCarrierName = [CarrierModel carrierName];
            statusString = [NSString stringWithFormat:@"Reachable 3G/2G with %@",strCarrierName];
            //NSLocalizedString(@"Reachable WWAN", @"");
            break;
        }
        case ReachableViaWiFi:        {
            
            NSLog(@"%@",[WifiModel fetchSSIDInfo]);
            NSDictionary *dict = [NSDictionary dictionaryWithDictionary:[WifiModel fetchSSIDInfo]];
            NSString *strCarrierName = [NSString stringWithFormat:@"%@",[dict valueForKey:@"SSID"]];
            statusString = [NSString stringWithFormat:@"Reachable WiFi with %@",strCarrierName];
            [self scheduleLocalNotificationwithMessage:statusString];
            //            statusString= NSLocalizedString(@"Reachable WiFi", @"");
            break;
        }
    }
    
    if (connectionRequired)
    {
        NSString *connectionRequiredFormatString = NSLocalizedString(@"%@, Connection Required", @"Concatenation of status string with connection requirement");
        statusString= [NSString stringWithFormat:connectionRequiredFormatString, statusString];
    }
    
    NSLog(@"%@",statusString);
    
    
}

-(void)scheduleLocalNotificationwithMessage:(NSString *)strMessage{
    
    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:0];
    
    localNotification.alertTitle = @"Goutham";
    
    localNotification.alertTitle = strMessage;
    
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    localNotification.soundName = UILocalNotificationDefaultSoundName; // den den den
    
    //    localNotification.soundName = @"sound.caf";
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

-(void)scheduleLocalNotificationwithOUTMessage{
    
    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:0];
    
    localNotification.alertTitle = @"Hello";
    
    localNotification.alertBody = @"BG Notification";
    
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    localNotification.soundName = UILocalNotificationDefaultSoundName; // den den den
    
    localNotification.soundName = @"sound.caf";
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}


#pragma mark - Custom Methods

-(void)showAlertViewTitle:(NSString *)title andMessage:(NSString *)message andTag:(int)tagVal{
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    [controller addAction:okAction];
    
    
    
    [self.window.rootViewController presentViewController:controller animated:YES completion:nil];
    
}

//- (BOOL) isWiFiEnabled {
//
//    NSCountedSet * cset = [NSCountedSet new];
//
//    struct ifaddrs *interfaces;
//
//    if( ! getifaddrs(&interfaces) ) {
//        for( struct ifaddrs *interface = interfaces; interface; interface = interface->ifa_next) {
//            if ( (interface->ifa_flags & IFF_UP) == IFF_UP ) {
//                [cset addObject:[NSString stringWithUTF8String:interface->ifa_name]];
//            }
//        }
//    }
//
//    return [cset countForObject:@"awdl0"] > 1 ? YES : NO;
//}


//===============================GeoFencing=====================================================


#pragma mark - AddGeotificationsToMonitor

- (void)addGeotificationCoordinate:(CLLocationCoordinate2D)coordinate radius:(CGFloat)radius identifier:(NSString *)identifier note:(NSString *)note eventType:(EventType)eventType{
    
    CGFloat clampedRadius = (radius > self.locationManager.maximumRegionMonitoringDistance)?self.locationManager.maximumRegionMonitoringDistance : radius;
    Geotification *geotification = [[Geotification alloc] initWithCoordinate:coordinate radius:clampedRadius identifier:identifier note:note eventType:eventType];
    [self addGeotification:geotification];
}


#pragma mark - Functions that update the model/associated views with geotification changes

- (void)addGeotification:(Geotification *)geotification{
    [self.geotifications addObject:geotification];
    [self updateGeotificationsCount];
}

- (void)removeGeotification:(Geotification *)geotification{
    [self.geotifications removeObject:geotification];
    [self updateGeotificationsCount];
}

- (void)updateGeotificationsCount{
    //self.title = [NSString stringWithFormat:@"Geotifications (%lu)", (unsigned long)self.geotifications.count];
    //[self.navigationItem.rightBarButtonItem setEnabled:self.geotifications.count<20];
}



#pragma mark - Loading and saving functions

- (void)loadAllGeotifications{
    self.geotifications = [NSMutableArray array];
    
    NSArray *savedItems = [[NSUserDefaults standardUserDefaults] arrayForKey:kSavedItemsKey];
    if (savedItems) {
        for (id savedItem in savedItems) {
            Geotification *geotification = [NSKeyedUnarchiver unarchiveObjectWithData:savedItem];
            if ([geotification isKindOfClass:[Geotification class]]) {
                [self addGeotification:geotification];
            }
        }
    }
    
    NSLog(@"geotification count is %@ ", self.geotifications);
}

- (void)saveAllGeotifications{
    NSMutableArray *items = [NSMutableArray array];
    for (Geotification *geotification in self.geotifications) {
        id item = [NSKeyedArchiver archivedDataWithRootObject:geotification];
        [items addObject:item];
    }
    [[NSUserDefaults standardUserDefaults] setObject:items forKey:kSavedItemsKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - Geotifications

- (CLCircularRegion *)regionWithGeotification:(Geotification *)geotification{
    CLCircularRegion *region = [[CLCircularRegion alloc] initWithCenter:geotification.coordinate radius:geotification.radius identifier:geotification.identifier];
    [region setNotifyOnEntry:geotification.eventType==OnEntry];
    [region setNotifyOnExit:!region.notifyOnEntry];
    
    return region;
}

- (void)startMonitoringGeotification:(Geotification *)geotification{
    if (![CLLocationManager isMonitoringAvailableForClass:[CLCircularRegion class]]) {
        NSLog(@"Geofencing is not supported on this device!");
        //[Utilities showSimpleAlertWithTitle:@"Error" message:@"Geofencing is not supported on this device!" viewController:self.window.rootViewController];
        return;
    }
    
    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedAlways) {
        //[Utilities showSimpleAlertWithTitle:@"Warning" message:@"Your geotification is saved but will only be activated once you grant GeofencesTest permission to access the device location." viewController:self.window.rootViewController];
        NSLog(@"Your geotification is saved but will only be activated once you grant GeofencesTest permission to access the device location.");
    }
    
    CLCircularRegion *region = [self regionWithGeotification:geotification];
    [self.locationManager startMonitoringForRegion:region];
}

- (void)stopMonitoringGeotification:(Geotification *)geotification{
    for (CLCircularRegion *circularRegion in self.locationManager.monitoredRegions) {
        if ([circularRegion isKindOfClass:[CLCircularRegion class]]) {
            if ([circularRegion.identifier isEqualToString:geotification.identifier]) {
                [self.locationManager stopMonitoringForRegion:circularRegion];
            }
        }
    }
}


#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region{
    if ([region isKindOfClass:[CLCircularRegion class]]) {
        [self handleRegionEvent:region];
    }
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region{
    if ([region isKindOfClass:[CLCircularRegion class]]) {
        [self handleRegionEvent:region];
    }
}


-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"locationManager didFailWithError %@", error);
}

-(void)locationManager:(CLLocationManager *)manager monitoringDidFailForRegion:(CLRegion *)region withError:(NSError *)error {
    NSLog(@"locationManager monitoringDidFailForRegion %@ with eroor %@", region, error);
}


#pragma mark - Helpers

- (void)handleRegionEvent:(CLRegion *)region{
    if ([[UIApplication sharedApplication] applicationState] == UIApplicationStateActive) {
        NSString *message = [self noteFromRegionIdentifier:region.identifier];
        if (message) {
            UIViewController *viewController = self.window.rootViewController;
            if (viewController) {
                NSLog(@"UIAlertNotification is being sent since the app in foreground");
                [Utilities showSimpleAlertWithTitle:nil message:message viewController:viewController];
            }
        }
    }else{
        NSLog(@"UILocalNotification is being sent since the app in background");
        
        UILocalNotification *notification = [UILocalNotification new];
        [notification setAlertBody:[self noteFromRegionIdentifier:region.identifier]];
        [notification setSoundName:@"Default"];
        [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
    }
}

- (NSString *)noteFromRegionIdentifier:(NSString *)identifier{
    NSArray *savedItems = [[NSUserDefaults standardUserDefaults] arrayForKey:kSavedItemsKey];
    if(savedItems){
        for (id savedItem in savedItems) {
            Geotification *geotification = [NSKeyedUnarchiver unarchiveObjectWithData:savedItem];
            if ([geotification isKindOfClass:[Geotification class]]) {
                if ([geotification.identifier isEqualToString:identifier]) {
                    return geotification.note;
                }
            }
        }
    }
    return nil;
}


-(void)startGeotificationMonitoring {
    
    //Please stop all monitoring before you set the notification
    for (CLRegion *thisRegion in [self.locationManager monitoredRegions]) {
        NSLog(@"%@", thisRegion);
        [self.locationManager stopMonitoringForRegion:thisRegion];
    }
    
    NSArray *savedItems = [[NSUserDefaults standardUserDefaults] arrayForKey:kSavedItemsKey];
    
    if(savedItems){
        for (Geotification *savedItem in savedItems) {
            [self startMonitoringGeotification:[NSKeyedUnarchiver unarchiveObjectWithData:(NSData *)savedItem]];
        }
    }
}





@end