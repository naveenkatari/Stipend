//
//  SignInStatusVC.h
//  Stipend
//
//  Created by Naveen Katari on 04/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserStatusViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *userSuccessLabel;
@property (nonatomic,strong) NSString *successStatus;

@end
