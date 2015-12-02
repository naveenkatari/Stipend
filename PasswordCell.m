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

    // Configure the view for the selected state
}

- (IBAction)passwordTextfieldDidBeginEditing:(id)sender
{
    [self.passwordLabel setHidden:NO];
    self.passwordTextField.placeholder = nil;
    if(self.passwordTextFieldActionBlock){
        self.passwordTextFieldActionBlock();
    }
}
@end
