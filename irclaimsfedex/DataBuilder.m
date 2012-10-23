//
//  DataBuilder.m
//  testmasterdetail
//
//  Created by Ryan Taylor on 9/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DataBuilder.h"
#import "Structure.h"
#import "PageInfo.h"
#import "DocumentInfo.h"

@implementation DataBuilder

{
    NSMutableArray *fileContent;
}

-(void)createData{
    
    Structure *container;
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    container = [[Structure alloc] init];
    container.containerId = @"1";
    container.description = @"Folder 1";
    container.type = Folder;
    container.date = [calendar dateFromComponents:dateComponents];
    
    
    Structure *child1;
    
    child1 = [[Structure alloc] init];
    child1.containerId = @"1";
    child1.description = @"Child 1";
    child1.type = Folder;
    child1.date = [calendar dateFromComponents:dateComponents];
    
    DocumentInfo *subchild1;
    
    // the pages
    PageInfo *page1 = [[PageInfo alloc] init];
    page1.pageDescription = @"Welcome to the jungle";
    page1.pageId = @"1";
    page1.pageFileName = @"fire.jpg";
    page1.pageNumber = 1;
    
    PageInfo *page2 = [[PageInfo alloc] init];
    page2.pageDescription = @"We've got fun and games";
    page2.pageId = @"2";
    page2.pageFileName = @"ice.jpg";
    page2.pageNumber = 2;
    
    PageInfo *page3 = [[PageInfo alloc] init];
    page3.pageDescription = @"Call Me Maybe";
    page3.pageId = @"3";
    page3.pageFileName = @"tree.jpg";
    page3.pageNumber = 3;
    
    subchild1 = [[DocumentInfo alloc] init];
    subchild1.containerId = @"1";
    subchild1.description = @"Sub Child 1";
    subchild1.type = Document;
    subchild1.date = [calendar dateFromComponents:dateComponents];
    //DocumentInfo * doc1 = (DocumentInfo *) subchild1;
    subchild1.pages = [[NSMutableArray alloc] init];
    [subchild1.pages addObject:page1];
    [subchild1.pages addObject:page2];
    [subchild1.pages addObject:page3];
    
    child1.children = [[NSMutableArray alloc] init];
    [child1.children addObject:subchild1];
    
    container.children = [[NSMutableArray alloc] init];
    [container.children addObject:child1];

    fileContent = [[NSMutableArray alloc] init];
    [fileContent addObject:container];
    
    DocumentInfo* container2 = [[DocumentInfo alloc] init];
    container2.containerId = @"2";
    container2.description = @"Document 1";
    container2.type = Document;
    container2.date = [calendar dateFromComponents:dateComponents];
    
    PageInfo *page11 = [[PageInfo alloc] init];
    page11.pageDescription = @"Take me out to the ballgame";
    page11.pageId = @"11";
    page11.pageFileName = @"chess_cat_postcard.jpg";
    page11.pageNumber = 1;
    
    PageInfo *page12 = [[PageInfo alloc] init];
    page12.pageDescription = @"take me out to the crowd";
    page12.pageId = @"12";
    page12.pageFileName = @"Pensive_Parakeet.jpg";
    page12.pageNumber = 2;
    
    PageInfo *page13 = [[PageInfo alloc] init];
    page13.pageDescription = @"Refrigerator";
    page13.pageId = @"13";
    page13.pageFileName = @"papers.jpg";
    page13.pageNumber = 3;
    
    //DocumentInfo * doc1 = (DocumentInfo *) subchild1;
    container2.pages = [[NSMutableArray alloc] init];
    [container2.pages addObject:page11];
    [container2.pages addObject:page12];
    [container2.pages addObject:page13];
    
    
    [fileContent addObject:container2];
    
    DocumentInfo* container3 = [[DocumentInfo alloc] init];
    container3.containerId = @"2";
    container3.description = @"Document 2";
    container3.type = Document;
    container3.date = [calendar dateFromComponents:dateComponents];
    
    PageInfo *page21 = [[PageInfo alloc] init];
    page21.pageDescription = @"This is another page";
    page21.pageId = @"11";
    page21.pageFileName = @"tree.jpg";
    page21.pageNumber = 1;
    
    PageInfo *page22 = [[PageInfo alloc] init];
    page22.pageDescription = @"First Notice of Loss";
    page22.pageId = @"12";
    page22.pageFileName = @"fire.jpg";
    page22.pageNumber = 2;
    
    PageInfo *page23 = [[PageInfo alloc] init];
    page23.pageDescription = @"Second notice of loss";
    page23.pageId = @"13";
    page23.pageFileName = @"ice.jpg";
    page23.pageNumber = 3;
    
    //DocumentInfo * doc1 = (DocumentInfo *) subchild1;
    container3.pages = [[NSMutableArray alloc] init];
    [container3.pages addObject:page21];
    [container3.pages addObject:page22];
    [container3.pages addObject:page23];
    
    
    [fileContent addObject:container3];
    
    DocumentInfo* container4 = [[DocumentInfo alloc] init];
    container4.containerId = @"2";
    container4.description = @"New Mail";
    container4.type = Document;
    container4.date = [calendar dateFromComponents:dateComponents];
    
    PageInfo *page31 = [[PageInfo alloc] init];
    page31.pageDescription = @"This is another page";
    page31.pageId = @"11";
    page31.pageFileName = @"Pensive_Parakeet.jpg";
    page31.pageNumber = 1;
    
    PageInfo *page32 = [[PageInfo alloc] init];
    page32.pageDescription = @"First Notice of Loss";
    page32.pageId = @"12";
    page32.pageFileName = @"chess_cat_postcard.jpg";
    page32.pageNumber = 2;
    
    PageInfo *page33 = [[PageInfo alloc] init];
    page33.pageDescription = @"Second notice of loss";
    page33.pageId = @"13";
    page33.pageFileName = @"papers.jpg";
    page33.pageNumber = 3;
    
    //DocumentInfo * doc1 = (DocumentInfo *) subchild1;
    container4.pages = [[NSMutableArray alloc] init];
    [container4.pages addObject:page31];
    [container4.pages addObject:page32];
    [container4.pages addObject:page33];
    
    
    [fileContent addObject:container4];
    
    Structure *container5 = [[Structure alloc] init];
    container5.containerId = @"1";
    container5.description = @"New Business";
    container5.type = Folder;
    container5.date = [calendar dateFromComponents:dateComponents];
    
    DocumentInfo* container6 = [[DocumentInfo alloc] init];
    container6.containerId = @"2";
    container6.description = @"New Mail";
    container6.type = Document;
    container6.date = [calendar dateFromComponents:dateComponents];
    
    PageInfo *page41 = [[PageInfo alloc] init];
    page41.pageDescription = @"This is another page";
    page41.pageId = @"11";
    page41.pageFileName = @"fire.jpg";
    page41.pageNumber = 1;
    
    PageInfo *page42 = [[PageInfo alloc] init];
    page42.pageDescription = @"First Notice of Loss";
    page42.pageId = @"12";
    page42.pageFileName = @"ice.jpg";
    page42.pageNumber = 2;
    
    PageInfo *page43 = [[PageInfo alloc] init];
    page43.pageDescription = @"Second notice of loss";
    page43.pageId = @"13";
    page43.pageFileName = @"tree.jpg";
    page43.pageNumber = 3;
    
    //DocumentInfo * doc1 = (DocumentInfo *) subchild1;
    container6.pages = [[NSMutableArray alloc] init];
    [container6.pages addObject:page41];
    [container6.pages addObject:page42];
    [container6.pages addObject:page43];
    
    container5.children = [[NSMutableArray alloc] init];
    [container5.children addObject:container6];
    
    [fileContent addObject:container5];
}

-(NSMutableArray*)getData{
    return fileContent;
}

-(NSMutableArray*)getChildrenForId: (NSString*)containerId{
    for (Structure* s in fileContent) {
       if ([[s containerId] isEqualToString:containerId])
           return s.children;
    }
    return NULL;
}

@end
