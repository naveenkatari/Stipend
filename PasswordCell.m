//
//  PasswordCell.m
//  Stipend
//
//  Created by Naveen Katari on 01/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "PasswordCell.h"

@implementation PasswordCell

- (void)awakeFromNib
{
    [self.passwordLabel setHidden:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (IBAction)passwordTextfieldDidBeginEditing:(id)sender
{
    [self.passwordLabel setHidden:NO];
    self.passwordTextField.placeholder = nil;
    self.passwordSeparatorView.backgroundColor = [UIColor colorWithRed:78.0f/255.0f green:208.0f/255.0f blue:225.0f/255.0f alpha:1];
}
- (IBAction)passwordTextFieldDidEndEditing:(id)sender
{
     self.passwordSeparatorView.backgroundColor = [UIColor colorWithRed:192.0f/255.0f green:192.0f/255.0f blue:192.0f/255.0f alpha:1];
}
@end
