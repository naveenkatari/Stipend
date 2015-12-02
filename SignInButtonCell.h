//
//  SignInButtonCell.h
//  Stipend
//
//  Created by Naveen Katari on 01/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Validations.h"

@interface SignInButtonCell : UITableViewCell

- (IBAction)signinButton:(id)sender;
@property (nonatomic, strong) void (^signActionBlock)();

@end
