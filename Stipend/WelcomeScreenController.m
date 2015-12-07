//
//  ViewController.m
//  Stipend
//
//  Created by Naveen Katari on 25/11/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "WelcomeScreenController.h"
#import "TermsandConditionsVC.h"
#import "PrivacyPolicyVC.h"

@interface WelcomeScreenController ()

@end

@implementation WelcomeScreenController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:77.0f/255.0f green:208.0f/255.0f blue:225.0f/255.0f alpha:0.5f]];

}
-(void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)termsAndConditions:(id)sender
{
    TermsandConditionsVC *viewController = [self.navigationController.storyboard instantiateViewControllerWithIdentifier:@"TermsAndConditionsVC"];
    [self.navigationController pushViewController:viewController animated:YES];
}
- (IBAction)privacyPolicy:(id)sender
{
    PrivacyPolicyVC *viewController = [self.navigationController.storyboard instantiateViewControllerWithIdentifier:@"PrivacyPolicyVC"];
    [self.navigationController pushViewController:viewController animated:YES];
}


@end
