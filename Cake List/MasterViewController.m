//
//  MasterViewController.m
//  Cake List
//
//  Created by Stewart Hart on 19/05/2015.
//  Copyright (c) 2015 Stewart Hart. All rights reserved.
//

#import "MasterViewController.h"
#import "CakeCell.h"
#import "Cake.h"
#import "Globals/Globals.h"
#import "URLHelper.h"

@interface MasterViewController ()
@property (strong, nonatomic) NSMutableArray<Cake *> *cakeObjectsArray;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self retrieveCakeData];
}

#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cakeObjectsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CakeCell *cell = (CakeCell*)[tableView dequeueReusableCellWithIdentifier:@"CakeCell"];
    Cake *cake = self.cakeObjectsArray[indexPath.row];
    cell.titleLabel.text = cake.title;
    cell.descriptionLabel.text = cake.cakeDescription;
    [cell configureImageViewWithURLString:cake.imageUrl];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)retrieveCakeData {
    
    [URLHelper retrieveDataForURLString:CakeListURL onCompletion:^(NSData * _Nullable data,
                                                                   NSError * _Nullable error) {
        
        if(error){
            // Show Alert
        } else {
            self.cakeObjectsArray = [Cake parseResponseJSON:data];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        };
    }];
};

@end
