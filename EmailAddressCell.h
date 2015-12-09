//
//  TableViewCell.h
//  Stipend
//
//  Created by Naveen Katari on 01/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmailAddressCell : UITableViewCell <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *emailAddressLabel;
@property (weak, nonatomic) IBOutlet UITextField *emailAddressTextfield;
@property (weak, nonatomic) IBOutlet UIView *emailIDSeparatorView;
@property (nonatomic, strong) void (^setFirstResponderTextFieldBlock)();
@property (nonatomic, strong) void (^setNextResponderForEmail)();
@property (nonatomic, strong) void (^checkEmailTextFieldLength)();

@end
