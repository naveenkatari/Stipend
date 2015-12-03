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

@interface SignUpViewController ()
{
    Validations *validations;
    NSMutableDictionary *userSignUpDetailsDictionary;
    NSMutableData *mutableData;
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
    userSignUpDetailsDictionary = [[NSMutableDictionary alloc]init];
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
//    else
//    {
//        emailCell.emailAddressLabel.text = @"";
//    }
    
    //Password validation
    else if(![validations validatePassword:password])
    {
        passwordCell.passwordLabel.text = @"Enter correct password";
        passwordCell.passwordLabel.textColor = [UIColor redColor];
    }
//    else {
//        passwordCell.passwordLabel.text = @"";
//    }
    //Confirm password validation
    else if(![passwordCell.passwordTextField.text isEqualToString:passwordCell1.passwordTextField.text])
    {
        passwordCell1.passwordLabel.text = @"Passwords doesn't match";
        passwordCell1.passwordLabel.textColor = [UIColor redColor];
    }
//    else{
//        passwordCell1.passwordLabel.text = @"";
//    }
    else {
    [userSignUpDetailsDictionary setObject:emailCell.emailAddressTextfield.text forKey:@"emailID"];
    [userSignUpDetailsDictionary setObject:nameCell.firstNameTextField.text forKey:@"firstName"];
    [userSignUpDetailsDictionary setObject:nameCell.lastNameTextField.text forKey:@"lastName"];
    [userSignUpDetailsDictionary setObject:passwordCell.passwordTextField.text forKey:@"password"];
         passwordCell.passwordLabel.text = @"";
         emailCell.emailAddressLabel.text = @"";
         passwordCell1.passwordLabel.text = @"";
        [self sendSignUpDetailsToServer:@"POST" withParameters: userSignUpDetailsDictionary];
    }

}

-(void) sendSignUpDetailsToServer : (NSString *)method withParameters: (NSMutableDictionary *)parameters
{
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];

    NSMutableURLRequest *urlRequest;
    NSString *urlString = @"http://mystipendappelasticloadbalancer-178615218.us-west-2.elb.amazonaws.com:8080/Stipend/userSignUp";
    if([method isEqualToString:@"POST"])
    {
        NSURL *url = [NSURL URLWithString:urlString];
        urlRequest = [NSMutableURLRequest requestWithURL: url];
        urlRequest = [NSMutableURLRequest requestWithURL:url];
        
        NSData *signUpData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];
        [urlRequest setHTTPBody:signUpData];
        [urlRequest setHTTPMethod:@"POST"];
        [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    }
    
    
    
    
    NSURLSessionDataTask * dataTask =[defaultSession dataTaskWithRequest :urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        //Handle your response here
        if(!error)
        {
            [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:YES];
            NSString *requestReply = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
            NSLog(@"requestReply: %@", requestReply);
        }
    }];
    [dataTask resume];
}

    
        /*************************************************/
    
//    if([method isEqualToString:@"POST"])
//    {
//        url = [NSURL URLWithString: @"http://mystipendappelasticloadbalancer-178615218.us-west-2.elb.amazonaws.com:8080/Stipend/userSignUp"];
//        urlRequest = [NSMutableURLRequest requestWithURL:url];
//        NSData *signUpData = [NSJSONSerialization dataWithJSONObject:userSignUpDetailsDictionary options:0 error:nil];
//        [urlRequest setHTTPBody:signUpData];
//        }
//    [urlRequest setHTTPMethod:@"POST"];
//    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:urlRequest delegate:self];
//    if(connection)
//    {
//        mutableData = [NSMutableData new];
//    }
//    else{
//        NSLog(@"No connection");
//    }
//}
//-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
//{
//    [mutableData setLength:0];
//}
//-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
//{
//    [mutableData appendData:data];
//}
//-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
//{
//    NSLog(@"Error Code : -1");
//    NSLog(@"Status : Not Valid attributes");
//}
//- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
//    
//    NSString *responseStringWithEncoded = [[NSString alloc] initWithData: mutableData encoding:NSUTF8StringEncoding];
//    //NSLog(@"Response from Server : %@", responseStringWithEncoded);
//    NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[responseStringWithEncoded dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
//    NSLog(@"Response from Server : %@", attrStr);
//    
//}
/*************************************************/
@end
