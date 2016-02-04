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

//#import "MTReachabilityManager.h"

@interface AppDelegate ()

@property (nonatomic) Reachability *hostReachability;
@property (nonatomic) Reachability *internetReachability;
@property (nonatomic) Reachability *wifiReachability;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
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
////    [self updateInterfaceWithReachability:self.wifiReachability];
    
    [application setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
    
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont fontWithName:@"" size:14.0], NSFontAttributeName, nil]];
    
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
//    [MTReachabilityManager sharedManager];
    
    return YES;
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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChangedBG:) name:kReachabilityChangedNotification object:nil];
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    
    NSLog(@"applicationWillResignActive %ld",(long)[[UIApplication sharedApplication] applicationState]);
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChangedBG:) name:kReachabilityChangedNotification object:nil];
    
    NSString *remoteHostName = @"www.google.co.in";
    self.hostReachability = [Reachability reachabilityWithHostName:remoteHostName];
    [self.hostReachability startNotifier];
//    [self updateInterfaceWithReachability:self.hostReachability];
    
    self.internetReachability = [Reachability reachabilityForInternetConnection];
//    [self.internetReachability startNotifier];
    //    [self updateInterfaceWithReachability:self.internetReachability];
    
    self.wifiReachability = [Reachability reachabilityForLocalWiFi];
    [self.wifiReachability startNotifier];
    //    [self updateInterfaceWithReachability:self.wifiReachability];
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
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
    } else {
        
    }
}

#pragma mark -
#pragma mark Notification Handling

/*!
 * Called by Reachability whenever status changes.
 */

- (void) reachabilityChanged:(NSNotification *)note
{
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    [self updateInterfaceWithReachability:curReach];
}

- (void) reachabilityChangedBG:(NSNotification *)note
{
    
    [self isWiFiEnabled];
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
            /*
             Minor interface detail- connectionRequired may return YES even when the host is unreachable. We cover that up here...
             */
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
    

    [self scheduleLocalNotificationwithMessage:statusString];
    
    [self showAlertViewTitle:@"Message" andMessage:statusString andTag:0];
    
    
}

-(void)scheduleLocalNotificationwithMessage:(NSString *)strMessage{
    
    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:0];
    
    localNotification.alertBody = strMessage;
    
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    localNotification.soundName = UILocalNotificationDefaultSoundName; // den den den
    
    localNotification.soundName = @"sound.caf";
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

-(void)scheduleLocalNotificationwithOUTMessage{
    
    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:0];
    
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

- (BOOL) isWiFiEnabled {
    
    NSCountedSet * cset = [NSCountedSet new];
    
    struct ifaddrs *interfaces;
    
    if( ! getifaddrs(&interfaces) ) {
        for( struct ifaddrs *interface = interfaces; interface; interface = interface->ifa_next) {
            if ( (interface->ifa_flags & IFF_UP) == IFF_UP ) {
                [cset addObject:[NSString stringWithUTF8String:interface->ifa_name]];
            }
        }
    }
    
    return [cset countForObject:@"awdl0"] > 1 ? YES : NO;
}

@end
