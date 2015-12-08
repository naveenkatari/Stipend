//
//  UserDetails.h
//  Stipend
//
//  Created by Naveen Katari on 08/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDetails : NSObject

@property (nonatomic, strong) NSString *userFirstName, *userLastName;
+(UserDetails*) sharedUserDetails;
@end
