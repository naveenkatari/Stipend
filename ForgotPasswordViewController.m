//
//  ForgotPasswordViewController.m
//  Stipend
//
//  Created by Naveen Katari on 02/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "ForgotPasswordViewController.h"
#import "APIClient.h"
#import "APIClient+ForgotPassword.h"
#import "ActivityIndicatorView.h"
#import "WelcomeScreenController.h"
#import "UIColor+Additions.h"
#import "Validations.h"

@interface ForgotPasswordViewController ()

@end

@implementation ForgotPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Forgot Your Password?";
    [self.emailIdValidationLabel setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) viewDidAppear:(BOOL)animated
{
    [self.emailAddressTextField becomeFirstResponder ];
}
#pragma mark - TextField delegate methods
- (IBAction)emailTextFieldEditingDidBEegin:(id)sender
{
    self.emailIdUnderlineView.backgroundColor = [UIColor CHActiveBlueColor];
}
- (IBAction)emailTextFieldEditingDidEnd:(id)sender
{
    self.emailIdUnderlineView.backgroundColor = [UIColor CHSgiGrayColor];
}
- (IBAction)emailTexyFieldEditingChanged:(id)sender
{
    [self.emailIdValidationLabel setHidden:YES];
}

- (IBAction)sendForgotPasswordLinkButton:(id)sender
{
    NSString *emailID = self.emailAddressTextField.text;
    Validations *validations  = [[Validations alloc] init];
    if(![validations validateEmail:emailID])
    {
        self.emailIdValidationLabel.text =  @"ENTER VALID EMAIL ADDRESS";
        [self.emailIdValidationLabel setHidden:NO];
    }
    else
    {
        [self.emailIdValidationLabel setHidden:YES];
        NSMutableDictionary *userEmailDictionary = [[NSMutableDictionary alloc]init];
        [userEmailDictionary setObject:self.emailAddressTextField.text forKey:@"emailId"];
        [self forgotPasswordDetailsResponse:@"POST" withParameters:userEmailDictionary];
    }
    
}
-(void) forgotPasswordDetailsResponse : (NSString *)method withParameters: (NSMutableDictionary *)parameters
{
    ActivityIndicatorView *activityView = [[NSBundle mainBundle] loadNibNamed:@"ActivityIndicatorView" owner:self options:nil][0];
    [self.view addSubview:activityView];
    activityView.center = self.view.center;
    
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    
    
    [[APIClient sharedAPIClient] forgotPasswordOfUser:parameters WithCompletionHandler:^(NSDictionary *responseData, NSURLResponse *response, NSError *error)
    {
        if ([[responseData objectForKey:@"Status"] isEqualToString:@"Password sent to your Email Successfully"]) {
           
            [self showALertView:@"Password Sent Succesfully" :@"Password has been sent to your mail successfully"];
        }
        else if ([[responseData objectForKey:@"Status"] isEqualToString:@"Email doesn't Exixts"]) {
            
            [self showALertView:@"Email Doesn't Exists" :@"This email is not registered"];
        }
       else if ([[responseData objectForKey:@"ErrorCode" ]  isEqualToNumber:[ NSNumber numberWithLong: -1] ])
       {
           [self showALertView:@"Failure" :@"Request is failed, please try again"];
       }

        NSLog(@"Server Response %@", responseData);
        [activityView setHidden:YES];
        [[UIApplication sharedApplication]endIgnoringInteractionEvents];
    }];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([alertView.title isEqualToString:@"Password Sent Succesfully"])
    {
        WelcomeScreenController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"WelcomeScreen"];
        [self showViewController:viewController sender:self];
    }
}

-(void) showALertView : (NSString *) title : (NSString *) message {
    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:title
                                                     message:message
                                                    delegate:self
                                           cancelButtonTitle:nil
                                           otherButtonTitles: @"OK", nil];
    [alert show];
}



@end
