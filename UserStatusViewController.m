//
//  SignInStatusVC.m
//  Stipend
//
//  Created by Naveen Katari on 04/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "UserStatusViewController.h"
#import "UserDetails.h"

@implementation UserStatusViewController
-(void) viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.title = @"Stipend";
    UserDetails *userDetails = [UserDetails sharedUserDetails];
    if ([self.successStatus isEqualToString:@"SignIn"])
    {
        self.userSuccessLabel.text = [NSString stringWithFormat:@"%@ %@ %@", @"Signed In as", userDetails.userFirstName, userDetails.userLastName];
        [self.userSuccessLabel text];
    }
    else if ([self.successStatus isEqualToString:@"SignUp"])
    {
        self.userSuccessLabel.text = @"Signed up for College Hunch Successfully";
    }

}

@end
