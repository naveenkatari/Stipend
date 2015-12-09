//
//  TableViewCell.m
//  Stipend
//
//  Created by Naveen Katari on 01/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "EmailAddressCell.h"

@implementation EmailAddressCell

- (void)awakeFromNib {
    [self.emailAddressLabel setHidden:YES];
    self.emailAddressTextfield.delegate =self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (IBAction)emailAddressCell:(id)sender
{
    [self.emailAddressLabel setHidden:NO];
    self.emailAddressTextfield.placeholder = nil;
    self.emailIDSeparatorView.backgroundColor = [UIColor colorWithRed:78.0f/255.0f green:208.0f/255.0f blue:225.0f/255.0f alpha:1];
}

- (IBAction)emailTextFieldDidEndEditing:(id)sender
{
    self.emailIDSeparatorView.backgroundColor = [UIColor colorWithRed:192.0f/255.0f green:192.0f/255.0f blue:192.0f/255.0f alpha:1];
    if ([self.emailAddressTextfield.text isEqualToString:@""]) {
        self.emailAddressTextfield.placeholder = @"Email Address";
        [self.emailAddressLabel setHidden:YES];
    }
}
- (IBAction)editingChanged:(id)sender
{
    if (self.checkEmailTextFieldLength) {
        self.checkEmailTextFieldLength();
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (self.setNextResponderForEmail) {
        self.setNextResponderForEmail();
    }
    return YES;
}

@end
