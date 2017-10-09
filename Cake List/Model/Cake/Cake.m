//
//  Cake.m
//  Cake List
//
//  Created by Rekha Manju Kiran on 09/10/2017.
//  Copyright © 2017 Stewart Hart. All rights reserved.
//

#import "Cake.h"

@implementation Cake

+(NSMutableArray <Cake *> *)parseResponseJSON:(NSData *)jsonData{
    
    NSError *parseError = nil;
    NSArray *responseArray = [NSJSONSerialization JSONObjectWithData:jsonData
                                                             options:0
                                                               error:&parseError];
    if(parseError){
        NSLog(@"%@",parseError);
        return [NSMutableArray new]; // Return empty array but log the error
    }else{
        NSMutableArray *cakeObjectsArray = [NSMutableArray new];
        for (NSDictionary *cakeDict in responseArray) {
            Cake *cake = [Cake new];
            cake.title = cakeDict[@"title"];
            cake.cakeDescription = cakeDict[@"desc"];
            cake.imageUrl = cakeDict[@"image"];
            [cakeObjectsArray addObject:cake];
        }
        return cakeObjectsArray;
    }
}
@end
