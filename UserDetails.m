//
//  UserDetails.m
//  Stipend
//
//  Created by Naveen Katari on 04/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "UserDetails.h"

@implementation UserDetails
+(UserDetails *) sharedDetails
{
    static UserDetails *sharedUserDetails = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedUserDetails = [[self alloc]init];
    });
    return sharedUserDetails;
}

@end
