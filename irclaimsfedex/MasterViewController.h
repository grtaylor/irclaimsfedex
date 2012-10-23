//
//  MasterViewController.h
//  irclaimsfedex
//
//  Created by Ryan Taylor on 10/16/12.
//  Copyright (c) 2012 Ryan Taylor. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (nonatomic, strong) NSMutableArray *containers;
@property (nonatomic, strong) NSString *name;

@end
