//
//  TableViewCell.m
//  Stipend
//
//  Created by Naveen Katari on 01/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "EmailAddressCell.h"
#import "UIColor+Additions.h"

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
    self.emailIDSeparatorView.backgroundColor = [UIColor CHActiveBlueColor];
}

- (IBAction)emailTextFieldDidEndEditing:(id)sender
{
    self.emailIDSeparatorView.backgroundColor = [UIColor CHSgiGrayColor];
    if ([self.emailAddressTextfield.text isEqualToString:@""]) {
        self.emailAddressTextfield.placeholder = @"Email Address";
        [self.emailAddressLabel setHidden:YES];
    }
}
- (IBAction)editingChanged:(id)sender
{
    UITextField *textfield = (UITextField *)sender;
    if (textfield.tag == )
    if (self.checkEmailTextFieldLength) {
        self.checkEmailTextFieldLength();
        self.emailAddressLabel.text = @"EMAIL ADDRESS";
        self.emailAddressLabel.textColor = [UIColor CHLabelGrayColor];
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
