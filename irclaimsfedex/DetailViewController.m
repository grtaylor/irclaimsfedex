//
//  DetailViewController.m
//  irclaimsfedex
//
//  Created by Ryan Taylor on 10/16/12.
//  Copyright (c) 2012 Ryan Taylor. All rights reserved.
//

#import "DetailViewController.h"
#import "PageInfo.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <MediaPlayer/MediaPlayer.h>
#import "AddPageViewController.h"

@interface DetailViewController ()
{
    PageInfo *currentPage;
    UIImage *currentPicture;
}
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
- (void)setPageInfo:(PageInfo *)thePage;

@end

@implementation DetailViewController

@synthesize document;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        
    }
    [self configureView];
    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
    if (document != nil){
        currentPage = [document.pages objectAtIndex:0];
        [self setTheTotalPageCount: [NSString stringWithFormat:@"%d",document.pages.count]];
        [self setPageInfo:currentPage];
        self.title = document.description;
        
    }
    [self setPageInfoVisible:document == nil];

}

-(void) setTheTotalPageCount:(NSString *)pageCount{
    [self.totalPageCount setText: pageCount];
}

-(void)setPageInfoVisible:(BOOL)visible{
    [self.currentPageDescription setHidden:visible];
    [self.currentPageNumber setHidden:visible];
    [self.totalPageCount setHidden:visible];
    [self.ofLabel setHidden:visible];
}

-(void)setPageInfo:(PageInfo *)thePage{
    [self.currentPageDescription setText:thePage.pageDescription];
    NSString *theString = [NSString stringWithFormat:@"%d", thePage.pageNumber];
    [self.currentPageNumber setText:theString];
    UIImage *image;
    if (!thePage.actualImage){
        image = [UIImage imageNamed:thePage.pageFileName];
    }
    else {
        image = thePage.actualImage;
    }
    
    //self.imageView.clipsToBounds = YES;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.scrollview.autoresizingMask = self.imageView.autoresizingMask;
    //[self.imageView sizeToFit];
    //[self.scrollview sizeToFit];
    //self.scrollview.clipsToBounds = YES;
    //self.imageView.bounds = CGRectMake(0, 0, image.size.width, image.size.height);
    //self.scrollview.contentSize = image.size;
    //self.imageView.frame = CGRectMake(0, 0, image.size.width/10, image.size.height/10);
    [self.imageView setImage:image];
    //self.scrollview.frame = self.imageView.frame;
    //self.scrollview.contentMode = UIViewContentModeScaleAspectFit;
    //self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    //self.scrollview.contentSize = self.imageView.image.size;
        //[self.imageView sizeToFit];
    
}
-(void)scrollViewDidZoom:(UIScrollView *)scrollView{
    if (scrollView.zoomScale > 1.0)
    {
        scrollView.scrollEnabled = TRUE;
    } else {
        scrollView.scrollEnabled = FALSE;
    }
}



//-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    CGFloat pageWidth = self.scrollview.frame.size.width;
//    int page = floor((self.scrollview.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
//    self.pageControl.currentPage = page;
//}

- (IBAction) handleSwipe:(UISwipeGestureRecognizer *) recognizer{
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft){
        // take current page and add one
        if (currentPage.pageNumber < [document.pages count]){
            currentPage = [document.pages objectAtIndex:(currentPage.pageNumber + 0)];
            [self setPageInfo:currentPage];
        }
        
        //UIImage *image = [UIImage imageNamed:@"chess_cat_postcard.jpg"];//[[UIImage alloc] initWithContentsOfFile:@"Pensive_Parakeet.jpg"];
        //[self.imageView setImage:image];
    }
    else if (recognizer.direction == UISwipeGestureRecognizerDirectionRight){
        //UIImage *image = [UIImage imageNamed:@"Pensive_Parakeet.jpg"];//[[UIImage alloc] initWithContentsOfFile:@"Pensive_Parakeet.jpg"];
        //[self.imageView setImage:image];
        if (currentPage.pageNumber > 1){
            currentPage = [document.pages objectAtIndex:(currentPage.pageNumber - 2)];
            [self setPageInfo:currentPage];
        }
    }
}


-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}


-(void)viewDidAppear:(BOOL)animated{
        [self setupAppearance];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    self.scrollview.minimumZoomScale = 0.4;
    self.scrollview.maximumZoomScale = 1.5;
    self.scrollview.delegate = self;
    //self.scrollview.contentSize = CGSizeMake(1280, 960);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"File", @"File");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

-(void) setupAppearance
{
    UIBarButtonItem *cameraBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(takePicture:)];
    UIBarButtonItem *videoBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(takeVideo:)];
    //NSArray * intakeModes = [[NSArray alloc] initWithObjects:cameraBarButtonItem,videoBarButtonItem, nil];
    NSArray * intakeModes = [[NSArray alloc] initWithObjects:cameraBarButtonItem, nil];
    [[self navigationItem] setRightBarButtonItems:intakeModes];
}

-(void) takeVideo:(id) sender
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
        imagePicker.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *)kUTTypeMovie, nil];
    }
    else
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [imagePicker setDelegate:self];
    //UIPopoverController *popOverController = [[UIPopoverController alloc] initWithContentViewController:imagePicker];
    //popOverController.delegate = self;
    //[popOverController presentPopoverFromRect:((UIButton *)sender).bounds inView:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
    //[self.masterPopoverController presentViewController:imagePicker animated:true completion:nil];
    [self presentModalViewController:imagePicker animated:YES];
}

-(void) takePicture:(id) sender
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    else
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [imagePicker setDelegate:self];
    
    [self presentModalViewController:imagePicker animated:YES];
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if (CFStringCompare((CFStringRef) mediaType, kUTTypeMovie, 0) == kCFCompareEqualTo){
        NSString *moviePath = [[info objectForKey:UIImagePickerControllerMediaURL] path];
        UISaveVideoAtPathToSavedPhotosAlbum(moviePath, nil, nil, nil);
        
        MPMoviePlayerController *player = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:moviePath]];
        player.view.frame = CGRectMake(184, 200, 400, 300);
        [self.view addSubview:player.view];
        [player play];
    }
    else{
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        currentPicture = image;
        //UIStoryboard *storyBoard = self.storyboard;
        
        //AddPageViewController *pageview = [[AddPageViewController alloc] init];
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"New Page Dialog" message:@"Please enter a description for this photo." delegate:self cancelButtonTitle:@"Continue" otherButtonTitles:nil];
        alert.alertViewStyle = UIAlertViewStylePlainTextInput;
        UITextField * alertTextField = [alert textFieldAtIndex:0];
        alertTextField.keyboardType = UIKeyboardTypeDefault;
        alertTextField.placeholder = @"Page Description";
        [alert show];
        //AddPageViewController *pageview = [storyBoard instantiateViewControllerWithIdentifier:@"addPage"];
        //pageview.theImage = image;
        //[self presentModalViewController:pageview animated:YES];
        //[self.imageView setImage:image];
    }
    [self dismissModalViewControllerAnimated:YES];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *pageDescription = [[alertView textFieldAtIndex:0] text];
    PageInfo *thePageInfo = [[PageInfo alloc] init];
    thePageInfo.pageDescription = pageDescription;
    thePageInfo.pageNumber = [document.pages count] + 1;
    thePageInfo.pageId = @"14";
    thePageInfo.actualImage = currentPicture;
    [document.pages addObject:thePageInfo];
    [self setTheTotalPageCount: [NSString stringWithFormat:@"%d",document.pages.count]];
    currentPage = thePageInfo;
    [self setPageInfo:thePageInfo];
}

@end
