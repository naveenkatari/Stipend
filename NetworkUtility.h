//
//  NetworkUtility.h
//  Stipend
//
//  Created by Naveen Katari on 10/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"
#import <SystemConfiguration/SystemConfiguration.h>

@class Reachability;

@interface NetworkUtility : NSObject
{
    Reachability *internetReachable;
    Reachability *hostReachable;
}

@property BOOL internetActive;
@property BOOL hostActive;
-(BOOL) checkNetworkStatus;

@end
