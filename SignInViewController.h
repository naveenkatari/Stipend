//
//  SignInViewController.h
//  Stipend
//
//  Created by Naveen Katari on 30/11/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmailAddressCell.h"
#import "PasswordCell.h"
#import "ForgotPasswordCell.h"
#import "SignInButtonCell.h"

@interface SignInViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *signInTableView;

@end
