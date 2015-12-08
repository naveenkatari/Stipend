//
//  SignInStatusVC.m
//  Stipend
//
//  Created by Naveen Katari on 04/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "SignInStatusVC.h"
#import "UserDetails.h"

@implementation SignInStatusVC
-(void) viewDidLoad
{
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.title = @"Stipend";
    UserDetails *userDetails = [UserDetails sharedUserDetails];
    self.signInSuccessfulLabel.text = [NSString stringWithFormat:@"%@ %@ %@", self.signInSuccessfulLabel.text, userDetails.userFirstName, userDetails.userLastName];
    [self.signInSuccessfulLabel text];
}

@end
