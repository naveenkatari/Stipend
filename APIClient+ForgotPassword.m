//
//  APIClient+ForgotPassword.m
//  Stipend
//
//  Created by Naveen Katari on 04/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "APIClient+ForgotPassword.h"

@implementation APIClient (ForgotPassword)
-(void) forgotPasswordOfUser:(NSDictionary *)parameters WithCompletionHandler:(void (^)(NSDictionary *, NSURLResponse *, NSError *))completionHandler
{
    [self POST:@"forgotPassword" withParameters:parameters withCompletionHandler:completionHandler];
}

@end
