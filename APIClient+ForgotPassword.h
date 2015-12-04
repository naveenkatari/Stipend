//
//  APIClient+ForgotPassword.h
//  Stipend
//
//  Created by Naveen Katari on 04/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "APIClient.h"

@interface APIClient (ForgotPassword)

-(void)forgotPasswordOfUser:(NSDictionary *)parameters WithCompletionHandler:(void(^)(NSDictionary *responseData, NSURLResponse *response, NSError *error))completionHandler;
@end
