//
//  Validations.h
//  Stipend
//
//  Created by Naveen Katari on 01/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validations : NSObject
-(BOOL) validateEmail :(NSString *) emailToValidate;
-(BOOL) validatePassword :(NSString *) passwordToValidate;
@end
