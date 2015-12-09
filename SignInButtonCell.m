//
//  SignInButtonCell.m
//  Stipend
//
//  Created by Naveen Katari on 01/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "SignInButtonCell.h"
#import "EmailAddressCell.h"

@implementation SignInButtonCell
{
    Validations *validations;
    EmailAddressCell *emailCell;
}

- (void)awakeFromNib {
    [self.signInButton setEnabled:NO];
    self.signInButton.backgroundColor = [UIColor colorWithRed:165.0f/255.0f green:225.0f/255.0f blue:233.0f/255.0f alpha:1];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)signinButton:(id)sender
{
    
    if(self.signActionBlock) {
        self.signActionBlock();
    }
    
//    self.signActionBlock = ^{
//        if ([validations validateEmail:emailCell.emailAddressTextfield.text] == NO) {
//            emailCell.emailAddressLabel.text = @"Enter valid email address";
//        }
//    };
}
@end
