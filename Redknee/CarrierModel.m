//
//  CarrierModel.m
//  Redknee
//
//  Created by Sreekala on 31/01/16.
//  Copyright © 2016 Goutham. All rights reserved.
//

#import "CarrierModel.h"

@implementation CarrierModel

+ (CTCarrier *) carrier {
    
    if (NSClassFromString(@"CTTelephonyNetworkInfo") == nil) {
        
        return nil;
        
    }
    
    CTTelephonyNetworkInfo *netinfo = [[CTTelephonyNetworkInfo alloc] init];
    
    CTCarrier *carrier = [netinfo subscriberCellularProvider];
    
    return carrier;
    
}


+ (NSString *) carrierName {
    
    CTCarrier *carrier = [self carrier];
    
    if (carrier == nil) {
        
        return @"Unavailable";
        
    }
    
    return carrier.carrierName;
    
}



@end
