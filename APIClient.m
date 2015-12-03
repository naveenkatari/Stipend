//
//  ServerAPI.m
//  Stipend
//
//  Created by Naveen Katari on 03/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "APIClient.h"

@implementation APIClient

#pragma mark Singleton Methods

+(id) sharedInstance;



//-(void) sendSignUpDetailsToServer : (NSString *) method : (NSDictionary *) dictionary
//{
//    NSURL *url;
//    NSMutableURLRequest *urlRequest;
//    
//    if([method isEqualToString:@"POST"])
//    {
//        url = [NSURL URLWithString: @"http://mystipendappelasticloadbalancer-178615218.us-west-2.elb.amazonaws.com:8080/Stipend/userSignUp"];
//        urlRequest = [NSMutableURLRequest requestWithURL:url];
//        NSData *signUpData = [NSJSONSerialization dataWithJSONObject:self.userSignUpDetailsDictionary options:0 error:nil];
//        [urlRequest setHTTPBody:signUpData];
//    }
//    [urlRequest setHTTPMethod:@"POST"];
//    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:urlRequest delegate:self];
//    if(connection)
//    {
//       _mutableData = [NSMutableData new];
//    }
//    else{
//        NSLog(@"No connection");
//    }
//}
//-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
//{
//    [self.mutableData setLength:0];
//}
//-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
//{
//    [self.mutableData appendData:data];
//}
//-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
//{
//    NSLog(@"Error Code : -1");
//    NSLog(@"Status : Not Valid attributes");
//}
//- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
//    
//    NSString *responseStringWithEncoded = [[NSString alloc] initWithData: self.mutableData encoding:NSUTF8StringEncoding];
//    //NSLog(@"Response from Server : %@", responseStringWithEncoded);
//  //  NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[responseStringWithEncoded dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
//   // NSLog(@"Response from Server : %@", attrStr);
//}
//
//

@end
