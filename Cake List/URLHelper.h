//
//  URLHelper.h
//  Cake List
//
//  Created by Rekha Manju Kiran on 09/10/2017.
//  Copyright © 2017 Stewart Hart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLHelper : NSObject

+(void)retrieveDataForURLString:(NSString *_Nullable)urlString
                   onCompletion:(void (^_Nullable)(NSData * _Nullable data,
                                          NSError * _Nullable error))completionHandler;

@end
