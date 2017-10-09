//
//  URLHelper.m
//  Cake List
//
//  Created by Manju Kiran on 09/10/2017.
//  Copyright © 2017 Stewart Hart. All rights reserved.
//

#import "URLHelper.h"

@implementation URLHelper

+(void)retrieveDataForURLString:(NSString *_Nullable)urlString
                   onCompletion:(void (^)(NSData * _Nullable data,
                                          NSError * _Nullable error))completionHandler {
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
    
    //create the Method "GET"
    [urlRequest setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                      {
                                          NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                                          if(httpResponse.statusCode == 200)
                                          {
                                              if(completionHandler){
                                                  completionHandler(data,nil);
                                              }
                                          }
                                          else
                                          {
                                              if(completionHandler){
                                                  completionHandler(nil,error);
                                              }
                                              NSLog(@"Error");
                                          }
                                      }];
    [dataTask resume];
}
@end
