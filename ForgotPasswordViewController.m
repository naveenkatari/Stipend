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

@interface ForgotPasswordViewController ()

@end

@implementation ForgotPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Forgot Your Password?";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) viewDidAppear:(BOOL)animated
{
    [self.emailAddressTextField becomeFirstResponder ];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)sendForgotPasswordLinkButton:(id)sender
{
    NSMutableDictionary *userEmailDictionary = [[NSMutableDictionary alloc]init];
    [userEmailDictionary setObject:self.emailAddressTextField.text forKey:@"emailId"];
    [self forgotPasswordDetailsResponse:@"POST" withParameters:userEmailDictionary];
    
}
-(void) forgotPasswordDetailsResponse : (NSString *)method withParameters: (NSMutableDictionary *)parameters
{
    __block UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc]
                                                     initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    activityView.center=self.view.center;
    activityView.color = [UIColor colorWithRed:77.0f/255.0f green:208.0f/255.0f blue:225.0f/255.0f alpha:0.75f];
    [activityView startAnimating];
    [self.view addSubview:activityView];

    [[APIClient sharedAPIClient] forgotPasswordOfUser:parameters WithCompletionHandler:^(NSDictionary *responseData, NSURLResponse *response, NSError *error)
    {
        if ([[responseData objectForKey:@"ErrorCode" ]  isEqualToNumber:[ NSNumber numberWithLong:0 ] ])
        {
        UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Password Sent Succesfully"
                                                         message:@"Password has been sent to your mail successfully"
                                                        delegate:self
                                               cancelButtonTitle:nil
                                               otherButtonTitles: @"OK", nil];
        [alert show];
        }

        NSLog(@"Server Response %@", responseData);
        [activityView stopAnimating];
    }];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
}
@end
