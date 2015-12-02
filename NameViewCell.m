//
//  NameViewCell.m
//  Stipend
//
//  Created by Naveen Katari on 02/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "NameViewCell.h"

@implementation NameViewCell

- (void)awakeFromNib {
    [self.firstNameLabel setHidden:YES];
    [self.lastNameLabel setHidden:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)firstNameTextField:(id)sender
{
    [self.firstNameLabel setHidden:NO];
    self.firstNameTextField.placeholder = nil;
}
- (IBAction)lastNameTextField:(id)sender
{
    [self.lastNameLabel setHidden:NO];
    self.lastNameTextField.placeholder = nil;
}

@end
