//
//  TableViewCell.h
//  Stipend
//
//  Created by Naveen Katari on 01/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmailAddressCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *emailAddressLabel;
@property (weak, nonatomic) IBOutlet UITextField *emailAddressTextfield;
@property (nonatomic, strong) void (^emailTextFieldActionBlock)();
@property (weak, nonatomic) IBOutlet UIView *emailIDSeparatorView;

@end
