//
//  Structure.h
//  testmasterdetail
//
//  Created by Ryan Taylor on 9/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Structure : NSObject

typedef enum {
    File,
    Folder,
    Document
} ContainerType;

@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSMutableArray *children;
@property (nonatomic, strong) NSString *containerId;
@property (nonatomic, strong) NSDate *date;
@property ContainerType type;

@end

