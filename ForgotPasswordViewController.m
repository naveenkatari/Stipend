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
-(void) viewWillAppear:(BOOL)animated
{
    
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
    [[APIClient sharedAPIClient] forgotPasswordOfUser:parameters WithCompletionHandler:^(NSDictionary *responseData, NSURLResponse *response, NSError *error)
    {
        NSLog(@"Server Response %@", responseData);
    }];
}
@end
