//
//  SignUpViewController.h
//  Stipend
//
//  Created by Naveen Katari on 30/11/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, NSURLConnectionDelegate>

@property (strong, nonatomic) IBOutlet UITableView *signupTableView;

@end
