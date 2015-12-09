//
//  NameViewCell.m
//  Stipend
//
//  Created by Naveen Katari on 02/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "NameViewCell.h"
#import "UIColor+Additions.h"

@implementation NameViewCell

- (void)awakeFromNib {
    [self.firstNameLabel setHidden:YES];
    [self.lastNameLabel setHidden:YES];
    self.firstNameTextField.delegate = self;
    self.lastNameTextField.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)firstNameTextField:(id)sender
{
    [self.firstNameLabel setHidden:NO];
    self.firstNameSeparatorView.backgroundColor = [UIColor CHActiveBlueColor];
    self.firstNameTextField.placeholder = nil;
}
- (IBAction)firstNameTextFieldEditingDidEnd:(id)sender
{
    self.firstNameSeparatorView.backgroundColor = [UIColor CHSgiGrayColor];
    if ([self.firstNameTextField.text isEqualToString:@""]) {
        self.firstNameTextField.placeholder = @"First Name";
        [self.firstNameLabel setHidden:YES];
    }
}

- (IBAction)lastNameTextField:(id)sender
{
    [self.lastNameLabel setHidden:NO];
    self.lastNameTextField.placeholder = nil;
    self.lastNameSeparatorView.backgroundColor = [UIColor CHActiveBlueColor];
}
- (IBAction)lastNameTextFieldEditingDidEnd:(id)sender
{
    self.lastNameSeparatorView.backgroundColor = [UIColor CHSgiGrayColor];
    if ([self.lastNameTextField.text isEqualToString:@""]) {
        self.lastNameTextField.placeholder = @"Last Name";
        [self.lastNameLabel setHidden:YES];
    }

}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField == self.firstNameTextField) {
        
        if (self.setNextResponderForFirstName)
        {
            self.setNextResponderForFirstName(textField);
        }
        
    } else if (textField == self.lastNameTextField) {
        
        if (self.setNextResponderForlastName){
            self.setNextResponderForlastName(textField);
        }
    }
    
    return YES;
}


@end
