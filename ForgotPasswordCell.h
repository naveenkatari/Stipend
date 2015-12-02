//
//  ForgotPasswordCell.h
//  Stipend
//
//  Created by Naveen Katari on 01/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgotPasswordCell : UITableViewCell

- (IBAction)forgotPasswordButton:(id)sender;
@property (nonatomic, strong) void (^forgotPasswordBlock)();

@end
