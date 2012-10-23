//
//  DetailViewController.h
//  irclaimsfedex
//
//  Created by Ryan Taylor on 10/16/12.
//  Copyright (c) 2012 Ryan Taylor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DocumentInfo.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIScrollViewDelegate,UIAlertViewDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (strong, nonatomic) DocumentInfo *document;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UILabel *currentPageDescription;
@property (weak, nonatomic) IBOutlet UILabel *currentPageNumber;
@property (weak, nonatomic) IBOutlet UILabel *totalPageCount;
@property (weak, nonatomic) IBOutlet UILabel *ofLabel;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

-(IBAction)handleSwipe: (UISwipeGestureRecognizer *) recognizer;

@end
