//
//  UserDetails.m
//  Stipend
//
//  Created by Naveen Katari on 08/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "UserDetails.h"

@implementation UserDetails
+(UserDetails *)sharedUserDetails
{
    static UserDetails *sharedMyDetails = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyDetails = [[self alloc]init];
    });
    return sharedMyDetails;
}
-(id) init {
    if(self = [super init])
    {
        self.userFirstName = @"";
        self.userLastName = @"";
    }
    return self;
}
@end
