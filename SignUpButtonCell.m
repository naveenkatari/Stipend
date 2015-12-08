//
//  SignUpButtonCell.m
//  Stipend
//
//  Created by Naveen Katari on 03/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "SignUpButtonCell.h"

@implementation SignUpButtonCell

- (void)awakeFromNib {
    [self.signUpErrorValidationLabel setHidden:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)signUpButton:(id)sender
{
    if (self.signUpActionBlock) {
        self.signUpActionBlock();
    }
}

@end
