//
//  ForgotPasswordCell.m
//  Stipend
//
//  Created by Naveen Katari on 01/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "ForgotPasswordCell.h"

@implementation ForgotPasswordCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)forgotPasswordButton:(id)sender
{
    if(self.forgotPasswordBlock)
    {
        self.forgotPasswordBlock();
    }
}
@end
