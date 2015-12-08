//
//  SignUpButtonCell.h
//  Stipend
//
//  Created by Naveen Katari on 03/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpButtonCell : UITableViewCell

- (IBAction)signUpButton:(id)sender;
@property (nonatomic, strong) void (^signUpActionBlock)();
@property (weak, nonatomic) IBOutlet UILabel *signUpErrorValidationLabel;

@end
