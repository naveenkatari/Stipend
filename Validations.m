//
//  Validations.m
//  Stipend
//
//  Created by Naveen Katari on 01/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "Validations.h"

@implementation Validations
//Email validation method
-(BOOL) validateEmail:(NSString *)emailToValidate
{
    NSString *regexForEmailAddress = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailValidation = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regexForEmailAddress];
    return [emailValidation evaluateWithObject:emailToValidate];
}
-(BOOL) validatePassword:(NSString *)passwordToValidate
{
    NSString *regexForPassword = @"[a-zA-Z0-9]+";
    NSPredicate *passwordValidation = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexForPassword];
    return [passwordValidation evaluateWithObject:passwordToValidate];
}
@end
