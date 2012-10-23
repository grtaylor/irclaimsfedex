//
//  PageInfo.h
//  testmasterdetail
//
//  Created by Ryan Taylor on 9/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PageInfo : NSObject

@property (strong, nonatomic) NSString *pageDescription;
@property (strong, nonatomic) NSString *pageId;
@property (strong, nonatomic) NSString *pageFileName;
@property (strong, nonatomic) UIImage *actualImage;
@property NSInteger pageNumber;
@end
