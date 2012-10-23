//
//  DocumentInfo.h
//  testmasterdetail
//
//  Created by Ryan Taylor on 9/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Structure.h"

@interface DocumentInfo : Structure

@property (strong, nonatomic) NSMutableArray *pages;
@property (strong, nonatomic) NSString *documentDescription;
@property (strong, nonatomic) NSString *documentId;

@end
