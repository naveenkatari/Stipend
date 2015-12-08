//
//  NameViewCell.h
//  Stipend
//
//  Created by Naveen Katari on 02/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NameViewCell : UITableViewCell <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UIView *firstNameSeparatorView;
@property (weak, nonatomic) IBOutlet UIView *lastNameSeparatorView;
@property (nonatomic, strong) void (^setNextResponderForFirstName)(UITextField *textField);
@property (nonatomic, strong) void (^setNextResponderForlastName)(UITextField *textField);

@end
