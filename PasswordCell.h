//
//  PasswordCell.h
//  Stipend
//
//  Created by Naveen Katari on 01/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PasswordCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *passwordLabel;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (nonatomic, strong) void (^passwordTextFieldActionBlock)();
@property (weak, nonatomic) IBOutlet UIView *passwordSeparatorView;

@end
