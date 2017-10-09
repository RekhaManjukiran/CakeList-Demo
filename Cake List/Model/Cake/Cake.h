//
//  Cake.h
//  Cake List
//
//  Created by Manju Kiran on 09/10/2017.
//  Copyright © 2017 Stewart Hart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cake : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *cakeDescription;
@property (strong, nonatomic) NSString *imageUrl;

+(NSMutableArray <Cake *> *)parseResponseJSON:(NSData *)jsonData;
@end
