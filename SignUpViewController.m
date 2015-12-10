//
//  SignUpViewController.m
//  Stipend
//
//  Created by Naveen Katari on 30/11/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "SignUpViewController.h"
#import "NameViewCell.h"
#import "EmailAddressCell.h"
#import "PasswordCell.h"
#import "SignUpButtonCell.h"
#import "Validations.h"
#import "APIClient+SignUpAPI.h"
#import "APIClient.h"
#import "ActivityIndicatorView.h"
#import "UserStatusViewController.h"

@interface SignUpViewController ()
{
    Validations *validations;
    NSMutableData *mutableData;
    UITextField *activeTextField;
}

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.tableView registerNib:[UINib nibWithNibName:@"NameViewCell" bundle:nil] forCellReuseIdentifier:@"NameCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"EmailAddressCell" bundle:nil] forCellReuseIdentifier:@"EmailCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"PasswordCell" bundle:nil] forCellReuseIdentifier:@"PasswordCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"SignUpButtonCell" bundle:nil] forCellReuseIdentifier:@"SignUpCell"];
   self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) viewDidAppear:(BOOL)animated
{
    [self setFirstNameTextFieldFirstResponder];
}
#pragma mark - TableView delegate methods
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0f;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
    NameViewCell *cell = (NameViewCell *)[tableView dequeueReusableCellWithIdentifier:@"NameCell" forIndexPath:indexPath];
        __weak SignUpViewController *weakSelf = self;
        cell.setNextResponderForFirstName = ^(UITextField *textField){
            [weakSelf nextResponderWithTag:indexPath.row withTextField:textField];
        };
        __weak SignUpViewController *weakSelf1 = self;
        cell.setNextResponderForlastName = ^(UITextField *textField){
            [weakSelf1 nextResponderWithTag:indexPath.row withTextField:textField];
        };
    return cell;
    }
   else if (indexPath.row == 1)
    {
        EmailAddressCell *cell = (EmailAddressCell *)[tableView dequeueReusableCellWithIdentifier:@"EmailCell" forIndexPath:indexPath];
        cell.emailAddressTextfield.tag = indexPath.row;
        __weak SignUpViewController *weakSelf = self;
        cell.setNextResponderForEmail = ^{
            [weakSelf nextResponderWithTag:indexPath.row withTextField:nil];
        };
        return cell;
    }
    else if (indexPath.row == 2) {
        PasswordCell *cell = (PasswordCell *)[tableView dequeueReusableCellWithIdentifier:@"PasswordCell" forIndexPath:indexPath];
        cell.passwordTextField.tag = indexPath.row;
        __weak SignUpViewController *weakSelf = self;
        cell.setNextResponderForPassword = ^{
            [weakSelf nextResponderWithTag:indexPath.row withTextField:nil];
        };
        return  cell;
    }
    else if (indexPath.row == 3) {
        PasswordCell *cell = (PasswordCell *)[tableView dequeueReusableCellWithIdentifier:@"PasswordCell" forIndexPath:indexPath];
        cell.passwordTextField.tag = indexPath.row;
        cell.passwordTextField.placeholder = @"Confirm Password";
        cell.passwordLabel.text = @"CONFIRM PASSWORD";
        __weak SignUpViewController *weakSelf = self;
        cell.setNextResponderForPassword = ^{
            [weakSelf nextResponderWithTag:indexPath.row withTextField:nil];
        };
        return cell;
    }
    else if (indexPath.row == 4)
    {
        SignUpButtonCell *cell = (SignUpButtonCell *)[tableView dequeueReusableCellWithIdentifier:@"SignUpCell" forIndexPath:indexPath];
        __weak SignUpViewController *weakSelf = self;
        cell.signUpActionBlock = ^{
            [weakSelf signUpAction];
        };
        return cell;
    }
    return nil;
}
#pragma mark - Singup button action
-(void) signUpAction
{
    
    validations = [[Validations alloc]init];
    EmailAddressCell *emailCell = (EmailAddressCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    PasswordCell *passwordCell = (PasswordCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
    PasswordCell *passwordCell1 = (PasswordCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]];
    NameViewCell *nameCell = (NameViewCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    NSString *emailID = emailCell.emailAddressTextfield.text;
    NSString *password = passwordCell.passwordTextField.text;
    //Email Validation
    if(![validations validateEmail:emailID])
    {
        emailCell.emailAddressLabel.text = @"ENTER VALID EMAIL ADDRESS";
        emailCell.emailAddressLabel.textColor = [UIColor redColor];
    }

    else if(![validations validatePassword:password])
    {
        passwordCell.passwordLabel.text = @"ENTER CORRECT PASSWORD";
        passwordCell.passwordLabel.textColor = [UIColor redColor];
    }

    else if(![passwordCell.passwordTextField.text isEqualToString:passwordCell1.passwordTextField.text])
    {
        passwordCell1.passwordLabel.text = @"PASSWORDS DOESN'T MATCH";
        passwordCell1.passwordLabel.textColor = [UIColor redColor];
    }

    else {
        NSMutableDictionary *userSignUpDetailsDictionary = [[NSMutableDictionary alloc]init];
    [userSignUpDetailsDictionary setObject:emailCell.emailAddressTextfield.text forKey:@"emailId"];
    [userSignUpDetailsDictionary setObject:nameCell.firstNameTextField.text forKey:@"firstName"];
    [userSignUpDetailsDictionary setObject:nameCell.lastNameTextField.text forKey:@"lastName"];
    [userSignUpDetailsDictionary setObject:passwordCell.passwordTextField.text forKey:@"password"];
         passwordCell.passwordLabel.text = @"";
         emailCell.emailAddressLabel.text = @"";
         passwordCell1.passwordLabel.text = @"";
        [self getSignUpResponseFromServer:@"POST" withParameters: userSignUpDetailsDictionary];
    }

}
#pragma mark - connecting to server

-(void) getSignUpResponseFromServer : (NSString *)method withParameters: (NSMutableDictionary *)parameters
{
    
    ActivityIndicatorView *activityView = [[NSBundle mainBundle] loadNibNamed:@"ActivityIndicatorView" owner:self options:nil][0];
    [self.view addSubview:activityView];
    activityView.center = self.view.center;
    
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    [[APIClient sharedAPIClient] signUpWithUserDetails:parameters WithCompletionHandler:^(NSDictionary *responseData, NSURLResponse *response, NSError *error)
     {
         if ( [[responseData objectForKey:@"ErrorCode" ]  isEqualToNumber:[ NSNumber numberWithLong:0 ] ] ) {
             UserStatusViewController *userStatusVC = [self.navigationController.storyboard instantiateViewControllerWithIdentifier:@"UserStatusVC"];
             userStatusVC.successStatus = @"SignUp";
             [self.navigationController pushViewController:userStatusVC animated:YES];
         }
         else
         {
             SignUpButtonCell *cell = (SignUpButtonCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0]];
             [cell.signUpErrorValidationLabel setHidden:NO];
             cell.signUpErrorValidationLabel.text = @"NOT VALID ATTRIBUTES";
         }
         NSLog(@"Server Response %@", responseData);
         [activityView setHidden:YES];
         [[UIApplication sharedApplication]endIgnoringInteractionEvents];
     }];
}
#pragma mark - additional methods
-(void) setFirstNameTextFieldFirstResponder
{
    NameViewCell *nameCell = (NameViewCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [nameCell.firstNameTextField becomeFirstResponder];
}


- (void)nextResponderWithTag:(NSInteger)tag withTextField:(UITextField *)textField {
    EmailAddressCell *emailCell = (EmailAddressCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    NameViewCell *nameCell = (NameViewCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    PasswordCell *passwordCell = (PasswordCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
    PasswordCell *passwordCell1 = (PasswordCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]];

    switch (tag) {
        case 0:
            if (textField == nameCell.firstNameTextField) {
                [nameCell.lastNameTextField becomeFirstResponder];
            }
            else if (textField == nameCell.lastNameTextField) {
                [emailCell.emailAddressTextfield becomeFirstResponder];
            }
            break;
        case 1:
            if (emailCell.emailAddressTextfield) {
                [passwordCell.passwordTextField becomeFirstResponder];
            }
            break;
        case 2:
            if (passwordCell.passwordTextField) {
                [passwordCell1.passwordTextField becomeFirstResponder];
            }
            break;
        case 3:
            if (passwordCell1.passwordTextField) {
                [passwordCell1.passwordTextField resignFirstResponder];
            }
            break;
    }
    
}

@end
