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
@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.signupTableView registerNib:[UINib nibWithNibName:@"NameViewCell" bundle:nil] forCellReuseIdentifier:@"NameCell"];
    [self.signupTableView registerNib:[UINib nibWithNibName:@"EmailAddressCell" bundle:nil] forCellReuseIdentifier:@"EmailCell"];
    [self.signupTableView registerNib:[UINib nibWithNibName:@"PasswordCell" bundle:nil] forCellReuseIdentifier:@"PasswordCell"];
    _signupTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0f;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
    NameViewCell *cell = (NameViewCell *)[tableView dequeueReusableCellWithIdentifier:@"NameCell" forIndexPath:indexPath];
    cell.separatorInset = UIEdgeInsetsMake(0, 1000, 0, 0);
    return cell;
    }
    if (indexPath.row == 1)
    {
        EmailAddressCell *cell = (EmailAddressCell *)[tableView dequeueReusableCellWithIdentifier:@"EmailCell" forIndexPath:indexPath];
        cell.separatorInset = UIEdgeInsetsMake(0, 1000, 0, 0);
        return cell;
    }
    if (indexPath.row == 2) {
        PasswordCell *cell = (PasswordCell *)[tableView dequeueReusableCellWithIdentifier:@"PasswordCell" forIndexPath:indexPath];
        cell.separatorInset = UIEdgeInsetsMake(0, 1000, 0, 0);
        return  cell;
    }
    if (indexPath.row == 3) {
        PasswordCell *cell = (PasswordCell *)[tableView dequeueReusableCellWithIdentifier:@"PasswordCell" forIndexPath:indexPath];
        cell.separatorInset = UIEdgeInsetsMake(0, 1000, 0, 0);
        cell.passwordTextField.placeholder = @"Confirm Password";
        cell.passwordLabel.text = @"CONFIRM PASSWORD";
        return cell;
        
    }
    return nil;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
