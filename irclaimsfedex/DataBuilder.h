//
//  DataBuilder.h
//  testmasterdetail
//
//  Created by Ryan Taylor on 9/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Structure.h"

@interface DataBuilder : NSObject

-(void)createData;
-(NSMutableArray*)getChildrenForId: (NSString*)containerId;
-(NSMutableArray*)getData;

@end
