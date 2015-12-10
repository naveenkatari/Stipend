//
//  NetworkUtility.m
//  Stipend
//
//  Created by Naveen Katari on 10/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "NetworkUtility.h"
#import "Reachability.h"
@implementation NetworkUtility

//+(BOOL) isNetworkAvailable
//{
//       
//}
-(id)init {
    self = [super init];
    if(self) {
        
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkNetworkStatus) name:kReachabilityChangedNotification object:nil];
    
    internetReachable = [Reachability reachabilityForInternetConnection];
    [internetReachable startNotifier];
    
    hostReachable = [Reachability reachabilityWithHostName:@"http://mystipendappelasticloadbalancer-178615218.us-west-2.elb.amazonaws.com:8080/Stipend"];
    [hostReachable startNotifier];
    
    return self;
}

-(BOOL) checkNetworkStatus
{
    NetworkStatus internetStatus = [internetReachable currentReachabilityStatus];

    

        switch (internetStatus)
        {
            case NotReachable:
                
                self.internetActive = NO;
                break;
            
            case ReachableViaWiFi:
              
                if([internetReachable connectionRequired])

                {
                    self.internetActive = YES;
                    break;
                }
            case ReachableViaWWAN:
                if([internetReachable connectionRequired])
                {
                    self.internetActive = YES;
                    break;
                }
        }
    return self.internetActive;
}
@end
