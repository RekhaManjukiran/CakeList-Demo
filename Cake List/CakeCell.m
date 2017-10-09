//
//  CakeCell.m
//  Cake List
//
//  Created by Stewart Hart on 19/05/2015.
//  Copyright (c) 2015 Stewart Hart. All rights reserved.
//

#import "CakeCell.h"
#import "URLHelper.h"

@implementation CakeCell

-(void)configureImageViewWithURLString:(NSString *)urlString {
    
    [URLHelper retrieveDataForURLString:urlString onCompletion:^(NSData * _Nullable data, NSError * _Nullable error) {
        if (data) {
            NSLog(@"%@",urlString);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.cakeImageView setImage:[UIImage imageWithData:data]];
            });
        }
    }];
}
@end
