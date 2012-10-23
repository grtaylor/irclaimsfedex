//
//  AddPageViewController.h
//  irclaimsfedex
//
//  Created by Ryan Taylor on 10/18/12.
//  Copyright (c) 2012 Ryan Taylor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddPageViewController : UIViewController

@property (strong, nonatomic) UIImage *theImage;
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UITextField *pageDescription;

@end
