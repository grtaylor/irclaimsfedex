//
//  DetailViewController.h
//  irclaimsfedex
//
//  Created by Ryan Taylor on 10/16/12.
//  Copyright (c) 2012 Ryan Taylor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
