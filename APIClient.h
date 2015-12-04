//
//  ServerAPI.h
//  Stipend
//
//  Created by Naveen Katari on 03/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIClient : NSObject
//-(void) sendSignUpDetailsToServer : (NSString *) method;
//@property (nonatomic, strong) NSMutableDictionary *userSignUpDetailsDictionary;
//@property (nonatomic, strong) NSMutableData *mutableData;

+ sharedAPIClient;
-(id)initWithBaseUrl: (NSURL *) url;
+(NSURL *) baseUrl;

-(void) GET : (NSString *)apiName withParameters : (NSDictionary *)parameters withCompletionHandler:(void(^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler;

-(void) POST : (NSString *)apiName withParameters : (NSDictionary *)parameters withCompletionHandler:(void(^)(NSDictionary *responseData, NSURLResponse *response, NSError *error))completionHandler;

@end
