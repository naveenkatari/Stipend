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
    self.passwordTextField.delegate = self;
    [self.passwordLabel setHidden:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
//- (IBAction)passwordTextFieldEditingChanged:(id)sender
//{
//    [self.passwordLabel setHidden:NO];
//}

- (IBAction)passwordTextfieldDidBeginEditing:(id)sender
{
    [self.passwordLabel setHidden:NO];
    self.passwordTextField.placeholder = nil;
    self.passwordSeparatorView.backgroundColor = [UIColor colorWithRed:78.0f/255.0f green:208.0f/255.0f blue:225.0f/255.0f alpha:1];
}
- (IBAction)passwordTextFieldDidEndEditing:(id)sender
{

    
    self.passwordSeparatorView.backgroundColor = [UIColor colorWithRed:192.0f/255.0f green:192.0f/255.0f blue:192.0f/255.0f alpha:1];
    UITextField *textfield = (UITextField *)sender;
 
    if (textfield.tag == 1)
    {
        if ([self.passwordTextField.text isEqualToString:@""]) {
            self.passwordTextField.placeholder = @"Password";
            [self.passwordLabel setHidden:YES];

    }
    }
    else if (textfield.tag == 2)
    {
        if ([self.passwordTextField.text isEqualToString:@""]) {
            self.passwordTextField.placeholder = @"Password";
            [self.passwordLabel setHidden:YES];
            
        }
    }
    else if (textfield.tag == 3)
    {
        if ([self.passwordTextField.text isEqualToString:@""]) {
            self.passwordTextField.placeholder = @"Confirm Password";
            [self.passwordLabel setHidden:YES];

    }
    }
    }
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    if (self.setNextResponderForPassword) {
        self.setNextResponderForPassword();
    }
    return YES;
}
- (IBAction)passwordTextFieldEditingChanged:(id)sender
{
    UITextField *textfield = (UITextField *)sender;
    if (textfield.tag == 1) {
    if (self.checkPasswordTextFieldLength) {
        self.checkPasswordTextFieldLength();
    }
    }
}
@end
