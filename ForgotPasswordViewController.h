//
//  ForgotPasswordViewController.h
//  Stipend
//
//  Created by Naveen Katari on 02/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgotPasswordViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *emailAddressTextField;
@property (weak, nonatomic) IBOutlet UIView *emailIdUnderlineView;
@property (weak, nonatomic) IBOutlet UILabel *emailIdValidationLabel;
@property (weak, nonatomic) IBOutlet UIButton *sendEmailButton;

- (IBAction)sendForgotPasswordLinkButton:(id)sender;
@end
