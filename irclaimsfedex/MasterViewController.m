//
//  MasterViewController.m
//  irclaimsfedex
//
//  Created by Ryan Taylor on 10/16/12.
//  Copyright (c) 2012 Ryan Taylor. All rights reserved.
//

#import "MasterViewController.h"
#import "DataBuilder.h"
#import "DocumentInfo.h"
#import "DetailViewController.h"

@interface MasterViewController () {
    NSMutableArray* data;
}
@end

@implementation MasterViewController

@synthesize containers,name;

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //self.navigationItem.leftBarButtonItem = self.editButtonItem;

    //UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    //self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    if (containers == NULL){
        self.title = @"File Content";
        DataBuilder* builder = [[DataBuilder alloc] init];
        [builder createData];
        data = [builder getData];
    }
    else{
        data = containers;
        self.title = name;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!data) {
        data = [[NSMutableArray alloc] init];
    }
    [data insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    Structure* structure = [data objectAtIndex:indexPath.row];
    cell.textLabel.text = structure.description;
    if (structure.type == Folder){
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        cell.imageView.image = [UIImage imageNamed:@"folder.png"];
    }
    else if (structure.type == Document){
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
                cell.imageView.image = [UIImage imageNamed:@"document.png"];
    }
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [data removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Structure* structure = [data objectAtIndex:indexPath.row];
    NSMutableArray* children = structure.children;
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPad" bundle:[NSBundle mainBundle]];
    if (structure.type == Folder){
        MasterViewController  *controller = [storyBoard instantiateViewControllerWithIdentifier:@"master"];
        
        //controller.managedObjectContext = self.managedObjectContext;
        //controller.title = catalogue.name;
        controller.containers = children;
        controller.name = structure.description;
        [[self navigationController] pushViewController:controller animated:YES];
        self.detailViewController.document = NULL;
    }
    else if (structure.type == Document){
    
    
        //DetailViewController *controller = [storyBoard instantiateViewControllerWithIdentifier:@"detail"];

        //controller.managedObjectContext = self.managedObjectContext;
        //controller.title = catalogue.name;
        //DocumentInfo *document = [[DocumentInfo alloc] init];
        //document.documentDescription = structure.description;
        
        DocumentInfo * info = (DocumentInfo *) structure;
        
        //controller.document = info;
        
        //[[self navigationController] pushViewController:controller animated:YES];
        
        self.detailViewController.document = info;
        self.detailViewController.detailItem = @"1";
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = data[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
