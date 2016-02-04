//
//  WifiModel.m
//  Redknee
//
//  Created by Sreekala on 01/02/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import "WifiModel.h"

@implementation WifiModel


/** Returns first non-empty SSID network info dictionary.
 *  @see CNCopyCurrentNetworkInfo */
+ (NSDictionary *)fetchSSIDInfo
{
//    NSArray *interfaceNames = CFBridgingRelease(CNCopySupportedInterfaces());
//    NSLog(@"%s: Supported interfaces: %@", __func__, interfaceNames);
//    
//    NSDictionary *SSIDInfo;
//    for (NSString *interfaceName in interfaceNames) {
//        SSIDInfo = CFBridgingRelease(
//                                     CNCopyCurrentNetworkInfo((__bridge CFStringRef)interfaceName));
//        NSLog(@"%s: %@ => %@", __func__, interfaceName, SSIDInfo);
//        
//        BOOL isNotEmpty = (SSIDInfo.count > 0);
//        if (isNotEmpty) {
//            break;
//        }
//    }
//    return SSIDInfo;
    
    NSArray *ifs = (__bridge_transfer NSArray *)CNCopySupportedInterfaces();
    NSLog(@"Supported interfaces: %@", ifs);
    NSDictionary *info;
    for (NSString *ifnam in ifs) {
        info = (__bridge_transfer NSDictionary *)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
//        NSLog(@"%@ => %@", ifnam, info);
        if (info && [info count]) {
            break;
        }
    }
    return info;
}

-(void)getWifi{
    
    NSArray * networkInterfaces = [NEHotspotHelper supportedNetworkInterfaces];
    NSLog(@"Networks %@",networkInterfaces);
}

- (id)fetchSSIDInfo {
    NSArray *ifs = (__bridge_transfer NSArray *)CNCopySupportedInterfaces();
    NSLog(@"Supported interfaces: %@", ifs);
    NSDictionary *info;
    for (NSString *ifnam in ifs) {
        info = (__bridge_transfer NSDictionary *)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        NSLog(@"%@ => %@", ifnam, info);
        if (info && [info count]) { break; }
    }
    return info;
}

@end

