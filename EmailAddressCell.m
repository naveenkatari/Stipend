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
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)emailAddressCell:(id)sender
{
    [self.emailAddressLabel setHidden:NO];
    self.emailAddressTextfield.placeholder = nil;
    if (self.emailTextFieldActionBlock) {
        self.emailTextFieldActionBlock();
    }

}
//- (IBAction)emailTextFieldDidEndEditing:(id)sender
//{
//    if (self.emailTextFieldActionBlock) {
//        self.emailTextFieldActionBlock();
//    }
//}

@end
