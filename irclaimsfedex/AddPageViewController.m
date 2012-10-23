//
//  AddPageViewController.m
//  irclaimsfedex
//
//  Created by Ryan Taylor on 10/18/12.
//  Copyright (c) 2012 Ryan Taylor. All rights reserved.
//

#import "AddPageViewController.h"

@interface AddPageViewController ()

@end

@implementation AddPageViewController

@synthesize theImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIBarButtonItem *cameraBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(savePage:)];
    
    UIBarButtonItem *cameraBarButtonItem2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelPage:)];
    self.imageview.image = theImage;
    //NSArray * intakeModes = [[NSArray alloc] initWithObjects:cameraBarButtonItem,videoBarButtonItem, nil];
    //NSArray * intakeModes = [[NSArray alloc] initWithObjects:cameraBarButtonItem, nil];
    [[self navigationItem] setRightBarButtonItem:cameraBarButtonItem];
    [[self navigationItem] setLeftBarButtonItem:cameraBarButtonItem2];
}

-(void) savePage:(id) sender
{
    
}

-(void) cancelPage:(id) sender
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
