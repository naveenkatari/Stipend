//
//  ServerAPI.h
//  Stipend
//
//  Created by Naveen Katari on 03/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIClient : NSObject <NSURLConnectionDelegate>

//-(void) sendSignUpDetailsToServer : (NSString *) method;
//@property (nonatomic, strong) NSMutableDictionary *userSignUpDetailsDictionary;
//@property (nonatomic, strong) NSMutableData *mutableData;

+(id) sharedInstance;
@end
