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
    [self.signupTableView registerNib:[UINib nibWithNibName:@"NameViewCell" bundle:nil] forCellReuseIdentifier:@"NameCell"];
    [self.signupTableView registerNib:[UINib nibWithNibName:@"EmailAddressCell" bundle:nil] forCellReuseIdentifier:@"EmailCell"];
    [self.signupTableView registerNib:[UINib nibWithNibName:@"PasswordCell" bundle:nil] forCellReuseIdentifier:@"PasswordCell"];
    [self.signupTableView registerNib:[UINib nibWithNibName:@"SignUpButtonCell" bundle:nil] forCellReuseIdentifier:@"SignUpCell"];
    _signupTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) viewDidAppear:(BOOL)animated
{
    [self setFirstNameTextFieldFirstResponder];
}
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
    cell.separatorInset = UIEdgeInsetsMake(0, 1000, 0, 0);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    }
   else if (indexPath.row == 1)
    {
        EmailAddressCell *cell = (EmailAddressCell *)[tableView dequeueReusableCellWithIdentifier:@"EmailCell" forIndexPath:indexPath];
        cell.separatorInset = UIEdgeInsetsMake(0, 1000, 0, 0);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        __weak SignUpViewController *weakSelf = self;
        cell.emailTextFieldActionBlock = ^{
            [weakSelf emailTextFieldAction];
        };

        return cell;
    }
    else if (indexPath.row == 2) {
        PasswordCell *cell = (PasswordCell *)[tableView dequeueReusableCellWithIdentifier:@"PasswordCell" forIndexPath:indexPath];
        cell.separatorInset = UIEdgeInsetsMake(0, 1000, 0, 0);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return  cell;
    }
    else if (indexPath.row == 3) {
        PasswordCell *cell = (PasswordCell *)[tableView dequeueReusableCellWithIdentifier:@"PasswordCell" forIndexPath:indexPath];
        cell.separatorInset = UIEdgeInsetsMake(0, 1000, 0, 0);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.passwordTextField.placeholder = @"Confirm Password";
        cell.passwordLabel.text = @"CONFIRM PASSWORD";
        return cell;
        
    }
    else if (indexPath.row == 4)
    {
        SignUpButtonCell *cell = (SignUpButtonCell *)[tableView dequeueReusableCellWithIdentifier:@"SignUpCell" forIndexPath:indexPath];
        cell.separatorInset = UIEdgeInsetsMake(0, 1000, 0, 0);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        __weak SignUpViewController *weakSelf = self;
        cell.signUpActionBlock = ^{
            [weakSelf signUpAction];
        };
        return cell;
    }
    return nil;
}
-(void) emailTextFieldAction
{
    
    EmailAddressCell *emailCell = (EmailAddressCell *)[self.signupTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    emailCell.emailIDSeparatorView.backgroundColor = [UIColor colorWithRed:78.0f/255.0f green:208.0f/255.0f blue:225.0f/255.0f alpha:1];
}
-(void) signUpAction
{
    
    validations = [[Validations alloc]init];
    EmailAddressCell *emailCell = (EmailAddressCell *)[self.signupTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    PasswordCell *passwordCell = (PasswordCell *)[self.signupTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
    PasswordCell *passwordCell1 = (PasswordCell *)[self.signupTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]];
    NameViewCell *nameCell = (NameViewCell *)[self.signupTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    NSString *emailID = emailCell.emailAddressTextfield.text;
    NSString *password = passwordCell.passwordTextField.text;
    //Email Validation
    if(![validations validateEmail:emailID])
    {
        emailCell.emailAddressLabel.text = @"Enter valid email address";
        emailCell.emailAddressLabel.textColor = [UIColor redColor];
    }

    else if(![validations validatePassword:password])
    {
        passwordCell.passwordLabel.text = @"Enter correct password";
        passwordCell.passwordLabel.textColor = [UIColor redColor];
    }

    else if(![passwordCell.passwordTextField.text isEqualToString:passwordCell1.passwordTextField.text])
    {
        passwordCell1.passwordLabel.text = @"Passwords doesn't match";
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

-(void) getSignUpResponseFromServer : (NSString *)method withParameters: (NSMutableDictionary *)parameters
{
    
    
    [[APIClient sharedAPIClient] signUpWithUserDetails:parameters WithCompletionHandler:^(NSDictionary *responseData, NSURLResponse *response, NSError *error)
     {
         NSLog(@"Server Response %@", responseData);
     }];
}
-(void) setFirstNameTextFieldFirstResponder
{
    NameViewCell *nameCell = (NameViewCell *)[self.signupTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [nameCell.firstNameTextField becomeFirstResponder];
}
@end
